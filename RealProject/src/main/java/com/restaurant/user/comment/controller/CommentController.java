package com.restaurant.user.comment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.restaurant.common.file.FileUploadUtil;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;
import com.restaurant.user.comment.service.CommentService;
import com.restaurant.user.comment.vo.CommentVO;
import com.restaurant.user.login.vo.LoginVO;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {
	Logger logger = Logger.getLogger(CommentController.class);

	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "")
	public String commentForm(HttpSession session) {
		logger.info("commentForm ȣ�� ����");

		return "user/comment/commentForm";
	}

	@RequestMapping(value = "/commentList.do", method = RequestMethod.GET)
	public String commentList(@ModelAttribute CommentVO cvo, Model model) {
		logger.info("commentList ȣ�� ����");

		// ������ ����
		Paging.setPage(cvo);

		// ��ü ���ڵ� ��

		// LoginVO lvo = (LoginVO) session.getAttribute("login");
		// cvo.setMember_no(lvo.getMember_no());

		int total = commentService.commentListCnt(cvo);
		logger.info("total=" + total);

		// �� ��ȣ �缳��
		int count = total - (Util.nvl(cvo.getPage()) - 1) * Util.nvl(cvo.getPageSize());
		logger.info("count = " + count);

		List<CommentVO> commentList = commentService.commentList(cvo);
		logger.info(commentList);

		model.addAttribute("commentList", commentList);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		model.addAttribute("data", cvo);

		return "user/comment/commentList";
	}

	@RequestMapping(value = "/commentInsert.do", method = RequestMethod.POST)
	public String commentInsert(@ModelAttribute CommentVO cvo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("commentInsert ȣ�� ����");

		int result = 0;
		String url = "";

		if (cvo.getFile() != null) {
			String comment_file = FileUploadUtil.fileUpload(cvo.getFile(), request, "comment");
			cvo.setComment_file(comment_file);
		}
		result = commentService.commentInsert(cvo);
		if (result == 1) {
			// ���� ��
			url = "/comment/commentList.do";
		} else {
			model.addAttribute("code", 1);
			url = "/comment";
		}
		return "redirect:" + url;
	}

	// �湮�ı� �� ���� ��
	@RequestMapping(value = "/commentUpdateForm.do")
	public String updateForm(@ModelAttribute CommentVO cvo, Model model) {
		logger.info("updateForm ȣ�� ����");
		logger.info("comment_no = " + cvo.getComment_no());

		CommentVO updateData = new CommentVO();
		updateData = commentService.commentDetail(cvo);

		model.addAttribute("updateData", updateData);

		return "user/comment/commentUpdate";

	}

	// �湮�ı� ����
	@RequestMapping(value = "/commentUpdate.do", method = RequestMethod.POST)
	public String commentUpdate(@ModelAttribute CommentVO cvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("commentUpdate ȣ�� ����");

		int result = 0;
		String url = "";
		String comment_file = "";

		System.out.println(cvo.getFile());
		if (!cvo.getFile().isEmpty()) {
			logger.info("====== file = " + cvo.getFile().getOriginalFilename());
			if (!cvo.getComment_file().isEmpty()) {
				FileUploadUtil.fileDelete(cvo.getComment_file(), request);
			}
			comment_file = FileUploadUtil.fileUpload(cvo.getFile(), request, "comment");
			cvo.setComment_file(comment_file);
		} else {
			logger.info("÷������ ����");
			cvo.setComment_file("");
		}

		logger.info("===========comment_file = " + cvo.getComment_file());

		result = commentService.commentUpdate(cvo);
		if (result == 1) {
			// url="/board/boardList.do"; // ���� �� ������� �̵�
			// �Ʒ� url�� ���� �� �� �������� �̵�
			url = "/comment/commentList.do";
		}
		return "redirect:" + url;
	}

	// �湮�ı� ����
	@RequestMapping(value = "/commentDelete.do", method = RequestMethod.GET)
	public String commentDelete(@ModelAttribute CommentVO cvo) {
		logger.info("commentDelete ȣ�� ����");

		// �Ʒ� ������ ���� ������ ���� ��
		int result = 0;
		String url = "";

		result = commentService.commentDelete(cvo.getComment_no());

		if (result == 1) {
			// ���� �� �湮�ı� ������� �̵�
			url = "/comment/commentList.do";
		}

		return "redirect:" + url;
	}

}