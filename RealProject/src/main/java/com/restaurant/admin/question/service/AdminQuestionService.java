package com.restaurant.admin.question.service;

import java.util.List;

import com.restaurant.user.question.dao.QuestionDAO;
import com.restaurant.user.question.vo.QuestionVO;

public interface AdminQuestionService {
	public List<QuestionVO> adminQuestionList(QuestionVO qvo);

	public QuestionVO adminQuestionDetail(QuestionVO qvo);

	public int adminQuestionListCnt(QuestionVO qvo);

	public int adminQuestionUpdate(QuestionVO qvo);
}
