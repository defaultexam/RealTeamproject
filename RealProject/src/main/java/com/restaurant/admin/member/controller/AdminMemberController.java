package com.restaurant.admin.member.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.admin.member.service.AdminMemberService;
import com.restaurant.admin.member.vo.AdminMemberVO;

@Controller
@RequestMapping("/adminMember")
public class AdminMemberController {

	Logger logger = Logger.getLogger(AdminMemberController.class);

	@Autowired
	private AdminMemberService adminMemberService;

	@RequestMapping("/list.do")
	public String memberList(@ModelAttribute("AdminMemberVO") AdminMemberVO avo, Model model) {
		List<AdminMemberVO> list = adminMemberService.memberList(avo);

		model.addAttribute("memberList", list);

		return "admin/member/adminMember";
	}

	@RequestMapping(value = "/memberInfo.do", method = RequestMethod.GET)
	public String memberOne(@ModelAttribute("AdminMemberVO") AdminMemberVO avo, Model model) {
		AdminMemberVO memberInfo = new AdminMemberVO();
		
		memberInfo = adminMemberService.memberOne(avo);
		logger.info("memberOne 선택 아이디" + memberInfo.getId());

		model.addAttribute("memberInfo", memberInfo);

		return "admin/member/adminMemberInfo";
	}
}
