package com.restaurant.admin.notice.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	// 공지사항 관리자 글 목록
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute AdminNoticeVO nvo, Model model, HttpSession session) {

		String url = "";
		if (session.getAttribute("admin") == null) {
			url = "redirect:/adminSecurity";
		} else {

			logger.info("noticeList 호출 성공");

			// 페이지 세팅
			Paging.setPage(nvo);

			// 전체 레코드 수 구현
			int total = adminNoticeService.noticeListCnt(nvo);
			logger.info("total =" + total);

			// 글 번호 재설정
			int count = total - (Util.nvl(nvo.getPage()) - 1) * Util.nvl(nvo.getPageSize());
			logger.info("count =" + count);

			List<AdminNoticeVO> noticeList = adminNoticeService.noticeList(nvo);

			model.addAttribute("noticeList", noticeList);
			model.addAttribute("count", count);
			model.addAttribute("total", total);
			model.addAttribute("data", nvo);

			url = "admin/notice/noticeList";
		}

		return url;
	}

	// 공지사항 관리자 글쓰기
	@RequestMapping(value = "/noticeForm.do")
	public String noticeForm(HttpSession session) {

		String url = "";
		if (session.getAttribute("admin") == null) {
			url = "redirect:/adminSecurity";
		} else {
			logger.info("noticeForm 호출 성공");
			url = "admin/notice/noticeWrite";
		}

		return url;
	}

	// 공지사항 관리자 글쓰기 구현
	@RequestMapping(value = "/noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("noticeInsert 호출 성공");

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

	// 공지사항 관리자 글 상세보기 구현
	@RequestMapping(value = "/noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute AdminNoticeVO nvo, Model model, HttpSession session) {

		String url = "";
		if (session.getAttribute("admin") == null) {
			url = "redirect:/adminSecurity";
		} else {

			logger.info("noticeDetail 호출 성공");
			logger.info("notice_no =" + nvo.getNotice_no());

			AdminNoticeVO detail = new AdminNoticeVO();
			detail = adminNoticeService.noticeDetail(nvo);

			model.addAttribute("detail", detail);
			url = "admin/notice/noticeDetail";
		}

		return url;
	}

	// 공지사항 관리자 글 수정 구현
	@RequestMapping(value = "/noticeUpdate.do", method = RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute AdminNoticeVO nvo, Model model) {
		logger.info("noticeUpdate 호출 성공");

		int result = 0;
		String url = "";

		logger.info("notice_no=" + nvo.getNotice_no());

		/*
		 * AdminNoticeVO updateData = new AdminNoticeVO(); updateData =
		 * adminNoticeService.noticeDetail(nvo);
		 * 
		 * model.addAttribute("updateData", updateData);
		 */

		result = adminNoticeService.noticeUpdate(nvo);

		if (result == 1) {
			// 수정 후 공지사항 목록으로 이동
			url = "/adminNotice";

			// url = "/adminNotice/noticeDetail.do?notice_no=" + nvo.getNotice_no() +
			// "&page=" + nvo.getPage() + "&pageSize=" + nvo.getPageSize();

		}
		return "redirect:" + url;

	}

	// 공지사항 관리자 글 삭제 구현
	@RequestMapping(value = "/noticeDelete.do")
	public String noticeDelete(@ModelAttribute AdminNoticeVO nvo, HttpSession session) {

		String url = "";
		if (session.getAttribute("admin") == null) {
			url = "/adminSecurity";
		} else {

			logger.info("noticeDelete 호출 성공");

			// 아래 변수는 삭제 성공에대한 상태값
			int result = 0;

			result = adminNoticeService.noticeDelete(nvo.getNotice_no());

			if (result == 1) {
				// 삭제 후 공지사항 목록으로 이동
				url = "/adminNotice";
				/* + "?page=" + nvo.getPage() + "&pageSize=" + nvo.getPageSize(); */
				/*
				 * } else { url = "/adminNotice/noticeDetail.do?notice_no=" + nvo.getNotice_no()
				 * + "&page=" + nvo.getPage() + "&pageSize=" + nvo.getPageSize();
				 */
			}
		}

		return "redirect:" + url;
	}

}
