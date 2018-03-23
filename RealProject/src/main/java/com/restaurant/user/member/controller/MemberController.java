package com.restaurant.user.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.restaurant.user.member.service.MemberService;
import com.restaurant.user.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String member() {
		logger.info("/member GET 호출 성공");
		return "user/login/mypage";
	}

	/* modify 기본 JSP 출력 (GET 메소드) */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGet() {
		logger.info("modify GET 호출 성공");
		return "user/login/modify";
	}

	/* 이름, 이메일 인증 (POST 메소드) */
	@ResponseBody
	@RequestMapping(value = "/searchID", method = RequestMethod.POST)
	public String searchID(@RequestParam("searchid_name") String name, @RequestParam("searchid_email") String email) {
		logger.info("searchID POST 호출 성공");
		String result = memberService.memberSearchByName(name, email);
		return result;
	}

	/* 아이디, 이메일 인증 (POST 메소드) */
	@ResponseBody
	@RequestMapping(value = "/searchPassword", method = RequestMethod.POST)
	public String passwordReset(@RequestParam("searchpassword_id") String id,
			@RequestParam("searchpassword_email") String email) {
		logger.info("searchPassword POST 호출 성공");
		String result = memberService.memberSearchByID(id, email);
		return result;
	}

	/* 비밀번호 변경 */
	@ResponseBody
	@RequestMapping(value = "/passwordreset", method = RequestMethod.POST)
	public String passwordResetConfirm(@RequestParam("searchpassword_id") String id,
			@RequestParam("reset_password1") String password, HttpSession session, HttpServletRequest request) {
		logger.info("passwordreset POST 호출 성공");
		/* 비밀번호 변경 메소드 */
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPassword(password);
		String result;
		boolean parseresult = memberService.memberUpdate(mvo);
		result = parseresult + "";
		/* 세션 초기화 및 AJAX 리턴 */
		session.invalidate();
		session = request.getSession(true);
		return result;
	}
}
