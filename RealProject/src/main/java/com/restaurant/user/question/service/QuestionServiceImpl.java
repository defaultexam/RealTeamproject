package com.restaurant.user.question.service;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.user.question.dao.QuestionDAO;
import com.restaurant.user.question.vo.QuestionVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {
	Logger logger = Logger.getLogger(QuestionServiceImpl.class);

	@Autowired
	private QuestionDAO questionDAO;

	// 1:1 문의 구현
	@Override
	public int questionInsert(QuestionVO qvo) {
		int result = 0;

		try {
			result = questionDAO.questionInsert(qvo);

		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

}
