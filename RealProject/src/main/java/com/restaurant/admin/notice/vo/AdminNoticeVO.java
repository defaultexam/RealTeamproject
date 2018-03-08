package com.restaurant.admin.notice.vo;

import com.restaurant.common.vo.CommonVO;

public class AdminNoticeVO extends CommonVO{
	/*private String page; //������ ��ȣ
	private String pageSize; // �������� �����ִ� �ټ�
	private String start_row; // ���� ���ڵ� ��ȣ
	private String end_row; // ���� ���ڵ� ��ȣ
	
	// ���� �˻��� ����� �ʵ�
	private String search = "";
	private String keyword = "";*/
	
	// �������� ������ �۾���
	private int notice_no = 0; // �������� �� ��ȣ
	private int admin_no = 0; // ȸ�� ��ȣ
	private String notice_title = ""; // �������� ����
	private String notice_date = ""; // �������� ��¥
	private String notice_text = ""; // �������� �� ����
	
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
