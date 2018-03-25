package com.restaurant.user.comment.vo;

import org.springframework.web.multipart.MultipartFile;

import com.restaurant.common.vo.CommonVO;

public class CommentVO extends CommonVO {
	private int comment_no = 0;
	private int member_no = 0;
	private String id = "";
	private String comment_title = "";
	private String comment_date = "";
	private String comment_text = "";
	private String comment_score = "";
	private MultipartFile file;
	private String comment_file = "";
	private String comment_thumb = "";

	public CommentVO() {
		super();
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComment_title() {
		return comment_title;
	}

	public void setComment_title(String comment_title) {
		this.comment_title = comment_title;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public String getComment_score() {
		return comment_score;
	}

	public void setComment_score(String comment_score) {
		this.comment_score = comment_score;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getComment_file() {
		return comment_file;
	}

	public void setComment_file(String comment_file) {
		this.comment_file = comment_file;
	}

	public String getComment_thumb() {
		return comment_thumb;
	}

	public void setComment_thumb(String comment_thumb) {
		this.comment_thumb = comment_thumb;
	}
}
