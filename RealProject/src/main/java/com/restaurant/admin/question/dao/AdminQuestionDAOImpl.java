package com.restaurant.admin.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.user.question.vo.QuestionVO;

@Repository
public class AdminQuestionDAOImpl implements AdminQuestionDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<QuestionVO> adminQuestionList(QuestionVO qvo) {

		return session.selectList("adminQuestionList", qvo);
	}

	@Override
	public int adminQuestionListCnt(QuestionVO qvo) {
		return (Integer) session.selectOne("adminQuestionListCnt");
	}

	@Override
	public QuestionVO adminQuestionDetail(QuestionVO qvo) {
		return session.selectOne("adminQuestionDetail", qvo);

	}

	@Override
	public int adminQuestionUpdate(QuestionVO qvo) {
		return session.update("adminQuestionUpdate", qvo);
	}

}
