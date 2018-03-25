package com.restaurant.user.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.user.comment.vo.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<CommentVO> commentList(CommentVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList("commentList", cvo);
	}

	@Override
	public int commentInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		return session.insert("commentInsert", cvo);
	}

	@Override
	public int commentListCnt(CommentVO cvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("commentListCnt", cvo);
	}

	@Override
	public CommentVO commentDetail(CommentVO cvo) {
		return session.selectOne("commetDetail", cvo);
	}

	@Override
	public int commentUpdate(CommentVO cvo) {
		// TODO Auto-generated method stub
		return (Integer)session.update("commentUpdate", cvo);
	}

	@Override
	public int commentDelete(int comment_no) {
		// TODO Auto-generated method stub
		return session.delete("commentDelete", comment_no);
	}

}
