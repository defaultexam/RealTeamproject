package com.restaurant.user.comment.service;

import java.util.List;

import com.restaurant.user.comment.vo.CommentVO;
import com.restaurant.user.question.vo.QuestionVO;

public interface CommentService {
	public List<CommentVO> commentList(CommentVO cvo);

	public int commentInsert(CommentVO cvo);

	public int commentListCnt(CommentVO cvo);

	public int commentUpdate(CommentVO cvo);

	public int commentDelete(int comment_no);

	public CommentVO commentDetail(CommentVO cvo);

}
