package com.restaurant.user.question.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.common.file.FileUploadUtil;
import com.restaurant.user.question.service.QuestionService;
import com.restaurant.user.question.vo.QuestionVO;


@Controller
@RequestMapping(value = "/question")
public class QuestionController {
	Logger logger = Logger.getLogger(QuestionController.class);

	@Autowired
	private QuestionService questionService;

	// 1:1 문의 글쓰기 폼
	@RequestMapping(value="")
	public String questionForm() {
		logger.info("questionForm 호출 성공");
		
		return "user/question/questionForm";
	}

	// 1:1 문의 글쓰기 구현
	@RequestMapping(value = "/questionInsert.do", method = RequestMethod.POST)
	public String questionInsert(@ModelAttribute QuestionVO qvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("questionInsert 호출 성공");

		int result = 0;
		String url = "";
		logger.info(qvo.getQuestion_type());
		
		if (qvo.getFile() != null) {
			String question_file = FileUploadUtil.fileUpload(qvo.getFile(), request, "question");
			qvo.setQuestion_file(question_file);
		}

		result = questionService.questionInsert(qvo);
		
		if (result == 1) {
			url = "";
		} else {
			model.addAttribute("code", 1);
			url = "";
		}

		//return "redirect:" + url;
		return "user/question/questionForm";
	}

}
