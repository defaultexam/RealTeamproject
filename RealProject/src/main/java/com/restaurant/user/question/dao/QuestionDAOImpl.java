package com.restaurant.user.question.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.user.question.vo.QuestionVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO{
	
	@Autowired
	private SqlSession session;
	
	// 1:1 문의 글쓰기 구현
	@Override
	public int questionInsert(QuestionVO qvo) {
		
		return session.insert("questionInsert", qvo);
	}
	
	
	

}
