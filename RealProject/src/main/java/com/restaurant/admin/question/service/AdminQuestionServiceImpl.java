package com.restaurant.admin.question.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.question.dao.AdminQuestionDAO;
import com.restaurant.common.page.Paging;
import com.restaurant.user.question.dao.QuestionDAO;
import com.restaurant.user.question.service.QuestionServiceImpl;
import com.restaurant.user.question.vo.QuestionVO;

@Service
@Transactional
public class AdminQuestionServiceImpl implements AdminQuestionService {
	Logger logger = Logger.getLogger(AdminQuestionServiceImpl.class);

	@Autowired
	private AdminQuestionDAO adminQuestionDAO;

	// 1:1 ���� ����Ʈ ����
	@Override
	public List<QuestionVO> adminQuestionList(QuestionVO qvo) {
		List<QuestionVO> aList = null;

		// ������ ����
		Paging.setPage(qvo);

		// ���Ŀ� ���� �⺻�� ����
		if (qvo.getOrder_by() == null)
			qvo.setOrder_by("question_no");
		if (qvo.getOrder_sc() == null)
			qvo.setOrder_sc("DESC");

		if (!qvo.getKeyword().equals("")) {
			qvo.setStart_date("");
			qvo.setEnd_date("");
		}

		aList = adminQuestionDAO.adminQuestionList(qvo);

		return aList;
	}

	// 1:1 ���� ����Ʈ �󼼺���(�亯�ޱ�)
	@Override
	public QuestionVO adminQuestionDetail(QuestionVO qvo) {
		QuestionVO detail = null;
		detail = adminQuestionDAO.adminQuestionDetail(qvo);

		return detail;
	}

	// ��ü ���ڵ��
	@Override
	public int adminQuestionListCnt(QuestionVO qvo) {
		int countNum = 0;
		countNum = adminQuestionDAO.adminQuestionListCnt(qvo);

		return countNum;
	}

	@Override
	public int adminQuestionUpdate(QuestionVO qvo) {
		int result = 0;
		try {
			result = adminQuestionDAO.adminQuestionUpdate(qvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
