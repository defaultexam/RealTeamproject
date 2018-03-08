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

	// 사용자> 공지사항 목록
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String userNoticeList(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("userNoticeList 호출 성공");

		Paging.setPage(nvo);
		
		// 전체 레코드수 구현
		int total = noticeService.noticeListCnt(nvo);
		logger.info("total=" + total);

		// 글 번호 재설정
		int count = total - (Util.nvl(nvo.getPage()) - 1) * Util.nvl(nvo.getPageSize());
		logger.info("count =" + count);

		List<AdminNoticeVO> noticeList = noticeService.noticeList(nvo);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		model.addAttribute("data", nvo);

		return "user/notice/noticeList";

	}

	// 사용자> 공지사항 상세보기
	@RequestMapping(value = "/userNoticeDetail.do", method = RequestMethod.GET)
	public String userNoticeDetail(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("userNoticeDetail 호출 성공");
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
