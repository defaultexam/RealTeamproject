package com.restaurant.admin.comment.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.comment.dao.AdminCommentDAO;
import com.restaurant.user.comment.dao.CommentDAO;
import com.restaurant.user.comment.vo.CommentVO;

@Service
@Transactional
public class AdminCommentServiceImpl implements AdminCommentService {

	@Autowired
	public AdminCommentDAO adminCommentDao;

	@Override
	public List<CommentVO> adminCommentList(CommentVO cvo) {
		// TODO Auto-generated method stub
		List<CommentVO> myList = null;

		// 정렬에 대한 기본값 설정
		if (cvo.getOrder_by() == null)
			cvo.setOrder_by("comment_date");
		if (cvo.getOrder_sc() == null)
			cvo.setOrder_sc("DESC");

		if (!cvo.getKeyword().equals("")) {
			cvo.setStart_date("");
			cvo.setEnd_date("");
		}

		myList = adminCommentDao.adminCommentList(cvo);
		return myList;
	}

	@Override
	public int adminCommentListCnt(CommentVO cvo) {
		// TODO Auto-generated method stub
		return adminCommentDao.adminCommentListCnt(cvo);
	}

	@Override
	public int adminCommentDelete(int comment_no) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = adminCommentDao.adminCommentDelete(comment_no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public CommentVO commentDetail(CommentVO cvo) {
		// TODO Auto-generated method stub
		return adminCommentDao.adminCommentDetail(cvo);
	}

}
