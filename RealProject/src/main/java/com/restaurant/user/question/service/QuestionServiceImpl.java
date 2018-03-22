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

	// 1:1 문의 목록
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		List<QuestionVO> myList = null;

		// 페이지 셋팅
		Paging.setPage(qvo);

		// 정렬에 대한 기본값 설정
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

	// 전체 레코드 수 구현
	@Override
	public int questionListCnt(QuestionVO qvo) {
		return questionDAO.questionListCnt(qvo);
	}

	// 1:1문의 상세보기
	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {
		QuestionVO detail = null;
		detail = questionDAO.questionDetail(qvo);

		return detail;
	}

}
