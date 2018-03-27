package com.restaurant.admin.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.admin.question.service.AdminQuestionService;
import com.restaurant.common.file.FileUploadUtil;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;
import com.restaurant.user.login.vo.LoginVO;
import com.restaurant.user.member.service.MemberService;
import com.restaurant.user.member.vo.MemberVO;
import com.restaurant.user.question.controller.QuestionController;
import com.restaurant.user.question.dao.QuestionDAOImpl;
import com.restaurant.user.question.service.QuestionService;
import com.restaurant.user.question.vo.QuestionVO;

@Controller
@RequestMapping(value = "/adminQuestion")
public class AdminQuestionController {

	Logger logger = Logger.getLogger(AdminQuestionController.class);

	@Autowired
	private AdminQuestionService adminQuestionService;

	@Autowired
	private MemberService memberService;

	// ������> 1:1 ���� ���
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String adminQustionList(@ModelAttribute QuestionVO qvo, Model model, HttpSession session) {

		String url = "";
		if (session.getAttribute("admin") == null) {
			url = "redirect:/adminSecurity";
		} else {

			logger.info("adminQuestionList ȣ�� ����");

			Paging.setPage(qvo);

			// ��ü ���ڵ� �� ����
			int total = adminQuestionService.adminQuestionListCnt(qvo);
			logger.info("total=" + total);

			// �� ��ȣ �缳��
			int count = total - (Util.nvl(qvo.getPage()) - 1) * Util.nvl(qvo.getPageSize());
			logger.info("count=" + count);

			List<QuestionVO> questionList = adminQuestionService.adminQuestionList(qvo);

			model.addAttribute("questionList", questionList);
			model.addAttribute("count", count);
			model.addAttribute("total", total);
			model.addAttribute("data", qvo);
			url = "admin/question/AdminQuestionList";
		}

		return url;
	}

	// ������> 1:1 ���� �󼼺���(�亯�ޱ�)
	@RequestMapping(value = "/adminQuestionDetail.do", method = RequestMethod.GET)
	public String adminQustionDetail(@ModelAttribute QuestionVO qvo, Model model, HttpSession session) {

		String url = "";
		if (session.getAttribute("admin") == null) {
			url = "redirect:/adminSecurity";
		} else {

			logger.info("adminQuestionDetail ȣ�� ����");
			logger.info("question_no = " + qvo.getQuestion_no());

			QuestionVO detail = new QuestionVO();
			detail = adminQuestionService.adminQuestionDetail(qvo);
	
			MemberVO mvo = memberService.memberNoSearch(detail.getMember_no());

			model.addAttribute("detail", detail);
			model.addAttribute("mvo", mvo);

			url = "admin/question/AdminQuestionDetail";
		}

		return url;
	}

	@RequestMapping(value = "/adminQuestionUpdate.do", method = RequestMethod.POST)
	public String adminQuestionUpdate(@ModelAttribute QuestionVO qvo, HttpServletRequest request, Model model)
			throws IllegalStateException, IOException {
		logger.info("adminQuestionUpdate ȣ�� ����");
		logger.info("question_no=" + qvo.getQuestion_no());

		int result = 0;
		String url = "";

		if (!qvo.getFile().isEmpty()) {
			String answer_file = FileUploadUtil.fileUpload(qvo.getFile(), request, "question");
			qvo.setAnswer_file(answer_file);
		}

		qvo.setQuestion_process("�亯 �Ϸ�");

		result = adminQuestionService.adminQuestionUpdate(qvo);

		// �亯 �� 1:1���ǻ��� ������� �̵�
		logger.info("�亯����");
		url = "/adminQuestion";

		return "redirect:" + url;
	}

}
