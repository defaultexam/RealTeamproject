package com.restaurant.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.restaurant.admin.login.dao.LoginDao;
import com.restaurant.admin.login.service.LoginService;
import com.restaurant.admin.login.vo.LoginVO;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	Logger logger = Logger.getLogger(AdminLoginController.class);
	@Autowired
	private LoginService loginService;

	

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		logger.info("login.do get형식 호출성공");
		return "admin/login/adminLogin";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginVO") LoginVO lvo, HttpServletRequest request) {
		logger.info("login.do post형식 호출성공");
		ModelAndView mav = new ModelAndView();

		String loginResult = loginService.loginSelect(lvo);

		if (loginResult != null) {
			mav.setViewName("adminSub");
		} else {
			mav.addObject("check", 1);
			mav.setViewName("admin");
		}

		return mav;

	}

	/**************************************************************
	 * 로그아웃 처리 메서드
	 **************************************************************/
	@RequestMapping("/logout.do")
	public String logout(/* HttpSession session, HttpServletRequest request */) {
		// session.invalidate();
		// session = request.getSession(true);
		return "redirect:/manager";
	}

}
