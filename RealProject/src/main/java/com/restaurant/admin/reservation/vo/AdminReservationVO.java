package com.restaurant.admin.reservation.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.restaurant.common.vo.CommonVO;

public class AdminReservationVO extends CommonVO {
	private int book_no = 0;
	private int seat_no = 0;
	private int member_no = 0;
	private int coupon_no = 0;
	private String book_condition = "";
	private String seat_date = "";
	private String seat_time = "";
	private String name = "";
	private String book_name = "";
	private String menu_name1 = "";
	private String menu_name2 = "";
	private String menu_name3 = "";
	private String menu_name4 = "";
	private String menu_name5 = "";
	private String menu_name6 = "";
	private String menu_name7 = "";
	private String menu_name8 = "";
	private int book_people = 0;
	private String coupon_name = "";
	private String pay_way = "";
	private String pay_date = "";
	private int discount = 0;
	private int totalpay = 0;
	private String book_memo = "";
	private Date searchEnd = null;
	private Date searchStart = null;
	private String phone = "";

	public AdminReservationVO() throws Exception {
		super();
		String oldString = "9999-12-31";
		java.util.Date date = new java.util.Date();
		date = new SimpleDateFormat("yyyy-mm-dd").parse(oldString);
		Date sqlDate = new java.sql.Date(date.getTime());
		this.searchStart = sqlDate;
		this.searchEnd = sqlDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getSearchEnd() {
		return searchEnd;
	}

	public void setSearchEnd(Date searchEnd) {
		this.searchEnd = searchEnd;
	}

	public Date getSearchStart() {
		return searchStart;
	}

	public void setSearchStart(Date searchStart) {
		this.searchStart = searchStart;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public String getBook_condition() {
		return book_condition;
	}

	public void setBook_condition(String book_condition) {
		this.book_condition = book_condition;
	}

	public String getSeat_date() {
		return seat_date;
	}

	public void setSeat_date(String seat_date) {
		this.seat_date = seat_date;
	}

	public String getSeat_time() {
		return seat_time;
	}

	public void setSeat_time(String seat_time) {
		this.seat_time = seat_time;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getMenu_name1() {
		return menu_name1;
	}

	public void setMenu_name1(String menu_name1) {
		this.menu_name1 = menu_name1;
	}

	public String getMenu_name2() {
		return menu_name2;
	}

	public void setMenu_name2(String menu_name2) {
		this.menu_name2 = menu_name2;
	}

	public String getMenu_name3() {
		return menu_name3;
	}

	public void setMenu_name3(String menu_name3) {
		this.menu_name3 = menu_name3;
	}

	public String getMenu_name4() {
		return menu_name4;
	}

	public void setMenu_name4(String menu_name4) {
		this.menu_name4 = menu_name4;
	}

	public String getMenu_name5() {
		return menu_name5;
	}

	public void setMenu_name5(String menu_name5) {
		this.menu_name5 = menu_name5;
	}

	public String getMenu_name6() {
		return menu_name6;
	}

	public void setMenu_name6(String menu_name6) {
		this.menu_name6 = menu_name6;
	}

	public String getMenu_name7() {
		return menu_name7;
	}

	public void setMenu_name7(String menu_name7) {
		this.menu_name7 = menu_name7;
	}

	public String getMenu_name8() {
		return menu_name8;
	}

	public void setMenu_name8(String menu_name8) {
		this.menu_name8 = menu_name8;
	}

	public int getBook_people() {
		return book_people;
	}

	public void setBook_people(int book_people) {
		this.book_people = book_people;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getPay_way() {
		return pay_way;
	}

	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public int getTotalpay() {
		return totalpay;
	}

	public void setTotalpay(int totalpay) {
		this.totalpay = totalpay;
	}

	public String getBook_memo() {
		return book_memo;
	}

	public void setBook_memo(String book_memo) {
		this.book_memo = book_memo;
	}

}
