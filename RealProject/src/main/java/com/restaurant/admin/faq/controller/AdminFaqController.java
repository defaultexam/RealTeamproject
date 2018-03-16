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

	/* �� ��� ���� */
	@RequestMapping(value = "/adminFaqList", method = RequestMethod.GET)
	public String AdminFaqList(@ModelAttribute AdminFaqVO fvo, Model model) {
		logger.info("faq ����Ʈ ȣ��");
		/* ������ ���� */
		Paging.setPage(fvo);
		/* ��ü ���ڵ� �� ���� - service */
		int total = adminFaqService.faqListCnt(fvo);
		logger.info("total: " + total);
		/* �۹�ȣ �缳�� */
		int count = total - (Util.nvl(fvo.getPage()) - 1) * Util.nvl(fvo.getPageSize());
		logger.info("count :" + count);

		List<AdminFaqVO> faqList = adminFaqService.faqList(fvo);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("faqList", faqList);
		return "admin/faq/adminfaq";
	}

	/* �۾��� �� ��� */
	@RequestMapping(value = "/writeForm")
	public String writeForm(HttpSession session) {
		logger.info("writeForm ȣ�� ����");
		return "adminFaq/writeForm";
	}

	/* �۾��� ���� */
	@ResponseBody
	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public void faqInsert(@ModelAttribute AdminFaqVO fvo) {
		adminFaqService.faqInsert(fvo);
	}

	/* �� �󼼺��� ���� */
	@RequestMapping(value = "/faqDetail", method = RequestMethod.GET)
	public String faqDetail(@ModelAttribute AdminFaqVO fvo, Model model) {
		logger.info("faqDetail ȣ�� ����");
		logger.info("�� ��ȣ = " + fvo.getFaq_no());

		AdminFaqVO detail = new AdminFaqVO();
		detail = adminFaqService.faqDetail(fvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setFaq_text(detail.getFaq_text().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "adminFaq/faqDetail";
	}

	/* �ۼ��� �� ��� */
	@RequestMapping(value = "/updateForm.do")
	public String updateForm(@ModelAttribute AdminFaqVO fvo, Model model) {
		logger.info("updateForm ȣ�� ����");

		logger.info("���� ��ȣ = " + fvo.getFaq_no());

		AdminFaqVO updateData = new AdminFaqVO();
		updateData = adminFaqService.faqDetail(fvo);

		model.addAttribute("updateData", updateData);

		return "adminFaq/updateForm";
	}

	/* �ۼ��� ���� */
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(@ModelAttribute AdminFaqVO fvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("faqUpdate ȣ�� ����");

		int result = 0;
		String url = "";

		result = adminFaqService.faqUpdate(fvo);
		if (result == 1) {
			url = "/adminFaq/adminFaqList.do"; // ���� �� ������� �̵�
			// �Ʒ� url�� ���� �� �� �������� �̵�
		}
		return "redirect:" + url;
	}

	/* �ۻ��� ���� */
	@RequestMapping(value = "/faqDelete.do")
	public String faqDelete(@ModelAttribute AdminFaqVO fvo, HttpServletRequest request) throws IOException {
		logger.info("faqDelete ȣ�� ����");

		// �Ʒ� �������� �Է� ������ ���� ���°� ����ϴ�.(1 or 0)
		int result = 0;
		String url = "";

		result = adminFaqService.faqDelete(fvo.getFaq_no());
		if (result == 1) {
			url = "/adminFaq/adminFaqList.do";
		}
		return "redirect:" + url;
	}

}
