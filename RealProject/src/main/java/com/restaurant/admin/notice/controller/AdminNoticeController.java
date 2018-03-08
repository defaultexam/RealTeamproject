package com.restaurant.admin.notice.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.admin.notice.service.AdminNoticeService;
import com.restaurant.admin.notice.vo.AdminNoticeVO;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;

@Controller
@RequestMapping(value = "/adminNotice")
public class AdminNoticeController {

	Logger logger = Logger.getLogger(AdminNoticeController.class);

	@Autowired
	private AdminNoticeService adminNoticeService;

	// �������� ������ �� ���
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("noticeList ȣ�� ����");

		// ������ ����
		Paging.setPage(nvo);

		// ��ü ���ڵ� �� ����
		int total = adminNoticeService.noticeListCnt(nvo);
		logger.info("total =" + total);

		// �� ��ȣ �缳��
		int count = total - (Util.nvl(nvo.getPage()) - 1) * Util.nvl(nvo.getPageSize());
		logger.info("count =" + count);

		List<AdminNoticeVO> noticeList = adminNoticeService.noticeList(nvo);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", nvo);

		return "admin/notice/noticeList";
	}

	// �������� ������ �۾���
	@RequestMapping(value = "/noticeForm.do")
	public String noticeForm() {
		logger.info("noticeForm ȣ�� ����");
		return "admin/notice/noticeWrite";
	}

	// �������� ������ �۾��� ����
	@RequestMapping(value = "/noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("noticeInsert ȣ�� ����");

		int result = 0;
		String url = "";

		result = adminNoticeService.noticeInsert(nvo);
		if (result == 1) {
			url = "/adminNotice";

		} else {
			model.addAttribute("code", 1);
			url = "/adminNotice/noticeForm.do";
		}

		return "redirect:" + url;
	}

	// �������� ������ �� �󼼺��� ����
	@RequestMapping(value = "/noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("noticeDetail ȣ�� ����");
		logger.info("notice_no =" + nvo.getNotice_no());

		AdminNoticeVO detail = new AdminNoticeVO();
		detail = adminNoticeService.noticeDetail(nvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setNotice_text(detail.getNotice_text().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "admin/notice/noticeDetail";
	}

	// �������� ������ �� ���� ����
	@RequestMapping(value = "/noticeUpdate.do", method = RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("noticeUpdate ȣ�� ����");

		int result = 0;
		String url = "";

		logger.info("notice_no=" + nvo.getNotice_no());
		
/*		AdminNoticeVO updateData = new AdminNoticeVO();
		updateData = adminNoticeService.noticeDetail(nvo);
		
		model.addAttribute("updateData", updateData);*/
		
		result = adminNoticeService.noticeUpdate(nvo);

		if (result == 1) {
			// ���� �� �������� ������� �̵�
			url = "/adminNotice";

			// url = "/adminNotice/noticeDetail.do?notice_no=" + nvo.getNotice_no() +
			// "&page=" + nvo.getPage() + "&pageSize=" + nvo.getPageSize();

		}
		return "redirect:" + url;

	}

	// �������� ������ �� ���� ����
	@RequestMapping(value = "/noticeDelete.do")
	public String noticeDelete(@ModelAttribute AdminNoticeVO nvo) {
		logger.info("noticeDelete ȣ�� ����");

		// �Ʒ� ������ ���� ���������� ���°�
		int result = 0;
		String url = "";

		result = adminNoticeService.noticeDelete(nvo.getNotice_no());

		if (result == 1) {
			// ���� �� �������� ������� �̵�
			url = "/adminNotice";
					/*+ "?page=" + nvo.getPage() + "&pageSize=" + nvo.getPageSize();*/
		/*} else {
			url = "/adminNotice/noticeDetail.do?notice_no=" + nvo.getNotice_no() + "&page=" + nvo.getPage()
					+ "&pageSize=" + nvo.getPageSize();*/
		}

		return "redirect:" + url;
	}

}