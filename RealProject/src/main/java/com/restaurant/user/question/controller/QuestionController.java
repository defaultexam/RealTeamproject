package com.restaurant.user.question.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.restaurant.common.file.FileUploadUtil;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;
import com.restaurant.user.login.vo.LoginVO;
import com.restaurant.user.question.service.QuestionService;
import com.restaurant.user.question.vo.QuestionVO;
import com.sun.java.swing.plaf.motif.MotifDesktopIconUI;

@Controller
@RequestMapping(value = "/question")
public class QuestionController {
	Logger logger = Logger.getLogger(QuestionController.class);

	@Autowired
	private QuestionService questionService;

	// 1:1 문의 글쓰기 폼
	@RequestMapping(value = "")
	public String questionForm(HttpSession session) {
		logger.info("questionForm 호출 성공");

		return "user/question/questionForm";
	}

	// 1:1문의 목록
	@RequestMapping(value = "/questionList.do", method = RequestMethod.GET)
	public String questionData(@ModelAttribute QuestionVO qvo, Model model, HttpSession session) {

		// 사용자 보안처리
		String url = "";
		if (session.getAttribute("login") == null) {
			url = "redirect:/security";
		} else {

			logger.info("questionList 호출 성공");

			// 페이지 셋팅
			Paging.setPage(qvo);

			// 전체 레코드 수
			LoginVO lvo = (LoginVO) session.getAttribute("login");
			qvo.setMember_no(lvo.getMember_no());

			int total = questionService.questionListCnt(qvo);
			logger.info("total=" + total);

			// 글 번호 재설정
			int count = total - (Util.nvl(qvo.getPage()) - 1) * Util.nvl(qvo.getPageSize());
			logger.info("count = " + count);

			List<QuestionVO> questionList = questionService.questionList(qvo);

			model.addAttribute("questionList", questionList);
			model.addAttribute("total", total);
			model.addAttribute("count", count);
			model.addAttribute("data", qvo);
			url = "user/question/questionList";
		}

		return url;
	}

	// 나의 1:1 문의 상세보기

	@RequestMapping(value = "/questionDetail.do", method = RequestMethod.GET)
	public String questionDetail(@ModelAttribute QuestionVO qvo, Model model) {
		logger.info("questionDetail 호출 성공");
		logger.info("question_no = " + qvo.getQuestion_no());

		QuestionVO detail = new QuestionVO();
		detail = questionService.questionDetail(qvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setQuestion_title(detail.getQuestion_title().toString().replaceAll("/n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "user/question/questionDetail";

	}

	// 1:1 문의 글쓰기 구현
	@RequestMapping(value = "/questionInsert.do", method = RequestMethod.POST)
	public String questionInsert(@ModelAttribute QuestionVO qvo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("questionInsert 호출 성공");

		int result = 0;
		String url = "";

		if (qvo.getFile() != null) {
			String question_file = FileUploadUtil.fileUpload(qvo.getFile(), request, "question");
			qvo.setQuestion_file(question_file);
		}

		result = questionService.questionInsert(qvo);

		if (result == 1) {
			url = "/question/questionList.do";
		} else {
			model.addAttribute("code", 1);
			url = "/question";
		}
		return "redirect:" + url;
		// return "user/question/questionList";
	}

}

/*
 */
/*
 * // ㄴㅏ의 문의내역목록 구현
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value = "/questionData") public String
 * questionData(ObjectMapper mapper) { logger.info("questionData 호출 성공"); String
 * listData = ""; List<QuestionVO> questionList =
 * questionService.questionList();
 * 
 * try { listData = mapper.writeValueAsString(questionList); } catch
 * (JsonProcessingException e) { e.printStackTrace(); }
 * 
 * return listData;
 */