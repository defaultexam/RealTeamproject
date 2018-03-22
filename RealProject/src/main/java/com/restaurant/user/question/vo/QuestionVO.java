package com.restaurant.user.question.vo;

import org.springframework.web.multipart.MultipartFile;

import com.restaurant.common.vo.CommonVO;

public class QuestionVO extends CommonVO{

	private int question_no = 0;
	private int member_no = 0;
	private String question_type = "";
	private String question_title = "";
	private String question_date = "";
	private String question_text = "";
	private String question_file = "";
	private String question_thumb = "";
	private String question_process = "";
	private MultipartFile file;
	private String answer_title = "";
	private String answer_text = "";
	private String answer_date = "";
	private String answer_file = "";
	private String answer_thumb = "";

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

	public String getAnswer_title() {
		return answer_title;
	}

	public void setAnswer_title(String answer_title) {
		this.answer_title = answer_title;
	}

	public String getAnswer_text() {
		return answer_text;
	}

	public void setAnswer_text(String answer_text) {
		this.answer_text = answer_text;
	}

	public String getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}

	public String getAnswer_file() {
		return answer_file;
	}

	public void setAnswer_file(String answer_file) {
		this.answer_file = answer_file;
	}

	public String getQuestion_thumb() {
		return question_thumb;
	}

	public void setQuestion_thumb(String question_thumb) {
		this.question_thumb = question_thumb;
	}

	public String getAnswer_thumb() {
		return answer_thumb;
	}

	public void setAnswer_thumb(String answer_thumb) {
		this.answer_thumb = answer_thumb;
	}

	public String getQuestion_process() {
		return question_process;
	}

	public void setQuestion_process(String question_process) {
		this.question_process = question_process;
	}
	
	

}
