package com.restaurant.admin.comment.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.admin.comment.service.AdminCommentService;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;
import com.restaurant.user.comment.vo.CommentVO;

@Controller
@RequestMapping(value = "/adminComment")
public class AdminCommentController {
	Logger logger = Logger.getLogger(AdminCommentController.class);

	@Autowired
	private AdminCommentService adminCommentService;

	@RequestMapping(value = "")
	public String admincommentList(@ModelAttribute CommentVO cvo, Model model) {
		logger.info("adminCommentList ȣ�� ����");

		// ������ ����
		Paging.setPage(cvo);

		// ��ü ����Ʈ ��
		int total = adminCommentService.adminCommentListCnt(cvo);
		logger.info("total =" + total);

		// �� ��ȣ ����
		int count = total - (Util.nvl(cvo.getPage()) - 1) * Util.nvl(cvo.getPageSize());
		logger.info("count = " + count);

		List<CommentVO> commentList = adminCommentService.adminCommentList(cvo);
		logger.info(commentList);

		model.addAttribute("commentList", commentList);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		model.addAttribute("data", cvo);

		return "admin/comment/adminCommentList";
	}

	// ������ �湮�ı� ����
	@RequestMapping(value = "/adminCommentDelete.do", method = RequestMethod.GET)
	public String commentDelete(@ModelAttribute CommentVO cvo) {
		logger.info("adminCommentDelete ȣ�� ����");

		// �Ʒ� ������ ���� ������ ���� ��
		int result = 0;
		String url = "";

		result = adminCommentService.adminCommentDelete(cvo.getComment_no());

		if (result == 1) {
			// ���� �� �湮�ı� ������� �̵�
			url = "/adminComment";
		}

		return "redirect:" + url;
	}

}
