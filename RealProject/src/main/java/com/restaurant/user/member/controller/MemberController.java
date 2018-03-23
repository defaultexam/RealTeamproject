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
		logger.info("/member GET ȣ�� ����");
		return "user/login/mypage";
	}

	/* modify �⺻ JSP ��� (GET �޼ҵ�) */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGet() {
		logger.info("modify GET ȣ�� ����");
		return "user/login/modify";
	}

	/* �̸�, �̸��� ���� (POST �޼ҵ�) */
	@ResponseBody
	@RequestMapping(value = "/searchID", method = RequestMethod.POST)
	public String searchID(@RequestParam("searchid_name") String name, @RequestParam("searchid_email") String email) {
		logger.info("searchID POST ȣ�� ����");
		String result = memberService.memberSearchByName(name, email);
		return result;
	}

	/* ���̵�, �̸��� ���� (POST �޼ҵ�) */
	@ResponseBody
	@RequestMapping(value = "/searchPassword", method = RequestMethod.POST)
	public String passwordReset(@RequestParam("searchpassword_id") String id,
			@RequestParam("searchpassword_email") String email) {
		logger.info("searchPassword POST ȣ�� ����");
		String result = memberService.memberSearchByID(id, email);
		return result;
	}

	/* ��й�ȣ ���� */
	@ResponseBody
	@RequestMapping(value = "/passwordreset", method = RequestMethod.POST)
	public String passwordResetConfirm(@RequestParam("searchpassword_id") String id,
			@RequestParam("reset_password1") String password, HttpSession session, HttpServletRequest request) {
		logger.info("passwordreset POST ȣ�� ����");
		/* ��й�ȣ ���� �޼ҵ� */
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPassword(password);
		String result;
		boolean parseresult = memberService.memberUpdate(mvo);
		result = parseresult + "";
		/* ���� �ʱ�ȭ �� AJAX ���� */
		session.invalidate();
		session = request.getSession(true);
		return result;
	}
}
