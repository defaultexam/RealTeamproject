package com.restaurant.user.register.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.restaurant.user.mail.service.MailService;
import com.restaurant.user.member.service.MemberService;
import com.restaurant.user.member.vo.MemberVO;

@Controller
@RequestMapping("/register")
public class RegisterController {
	Logger logger = Logger.getLogger(RegisterController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailService mailService;
	/* 주소/register (GET 메소드) */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String register() {
		logger.info("register get 호출 성공");
		return "user/register/register";
	}

	/* 주소/register (GET 메소드) */
	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	public String registerterms() {
		logger.info(" /terms get 호출 성공");
		return "user/register/terms";
	}

	/* 사용자 아이디 중복 체크 메서드 */
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm", method = RequestMethod.POST)
	public String userIdConfirm(@RequestParam("userId") String userId) {
		int result = memberService.userIdConfirm(userId);
		logger.info("/userIdConfirm 메소드 호출 성공, 결과 값: " + result);
		return result + "";
	}

	/* 주소 /register/confirm (POST 메소드) */
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo) {
		ModelAndView mav = new ModelAndView();
		int result = 3;
		int couponMember_no = 0;
		result = memberService.memberInsert(mvo);
		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // userId already exist
			mav.setViewName("user/register/register");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("user/register/registerprocess"); // success to add new member; move to login page
			
			couponMember_no = memberService.memberNewMeberno(mvo.getId());
			logger.info(couponMember_no);
			memberService.memberNewCouponGive(couponMember_no);
			logger.info(mvo.getId() + "회원 가입 성공, processPage로 이동 완료.");
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("user/register/register");
			break;
		}
		logger.info("/confirm post 메소드 호출 성공, 결과 값: " + result);
		return mav;
	}

	/* 회원가입 이메일 중복 검사 */
	@ResponseBody
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	private int checkEmail(HttpSession session, @RequestParam(value = "email") String email) {
		// 존재하는 이메일 = 2 , 존재하지 않음 = 0, 1
		int resultType = 0;
		resultType = memberService.memberCheckEmail(email);
		logger.info("/checkEmail post 방식에 의한 메서드 호출 성공, 결과 값: "+resultType);
		return resultType;
	}	
	
	/* 회원가입 이메일 인증 */
	@ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	private String sendMail(HttpSession session, @RequestParam(value = "email") String email) {
		logger.info("/sendMail post 메소드 호출 성공");
		return mailService.send(session, email);
	}
	
}