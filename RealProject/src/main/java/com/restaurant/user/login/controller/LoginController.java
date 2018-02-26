package com.restaurant.user.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.restaurant.user.login.service.LoginService;
import com.restaurant.user.login.vo.LoginVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login() {
		logger.info("login get 호출 성공");
		return "user/login/login";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) {
		logger.info("login POST 호출 성공");
		ModelAndView mav = new ModelAndView();
		String id = lvo.getId();
		int resultData = loginService.loginHistoryInsert(lvo);
		if (resultData == 1) {
			mav.addObject("errCode", 1);
			mav.setViewName("user/login/login");
			return mav;
		} else {
			LoginVO vo = loginService.loginHistorySelect(id);
			logger.info("최근 로그인 일시 : " + new SimpleDateFormat("YYYY-MM-dd").format(vo.getLastSuccessedLogin()));
			logger.info("retry: " + vo.getRetry());
			/* 로그인 시도횟수가 5회가 넘으면 30초간 로그인 잠금 */
			if (vo.getRetry() >= 5) {
				if (new Date().getTime() - vo.getLastFailedLogin() < 30000) {
					mav.addObject("errCode", 6); /* 30초동안 로그인잠금 알림 */
					mav.setViewName("user/login/login");
					return mav;
				} else {
					vo.setRetry(0);
					vo.setLastFailedLogin(0);
					loginService.loginHistoryUpdate(vo);
				}
			}

			LoginVO loginCheckResult = loginService.loginSelect(lvo.getId(), lvo.getPassword());

			/*
			 * 로그인이 틀리면, 로그인 시도횟수를 1증가 시키고, 로그인 실패 시간을 DB에 업데이트 한다.
			 */
			if (loginCheckResult == null) {
				vo.setRetry(vo.getRetry() + 1);
				vo.setLastFailedLogin(new Date().getTime());
				loginService.loginHistoryUpdate(vo);

				mav.addObject("retry", vo.getRetry());
				mav.addObject("errCode", 1);

				mav.setViewName("user/login/login");
				return mav;

			}
			/*
			 * 로그인이 성공하면, 로그인 시도횟수를 0로 reset, 마지막으로 로그인 실패 시간 0으로 reset, 성공한 클라이언트 IP를 DB에
			 * 업데이트,로그인 성공시간 DB에 업데이트
			 */
			else {
				vo.setRetry(0);
				vo.setLastFailedLogin(0);
				vo.setLastSuccessedLogin(new Date().getTime());
				vo.setClientIP(request.getRemoteAddr());
				loginService.loginHistoryUpdate(vo);
				session.setAttribute("login", loginCheckResult);
				mav.setViewName("index");
				return mav;
			}
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/";
	}
}