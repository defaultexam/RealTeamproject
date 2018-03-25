package com.restaurant.admin.comment.service;

import java.util.List;

import com.restaurant.user.comment.vo.CommentVO;

public interface AdminCommentService {

	public List<CommentVO> adminCommentList(CommentVO cvo);

	public int adminCommentListCnt(CommentVO cvo);

	public int adminCommentDelete(int comment_no);

	public CommentVO commentDetail(CommentVO cvo);
}
