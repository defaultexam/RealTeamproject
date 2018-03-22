package com.restaurant.user.question.service;

import java.util.List;

import com.restaurant.user.question.vo.QuestionVO;

public interface QuestionService {
	public int questionInsert(QuestionVO qvo);
	public List<QuestionVO> questionList(QuestionVO qvo);
	public int questionListCnt(QuestionVO qvo);
	public QuestionVO questionDetail(QuestionVO qvo);
}
