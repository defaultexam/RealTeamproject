package com.restaurant.user.comment.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.user.comment.dao.CommentDAO;
import com.restaurant.user.comment.vo.CommentVO;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
	Logger logger = Logger.getLogger(CommentServiceImpl.class);

	@Autowired
	private CommentDAO commentDAO;

	@Override
	public List<CommentVO> commentList(CommentVO cvo) {
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

		myList = commentDAO.commentList(cvo);
		return myList;
	}

	@Override
	public int commentInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		int result = 0;

		try {
			result = commentDAO.commentInsert(cvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	@Override
	public int commentListCnt(CommentVO cvo) {
		// TODO Auto-generated method stub
		return commentDAO.commentListCnt(cvo);
	}

	@Override
	public int commentUpdate(CommentVO cvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = commentDAO.commentUpdate(cvo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int commentDelete(int comment_no) {
		// TODO Auto-generated method stub
		int result = 0;

		try {
			result = commentDAO.commentDelete(comment_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public CommentVO commentDetail(CommentVO cvo) {
		return commentDAO.commentDetail(cvo);
	}

}
