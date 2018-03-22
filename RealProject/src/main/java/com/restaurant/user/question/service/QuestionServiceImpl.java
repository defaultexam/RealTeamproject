package com.restaurant.user.question.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.common.page.Paging;
import com.restaurant.user.question.dao.QuestionDAO;
import com.restaurant.user.question.vo.QuestionVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {
	Logger logger = Logger.getLogger(QuestionServiceImpl.class);

	@Autowired
	private QuestionDAO questionDAO;

	// 1:1 ���� ����
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

	// 1:1 ���� ���
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		List<QuestionVO> myList = null;

		// ������ ����
		Paging.setPage(qvo);

		// ���Ŀ� ���� �⺻�� ����
		if (qvo.getOrder_by() == null)
			qvo.setOrder_by("question_date");
		if (qvo.getOrder_sc() == null)
			qvo.setOrder_sc("DESC");

		if (!qvo.getKeyword().equals("")) {
			qvo.setStart_date("");
			qvo.setEnd_date("");
		}

		myList = questionDAO.questionList(qvo);

		return myList;
	}

	// ��ü ���ڵ� �� ����
	@Override
	public int questionListCnt(QuestionVO qvo) {
		return questionDAO.questionListCnt(qvo);
	}

	// 1:1���� �󼼺���
	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {
		QuestionVO detail = null;
		detail = questionDAO.questionDetail(qvo);

		return detail;
	}

}
