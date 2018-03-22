package com.restaurant.admin.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.restaurant.admin.coupon.vo.CouponVO;
import com.restaurant.admin.faq.service.AdminFaqService;
import com.restaurant.admin.faq.vo.AdminFaqVO;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;

import oracle.net.jdbc.nl.NVNavigator;

@Controller
@RequestMapping(value = "/adminFaq")
public class AdminFaqController {

	Logger logger = Logger.getLogger(AdminFaqController.class);

	@Autowired
	private AdminFaqService adminFaqService;

	/* 글 목록 구현 */
	@RequestMapping(value = "/adminFaqList", method = RequestMethod.GET)
	public String AdminFaqList(@ModelAttribute AdminFaqVO fvo, Model model) {
		logger.info("faq 리스트 호출");
		/* 페이지 세팅 */
		Paging.setPage(fvo);
		/* 전체 레코드 수 구현 - service */
		int total = adminFaqService.faqListCnt(fvo);
		logger.info("total: " + total);
		/* 글번호 재설정 */
		int count = total - (Util.nvl(fvo.getPage()) - 1) * Util.nvl(fvo.getPageSize());
		logger.info("count :" + count);

		List<AdminFaqVO> faqList = adminFaqService.faqList(fvo);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("faqList", faqList);
		return "admin/faq/adminfaq";
	}

	/* 글쓰기 구현 */
	@ResponseBody
	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public void faqInsert(@ModelAttribute AdminFaqVO fvo) {
		adminFaqService.faqInsert(fvo);
	}

	/* 글 상세보기 구현 */
	@ResponseBody
	@RequestMapping(value = "/faqDetail", method = RequestMethod.GET)
	public AdminFaqVO faqDetail(@RequestParam("faq_no") int fno) {
		logger.info("faqDetail 호출 성공");

		AdminFaqVO fvo = new AdminFaqVO();

		fvo = adminFaqService.faqDetail(fno);

		/*
		 * if (detail != null && (!detail.equals(""))) {
		 * detail.setFaq_text(detail.getFaq_text().toString().replaceAll("\n", "<br>"));
		 * }
		 */
		return fvo;
	}

	/* 글수정 구현 */
	@ResponseBody
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.POST)
	public int faqUpdate(@ModelAttribute AdminFaqVO avo) throws IllegalStateException, IOException {
		logger.info("faqUpdate 호출 성공");
		int result = adminFaqService.faqUpdate(avo);
		return result;
	}

	/* 글삭제 구현 */
	@RequestMapping(value = "/faqDelete")
	public String faqDelete(@ModelAttribute AdminFaqVO fvo, HttpServletRequest request) throws IOException {
		logger.info(fvo.getFaq_no());
		logger.info("faqDelete 호출 성공");
		adminFaqService.faqDelete(fvo.getFaq_no());
		return "redirect:/adminFaq/adminFaqList";
	}
}
