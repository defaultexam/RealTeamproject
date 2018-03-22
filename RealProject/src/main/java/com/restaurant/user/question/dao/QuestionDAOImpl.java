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

	// 1:1 문의 글쓰기 구현
	@Override
	public int questionInsert(QuestionVO qvo) {

		return session.insert("questionInsert", qvo);
	}

	// 전체 목록
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		return session.selectList("questionList", qvo);
	}

	// 전체 레코드 수 구현
	@Override
	public int questionListCnt(QuestionVO qvo) {
		return (Integer) session.selectOne("questionListCnt");
	}

	// 1:1문의 상세보기
	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {
		return session.selectOne("questionDetail", qvo);
	}
/*
	// 1:1문의 상세보기> 관리자 답글달기
	@Override
	public int questionUpdate(QuestionVO qvo) {
		return session.update("questionUpdate", qvo);
	}*/

}
