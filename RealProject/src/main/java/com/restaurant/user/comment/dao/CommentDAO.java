package com.restaurant.user.comment.dao;

import java.util.List;

import com.restaurant.user.comment.vo.CommentVO;
import com.restaurant.user.question.vo.QuestionVO;

public interface CommentDAO {
	public List<CommentVO> commentList(CommentVO cvo);

	public int commentInsert(CommentVO cvo);

	public int commentListCnt(CommentVO cvo);

	public CommentVO commentDetail(CommentVO cvo);

	public int commentUpdate(CommentVO cvo);

	public int commentDelete(int comment_no);
	
	public int commentMemberPointUpdte(CommentVO cvo);
}
