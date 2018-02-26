package com.restaurant.user.register.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.restaurant.user.member.service.MemberService;
import com.restaurant.user.member.vo.MemberVO;

@Controller
@RequestMapping("/register")
public class RegisterController {
	Logger logger = Logger.getLogger(RegisterController.class);
	@Autowired
	private MemberService memberService;

	/* 주소/register (GET 메소드) */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login() {
		logger.info("register get 호출 성공");
		return "user/register/register";
	}

	/* 사용자 아이디 중복 체크 메서드 */
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm", method = RequestMethod.POST)
	public String userIdConfirm(@RequestParam("userId") String userId) {
		int result = memberService.userIdConfirm(userId);
		return result + "";
	}

	/* 주소 /register/confirm (POST 메소드) */
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo) {
		logger.info("/confirm post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		int result = 3;
		result = memberService.memberInsert(mvo);
		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // userId already exist
			mav.setViewName("user/register/register");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("user/register/registerprocess"); // success to add new member; move to login page
			logger.info("회원가입 성공, processPage로 이동 완료.");
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("user/register/register");
			break;
		}
		return mav;
	}
}