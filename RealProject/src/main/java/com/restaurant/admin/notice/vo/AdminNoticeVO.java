package com.restaurant.admin.notice.vo;

import com.restaurant.common.vo.CommonVO;

public class AdminNoticeVO extends CommonVO{
	/*private String page; //페이지 번호
	private String pageSize; // 페이지에 보여주는 줄수
	private String start_row; // 시작 레코드 번호
	private String end_row; // 종료 레코드 번호
	
	// 조건 검색시 사용할 필드
	private String search = "";
	private String keyword = "";*/
	
	// 공지사항 관리자 글쓰기
	private int notice_no = 0; // 공지사항 글 번호
	private int admin_no = 0; // 회원 번호
	private String notice_title = ""; // 공지사항 제목
	private String notice_date = ""; // 공지사항 날짜
	private String notice_text = ""; // 공지사항 글 내용
	
	public AdminNoticeVO() {
		super();
	}


	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}


	public String getNotice_date() {
		return notice_date;
	}


	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}


	public String getNotice_text() {
		return notice_text;
	}


	public void setNotice_text(String notice_text) {
		this.notice_text = notice_text;
	}


	
}
