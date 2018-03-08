package com.restaurant.user.notice.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.admin.notice.vo.AdminNoticeVO;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;
import com.restaurant.user.notice.service.NoticeService;

@Controller
@RequestMapping(value = "/userNotice")
public class NoticeController {

	Logger logger = Logger.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	// �����> �������� ���
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String userNoticeList(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("userNoticeList ȣ�� ����");

		Paging.setPage(nvo);
		
		// ��ü ���ڵ�� ����
		int total = noticeService.noticeListCnt(nvo);
		logger.info("total=" + total);

		// �� ��ȣ �缳��
		int count = total - (Util.nvl(nvo.getPage()) - 1) * Util.nvl(nvo.getPageSize());
		logger.info("count =" + count);

		List<AdminNoticeVO> noticeList = noticeService.noticeList(nvo);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		model.addAttribute("data", nvo);

		return "user/notice/noticeList";

	}

	// �����> �������� �󼼺���
	@RequestMapping(value = "/userNoticeDetail.do", method = RequestMethod.GET)
	public String userNoticeDetail(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("userNoticeDetail ȣ�� ����");
		logger.info("notice_no =" + nvo.getNotice_no());

		AdminNoticeVO detail = new AdminNoticeVO();
		detail = noticeService.userNoticeDetail(nvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setNotice_text(detail.getNotice_text().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "user/notice/noticeDetail";
	}

}
