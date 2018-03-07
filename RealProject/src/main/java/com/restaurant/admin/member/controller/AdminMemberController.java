package com.restaurant.admin.member.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.restaurant.admin.member.service.AdminMemberService;
import com.restaurant.admin.member.vo.AdminMemberVO;
import com.restaurant.common.excel.ListExcelView;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;

@Controller
@RequestMapping("/adminMember")
public class AdminMemberController {

	Logger logger = Logger.getLogger(AdminMemberController.class);

	@Autowired
	private AdminMemberService adminMemberService;

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView memberList(@ModelAttribute AdminMemberVO avo) {

		ModelAndView mav = new ModelAndView();
		logger.info("adminMember List 호출 성공");
		logger.info(avo.getRank());
		// 페이지 셋팅
		Paging.setPage(avo);
		logger.info("페이지" + avo.getPage());
		logger.info("사이즈:" + avo.getPageSize());
		// 전체 레코드수 조회
		int total = adminMemberService.memberListCnt(avo);
		logger.info("total = " + total);
		// 글 번호 재설정
		int count = total - (Util.nvl(avo.getPage()) - 1) * Util.nvl(avo.getPageSize());
		logger.info("count = " + count);

		List<AdminMemberVO> list = adminMemberService.memberList(avo);
		

		mav.addObject("memberList", list);
		mav.addObject("count", count);
		mav.addObject("total", total);
		mav.addObject("data", avo);

		mav.setViewName("admin/member/adminMember");

		return mav;
	}

	@RequestMapping(value = "/memberInfo.do", method = RequestMethod.GET)
	public String memberOne(@ModelAttribute("AdminMemberVO") AdminMemberVO avo, Model model) throws Exception {
		AdminMemberVO memberInfo = new AdminMemberVO();

		memberInfo = adminMemberService.memberOne(avo);
		logger.info("memberOne 선택 아이디" + memberInfo.getId());

		if (memberInfo.getB_coupon_start() != null) {
			memberInfo.setB_coupon_start(memberInfo.getB_coupon_start().substring(0, 10));
			memberInfo.setB_coupon_end(memberInfo.getB_coupon_end().substring(0, 10));
		}
		if (memberInfo.getM_coupon_start() != null) {
			memberInfo.setM_coupon_start(memberInfo.getM_coupon_start().substring(0, 10));
			memberInfo.setM_coupon_end(memberInfo.getM_coupon_end().substring(0, 10));
		}
		if (memberInfo.getV_coupon_start() != null) {
			memberInfo.setV_coupon_start(memberInfo.getV_coupon_start().substring(0, 10));
			memberInfo.setV_coupon_end(memberInfo.getV_coupon_end().substring(0, 10));
		}

		model.addAttribute("memberInfo", memberInfo);

		return "admin/member/adminMemberInfo";
	}

	@RequestMapping(value = "/memberUpdate.do", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute AdminMemberVO avo) {
		int result = 0;
		String url = "";

		result = adminMemberService.memberUpdate(avo);
		if (result == 1) {
			url = "/adminMember/list.do";
		}
		return "redirect:" + url;
	}
	
	/******************************************************
	 * 액셀 다운로드 구현하기 참고 : ListExcelView 클래스에서 맵타입으로 Model에 접근하게 된다.
	 *****************************************************/

	@RequestMapping(value = "/memberExcel", method = RequestMethod.GET)
	public ModelAndView boardExcel(@ModelAttribute AdminMemberVO avo) {
		logger.info("boardExcel 호출 성공");

		List<AdminMemberVO> memberList = adminMemberService.memberList(avo);

		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list", memberList);
		mv.addObject("template", "member.xlsx");
		mv.addObject("file_name", "memberList");

		return mv;
	}
}
