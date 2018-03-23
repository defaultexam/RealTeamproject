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
	/* �ּ�/register (GET �޼ҵ�) */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String register() {
		logger.info("register get ȣ�� ����");
		return "user/register/register";
	}

	/* �ּ�/register (GET �޼ҵ�) */
	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	public String registerterms() {
		logger.info(" /terms get ȣ�� ����");
		return "user/register/terms";
	}

	/* ����� ���̵� �ߺ� üũ �޼��� */
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm", method = RequestMethod.POST)
	public String userIdConfirm(@RequestParam("userId") String userId) {
		int result = memberService.userIdConfirm(userId);
		return result + "";
	}

	/* �ּ� /register/confirm (POST �޼ҵ�) */
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo) {
		logger.info("/confirm post ��Ŀ� ���� �޼��� ȣ�� ����");
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
			logger.info("ȸ������ ����, processPage�� �̵� �Ϸ�.");
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("user/register/register");
			break;
		}
		return mav;
	}

	/* ȸ������ �̸��� ���� */
	@ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	private String sendMail(HttpSession session, @RequestParam(value = "email") String email) {
		logger.info("/sendMail post ��Ŀ� ���� �޼��� ȣ�� ����");
		return mailService.send(session, email);
	}
}