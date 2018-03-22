package com.restaurant.user.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.user.question.vo.QuestionVO;

import jdk.nashorn.internal.runtime.QuotedStringTokenizer;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

	@Autowired
	private SqlSession session;

	// 1:1 ���� �۾��� ����
	@Override
	public int questionInsert(QuestionVO qvo) {

		return session.insert("questionInsert", qvo);
	}

	// ��ü ���
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		return session.selectList("questionList", qvo);
	}

	// ��ü ���ڵ� �� ����
	@Override
	public int questionListCnt(QuestionVO qvo) {
		return (Integer) session.selectOne("questionListCnt");
	}

	// 1:1���� �󼼺���
	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {
		return session.selectOne("questionDetail", qvo);
	}
/*
	// 1:1���� �󼼺���> ������ ��۴ޱ�
	@Override
	public int questionUpdate(QuestionVO qvo) {
		return session.update("questionUpdate", qvo);
	}*/

}
