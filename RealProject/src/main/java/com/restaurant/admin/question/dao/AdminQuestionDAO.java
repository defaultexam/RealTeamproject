package com.restaurant.admin.question.dao;

import java.util.List;

import com.restaurant.user.question.vo.QuestionVO;

public interface AdminQuestionDAO {
	public List<QuestionVO> adminQuestionList(QuestionVO qvo);
	public int adminQuestionListCnt(QuestionVO qvo);
	public QuestionVO adminQuestionDetail(QuestionVO qvo);
	public int adminQuestionUpdate(QuestionVO qvo);

}
