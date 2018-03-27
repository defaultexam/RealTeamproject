package com.restaurant.admin.faq.vo;

import java.util.Date;

import com.restaurant.common.vo.CommonVO;

public class AdminFaqVO extends CommonVO {

	private int faq_no = 0;
	private String faq_title = "";
	private String faq_text = "";
	private String faq_type = "";
	private String faq_date = "";

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_text() {
		return faq_text;
	}

	public void setFaq_text(String faq_text) {
		this.faq_text = faq_text;
	}

	public String getFaq_type() {
		return faq_type;
	}

	public void setFaq_type(String faq_type) {
		this.faq_type = faq_type;
	}

	public String getFaq_date() {
		return faq_date;
	}

	public void setFaq_date(String faq_date) {
		this.faq_date = faq_date;
	}

}
