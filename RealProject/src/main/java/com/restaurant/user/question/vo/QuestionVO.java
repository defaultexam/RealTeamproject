package com.restaurant.user.question.vo;

import org.springframework.web.multipart.MultipartFile;

public class QuestionVO {

	private int question_no = 0;
	private int member_no = 0;
	private String question_type = "";
	private String question_title = "";
	private String question_date = "";
	private String question_text = "";
	private String question_file = "";
	private MultipartFile file;

	public QuestionVO() {
		super();
	}

	public int getQuestion_no() {
		return question_no;
	}

	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public String getQuestion_title() {
		return question_title;
	}

	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}

	public String getQuestion_date() {
		return question_date;
	}

	public void setQuestion_date(String question_date) {
		this.question_date = question_date;
	}

	public String getQuestion_text() {
		return question_text;
	}

	public void setQuestion_text(String question_text) {
		this.question_text = question_text;
	}

	public String getQuestion_file() {
		return question_file;
	}

	public void setQuestion_file(String question_file) {
		this.question_file = question_file;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
