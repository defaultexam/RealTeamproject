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

	/* 글쓰기 폼 출력 */
	@RequestMapping(value = "/writeForm")
	public String writeForm(HttpSession session) {
		logger.info("writeForm 호출 성공");
		return "adminFaq/writeForm";
	}

	/* 글쓰기 구현 */
	@ResponseBody
	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public void faqInsert(@ModelAttribute AdminFaqVO fvo) {
		adminFaqService.faqInsert(fvo);
	}

	/* 글 상세보기 구현 */
	@RequestMapping(value = "/faqDetail", method = RequestMethod.GET)
	public String faqDetail(@ModelAttribute AdminFaqVO fvo, Model model) {
		logger.info("faqDetail 호출 성공");
		logger.info("상세 번호 = " + fvo.getFaq_no());

		AdminFaqVO detail = new AdminFaqVO();
		detail = adminFaqService.faqDetail(fvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setFaq_text(detail.getFaq_text().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "adminFaq/faqDetail";
	}

	/* 글수정 폼 출력 */
	@RequestMapping(value = "/updateForm.do")
	public String updateForm(@ModelAttribute AdminFaqVO fvo, Model model) {
		logger.info("updateForm 호출 성공");

		logger.info("수정 번호 = " + fvo.getFaq_no());

		AdminFaqVO updateData = new AdminFaqVO();
		updateData = adminFaqService.faqDetail(fvo);

		model.addAttribute("updateData", updateData);

		return "adminFaq/updateForm";
	}

	/* 글수정 구현 */
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(@ModelAttribute AdminFaqVO fvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("faqUpdate 호출 성공");

		int result = 0;
		String url = "";

		result = adminFaqService.faqUpdate(fvo);
		if (result == 1) {
			url = "/adminFaq/adminFaqList.do"; // 수정 후 목록으로 이동
			// 아래 url은 수정 후 상세 페이지로 이동
		}
		return "redirect:" + url;
	}

	/* 글삭제 구현 */
	@RequestMapping(value = "/faqDelete.do")
	public String faqDelete(@ModelAttribute AdminFaqVO fvo, HttpServletRequest request) throws IOException {
		logger.info("faqDelete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";

		result = adminFaqService.faqDelete(fvo.getFaq_no());
		if (result == 1) {
			url = "/adminFaq/adminFaqList.do";
		}
		return "redirect:" + url;
	}

}
