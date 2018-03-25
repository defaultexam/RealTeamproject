package com.restaurant.admin.comment.dao;

import java.util.List;

import javax.xml.stream.events.Comment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.restaurant.user.comment.vo.CommentVO;

public class AdminCommentDAOImpl implements AdminCommentDAO {

	@Autowired
	private SqlSession session;

	@Override
	public int adminCommentDelete(int comment_no) {
		// TODO Auto-generated method stub
		return session.delete("commentDelete", comment_no);
	}

	// �̿��ı� ���
	@Override
	public List<CommentVO> adminCommentList(CommentVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList("commentList", cvo);
	}

	// �̿��ı� ��ü ��� ��
	@Override
	public int adminCommentListCnt(CommentVO cvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("commentListCnt");
	}

	@Override
	public CommentVO adminCommentDetail(CommentVO cvo) {
		// TODO Auto-generated method stub
		return session.selectOne("commetDetail", cvo);
		
	}

}
