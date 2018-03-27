package com.restaurant.user.mypage.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.restaurant.common.vo.CommonVO;

public class MyPageVO extends CommonVO {

	// 내 정보
	private int bookingCnt = 0;
	private int bookingCancelCnt = 0;
	private int qnaCnt = 0;
	private int couponCnt = 0;
	private String id = "";
	private String password = "";

	// 예약 내역
	private int book_no = 0;
	private int seat_no = 0;
	private int member_no = 0;
	private int coupon_no = 0;
	private String book_condition = "";
	private String seat_date = "";
	private String seat_time = "";
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
	private String pay_way = "";
	private String pay_date = "";
	private int discount = 0;
	private int totalpay = 0;
	private String book_memo = "";
	private String phone = "";
	private String name = "";

	// 예약 취소
	private String cancel_condition = ""; // 환불상태
	private String cancel_date = ""; // 취소날짜
	private int cancel_total = 0; // 환불금액
	private String cancel_reciver = ""; // 환불예금주
	private String cancel_bank = ""; // 환불은행
	private String cancel_account = ""; // 환불계좌

	// 보유 쿠폰
	private String coupon_name = "";
	private double coupon_discountrate = 0.0;
	private String coupon_start = "";
	private String coupon_end = "";
	private Date searchStart = null;
	private Date searchEnd = null;

	// 수정
	private int no = 0;
	private int gender = 0;
	private Date birthday = null;
	private String email = "";
	private int agreement1 = 0;
	private int agreement2 = 0;
	private int agreement3 = 0;
	private String condition = "";
	private String rank = "";
	private Date member_date = null;
	private int marriage = 0;
	private Date weddingdate = null;
	private String job = "";
	private String address = "";
	private String memo = "";
	private int point = 0;
	private Date member_outdate = null;
	private int password_confirm = 0;

	// 패스워드
	private int retry = 0;

	public MyPageVO() throws Exception {
		super();
		String oldString = "9999-12-31";
		java.util.Date date = new java.util.Date();
		date = new SimpleDateFormat("yyyy-mm-dd").parse(oldString);
		Date sqlDate = new java.sql.Date(date.getTime());
		this.searchStart = sqlDate;
		this.searchEnd = sqlDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBookingCnt() {
		return bookingCnt;
	}

	public void setBookingCnt(int bookingCnt) {
		this.bookingCnt = bookingCnt;
	}

	public int getBookingCancelCnt() {
		return bookingCancelCnt;
	}

	public void setBookingCancelCnt(int bookingCancelCnt) {
		this.bookingCancelCnt = bookingCancelCnt;
	}

	public int getQnaCnt() {
		return qnaCnt;
	}

	public void setQnaCnt(int qnaCnt) {
		this.qnaCnt = qnaCnt;
	}

	public int getCouponCnt() {
		return couponCnt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setCouponCnt(int couponCnt) {
		this.couponCnt = couponCnt;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// 쿠폰
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public double getCoupon_discountRate() {
		return coupon_discountrate;
	}

	public void setCoupon_discountRate(double coupon_discountRate) {
		this.coupon_discountrate = coupon_discountRate;
	}

	public String getCoupon_start() {
		return coupon_start;
	}

	public void setCoupon_start(String coupon_start) {
		this.coupon_start = coupon_start;
	}

	public String getCoupon_end() {
		return coupon_end;
	}

	public void setCoupon_end(String coupon_end) {
		this.coupon_end = coupon_end;
	}

	// 예약내역
	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
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

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getCoupon_discountrate() {
		return coupon_discountrate;
	}

	public void setCoupon_discountrate(double coupon_discountrate) {
		this.coupon_discountrate = coupon_discountrate;
	}

	public Date getSearchStart() {
		return searchStart;
	}

	public void setSearchStart(Date searchStart) {
		this.searchStart = searchStart;
	}

	public Date getSearchEnd() {
		return searchEnd;
	}

	public void setSearchEnd(Date searchEnd) {
		this.searchEnd = searchEnd;
	}

	public String getCancel_condition() {
		return cancel_condition;
	}

	public void setCancel_condition(String cancel_condition) {
		this.cancel_condition = cancel_condition;
	}

	public String getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}

	public int getCancel_total() {
		return cancel_total;
	}

	public void setCancel_total(int cancel_total) {
		this.cancel_total = cancel_total;
	}

	public String getCancel_reciver() {
		return cancel_reciver;
	}

	public void setCancel_reciver(String cancel_reciver) {
		this.cancel_reciver = cancel_reciver;
	}

	public String getCancel_bank() {
		return cancel_bank;
	}

	public void setCancel_bank(String cancel_bank) {
		this.cancel_bank = cancel_bank;
	}

	public String getCancel_account() {
		return cancel_account;
	}

	public void setCancel_account(String cancel_account) {
		this.cancel_account = cancel_account;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAgreement1() {
		return agreement1;
	}

	public void setAgreement1(int agreement1) {
		this.agreement1 = agreement1;
	}

	public int getAgreement2() {
		return agreement2;
	}

	public void setAgreement2(int agreement2) {
		this.agreement2 = agreement2;
	}

	public int getAgreement3() {
		return agreement3;
	}

	public void setAgreement3(int agreement3) {
		this.agreement3 = agreement3;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Date getMember_date() {
		return member_date;
	}

	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}

	public int getMarriage() {
		return marriage;
	}

	public void setMarriage(int marriage) {
		this.marriage = marriage;
	}

	public Date getWeddingdate() {
		return weddingdate;
	}

	public void setWeddingdate(Date weddingdate) {
		this.weddingdate = weddingdate;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getMember_outdate() {
		return member_outdate;
	}

	public void setMember_outdate(Date member_outdate) {
		this.member_outdate = member_outdate;
	}

	public int getPassword_confirm() {
		return password_confirm;
	}

	public void setPassword_confirm(int password_confirm) {
		this.password_confirm = password_confirm;
	}

	public int getRetry() {
		return retry;
	}

	public void setRetry(int retry) {
		this.retry = retry;
	}

}
