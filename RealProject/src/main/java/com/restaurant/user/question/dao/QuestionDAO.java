package com.restaurant.user.question.dao;

import java.util.List;

import com.restaurant.user.question.vo.QuestionVO;

public interface QuestionDAO {
	public int questionInsert(QuestionVO qvo);
	public List<QuestionVO> questionList(QuestionVO qvo);
	public int questionListCnt(QuestionVO qvo);
	public QuestionVO questionDetail(QuestionVO qvo);
	//public int questionUpdate(QuestionVO qvo);

}
