package com.restaurant.admin.menu.vo;

import org.springframework.web.multipart.MultipartFile;

import com.restaurant.common.vo.CommonVO;

public class AdminMenuVO{
	private int menu_no = 0;// 메뉴번호
	private String menu_name = "";// 메뉴 이름
	private String menu_text = "";// 메뉴 내용
	private int menu_price = 0; // 메뉴가격
	private String menu_kind = "";// 메뉴종류
	private MultipartFile file; // 첨부파일
	private String menu_menufile = ""; // 파일경로

	public int getMenu_no() {
		return menu_no;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getMenu_menufile() {
		return menu_menufile;
	}

	public void setMenu_menufile(String menu_menufile) {
		this.menu_menufile = menu_menufile;
	}

	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_text() {
		return menu_text;
	}

	public void setMenu_text(String menu_text) {
		this.menu_text = menu_text;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_kind() {
		return menu_kind;
	}

	public void setMenu_kind(String menu_kind) {
		this.menu_kind = menu_kind;
	}

}
