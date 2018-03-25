package com.restaurant.admin.comment.dao;

import java.util.List;

import javax.xml.stream.events.Comment;

import com.restaurant.user.comment.vo.CommentVO;

public interface AdminCommentDAO {
	public List<CommentVO> adminCommentList(CommentVO cvo);

	public int adminCommentListCnt(CommentVO cvo);

	public int adminCommentDelete(int comment_no);

	public CommentVO adminCommentDetail(CommentVO cvo);

}
