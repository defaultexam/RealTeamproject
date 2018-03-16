package com.restaurant.user.reservation.vo;

import java.sql.Date;

public class ReservationVO {
	private int book_no; // not null
	private int member_no; // not null
	private int seat_no; // not null
	private int book_people; // not null
	private int totalpay; // not null
	private String book_condition; // not null
	private int coupon_no; // not null
	private int discount; // not null
	private String pay_way; // not null
	private Date pay_date;
	private int choice_menu1; // not null
	private int choice_menu2;
	private int choice_menu3;
	private int choice_menu4;
	private int choice_menu5;
	private int choice_menu6;
	private int choice_menu7;
	private int choice_menu8;
	private int choice_menu_number1; // not null
	private int choice_menu_number2;
	private int choice_menu_number3;
	private int choice_menu_number4;
	private int choice_menu_number5;
	private int choice_menu_number6;
	private int choice_menu_number7;
	private int choice_menu_number8;
	private int choice_menu_price1; // not null
	private int choice_menu_price2;
	private int choice_menu_price3;
	private int choice_menu_price4;
	private int choice_menu_price5;
	private int choice_menu_price6;
	private int choice_menu_price7;
	private int choice_menu_price8;
	private String book_memo;
	private Date cancel_date;
	private int cancel_total;
	private String cancel_bank;
	private String cancel_reciver;
	private String cancel_account;
	private String cancel_condition;
	private String book_name; // not null
	private String book_phone; // not null
	private String book_email; // not null

	public ReservationVO() {
		super();
	}

	public ReservationVO(int book_no, int member_no, int seat_no, int book_people, int totalpay, String book_condition,
			int coupon_no, int discount, String pay_way, Date pay_date, int choice_menu1, int choice_menu2,
			int choice_menu3, int choice_menu4, int choice_menu5, int choice_menu6, int choice_menu7, int choice_menu8,
			int choice_menu_number1, int choice_menu_number2, int choice_menu_number3, int choice_menu_number4,
			int choice_menu_number5, int choice_menu_number6, int choice_menu_number7, int choice_menu_number8,
			int choice_menu_price1, int choice_menu_price2, int choice_menu_price3, int choice_menu_price4,
			int choice_menu_price5, int choice_menu_price6, int choice_menu_price7, int choice_menu_price8,
			String book_memo, Date cancel_date, int cancel_total, String cancel_bank, String cancel_reciver,
			String cancel_account, String cancel_condition, String book_name, String book_phone, String book_email) {
		super();
		this.book_no = book_no;
		this.member_no = member_no;
		this.seat_no = seat_no;
		this.book_people = book_people;
		this.totalpay = totalpay;
		this.book_condition = book_condition;
		this.coupon_no = coupon_no;
		this.discount = discount;
		this.pay_way = pay_way;
		this.pay_date = pay_date;
		this.choice_menu1 = choice_menu1;
		this.choice_menu2 = choice_menu2;
		this.choice_menu3 = choice_menu3;
		this.choice_menu4 = choice_menu4;
		this.choice_menu5 = choice_menu5;
		this.choice_menu6 = choice_menu6;
		this.choice_menu7 = choice_menu7;
		this.choice_menu8 = choice_menu8;
		this.choice_menu_number1 = choice_menu_number1;
		this.choice_menu_number2 = choice_menu_number2;
		this.choice_menu_number3 = choice_menu_number3;
		this.choice_menu_number4 = choice_menu_number4;
		this.choice_menu_number5 = choice_menu_number5;
		this.choice_menu_number6 = choice_menu_number6;
		this.choice_menu_number7 = choice_menu_number7;
		this.choice_menu_number8 = choice_menu_number8;
		this.choice_menu_price1 = choice_menu_price1;
		this.choice_menu_price2 = choice_menu_price2;
		this.choice_menu_price3 = choice_menu_price3;
		this.choice_menu_price4 = choice_menu_price4;
		this.choice_menu_price5 = choice_menu_price5;
		this.choice_menu_price6 = choice_menu_price6;
		this.choice_menu_price7 = choice_menu_price7;
		this.choice_menu_price8 = choice_menu_price8;
		this.book_memo = book_memo;
		this.cancel_date = cancel_date;
		this.cancel_total = cancel_total;
		this.cancel_bank = cancel_bank;
		this.cancel_reciver = cancel_reciver;
		this.cancel_account = cancel_account;
		this.cancel_condition = cancel_condition;
		this.book_name = book_name;
		this.book_phone = book_phone;
		this.book_email = book_email;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}

	public int getBook_people() {
		return book_people;
	}

	public void setBook_people(int book_people) {
		this.book_people = book_people;
	}

	public int getTotalpay() {
		return totalpay;
	}

	public void setTotalpay(int totalpay) {
		this.totalpay = totalpay;
	}

	public String getBook_condition() {
		return book_condition;
	}

	public void setBook_condition(String book_condition) {
		this.book_condition = book_condition;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getPay_way() {
		return pay_way;
	}

	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public int getChoice_menu1() {
		return choice_menu1;
	}

	public void setChoice_menu1(int choice_menu1) {
		this.choice_menu1 = choice_menu1;
	}

	public int getChoice_menu2() {
		return choice_menu2;
	}

	public void setChoice_menu2(int choice_menu2) {
		this.choice_menu2 = choice_menu2;
	}

	public int getChoice_menu3() {
		return choice_menu3;
	}

	public void setChoice_menu3(int choice_menu3) {
		this.choice_menu3 = choice_menu3;
	}

	public int getChoice_menu4() {
		return choice_menu4;
	}

	public void setChoice_menu4(int choice_menu4) {
		this.choice_menu4 = choice_menu4;
	}

	public int getChoice_menu5() {
		return choice_menu5;
	}

	public void setChoice_menu5(int choice_menu5) {
		this.choice_menu5 = choice_menu5;
	}

	public int getChoice_menu6() {
		return choice_menu6;
	}

	public void setChoice_menu6(int choice_menu6) {
		this.choice_menu6 = choice_menu6;
	}

	public int getChoice_menu7() {
		return choice_menu7;
	}

	public void setChoice_menu7(int choice_menu7) {
		this.choice_menu7 = choice_menu7;
	}

	public int getChoice_menu8() {
		return choice_menu8;
	}

	public void setChoice_menu8(int choice_menu8) {
		this.choice_menu8 = choice_menu8;
	}

	public int getChoice_menu_number1() {
		return choice_menu_number1;
	}

	public void setChoice_menu_number1(int choice_menu_number1) {
		this.choice_menu_number1 = choice_menu_number1;
	}

	public int getChoice_menu_number2() {
		return choice_menu_number2;
	}

	public void setChoice_menu_number2(int choice_menu_number2) {
		this.choice_menu_number2 = choice_menu_number2;
	}

	public int getChoice_menu_number3() {
		return choice_menu_number3;
	}

	public void setChoice_menu_number3(int choice_menu_number3) {
		this.choice_menu_number3 = choice_menu_number3;
	}

	public int getChoice_menu_number4() {
		return choice_menu_number4;
	}

	public void setChoice_menu_number4(int choice_menu_number4) {
		this.choice_menu_number4 = choice_menu_number4;
	}

	public int getChoice_menu_number5() {
		return choice_menu_number5;
	}

	public void setChoice_menu_number5(int choice_menu_number5) {
		this.choice_menu_number5 = choice_menu_number5;
	}

	public int getChoice_menu_number6() {
		return choice_menu_number6;
	}

	public void setChoice_menu_number6(int choice_menu_number6) {
		this.choice_menu_number6 = choice_menu_number6;
	}

	public int getChoice_menu_number7() {
		return choice_menu_number7;
	}

	public void setChoice_menu_number7(int choice_menu_number7) {
		this.choice_menu_number7 = choice_menu_number7;
	}

	public int getChoice_menu_number8() {
		return choice_menu_number8;
	}

	public void setChoice_menu_number8(int choice_menu_number8) {
		this.choice_menu_number8 = choice_menu_number8;
	}

	public int getChoice_menu_price1() {
		return choice_menu_price1;
	}

	public void setChoice_menu_price1(int choice_menu_price1) {
		this.choice_menu_price1 = choice_menu_price1;
	}

	public int getChoice_menu_price2() {
		return choice_menu_price2;
	}

	public void setChoice_menu_price2(int choice_menu_price2) {
		this.choice_menu_price2 = choice_menu_price2;
	}

	public int getChoice_menu_price3() {
		return choice_menu_price3;
	}

	public void setChoice_menu_price3(int choice_menu_price3) {
		this.choice_menu_price3 = choice_menu_price3;
	}

	public int getChoice_menu_price4() {
		return choice_menu_price4;
	}

	public void setChoice_menu_price4(int choice_menu_price4) {
		this.choice_menu_price4 = choice_menu_price4;
	}

	public int getChoice_menu_price5() {
		return choice_menu_price5;
	}

	public void setChoice_menu_price5(int choice_menu_price5) {
		this.choice_menu_price5 = choice_menu_price5;
	}

	public int getChoice_menu_price6() {
		return choice_menu_price6;
	}

	public void setChoice_menu_price6(int choice_menu_price6) {
		this.choice_menu_price6 = choice_menu_price6;
	}

	public int getChoice_menu_price7() {
		return choice_menu_price7;
	}

	public void setChoice_menu_price7(int choice_menu_price7) {
		this.choice_menu_price7 = choice_menu_price7;
	}

	public int getChoice_menu_price8() {
		return choice_menu_price8;
	}

	public void setChoice_menu_price8(int choice_menu_price8) {
		this.choice_menu_price8 = choice_menu_price8;
	}

	public String getBook_memo() {
		return book_memo;
	}

	public void setBook_memo(String book_memo) {
		this.book_memo = book_memo;
	}

	public Date getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}

	public int getCancel_total() {
		return cancel_total;
	}

	public void setCancel_total(int cancel_total) {
		this.cancel_total = cancel_total;
	}

	public String getCancel_bank() {
		return cancel_bank;
	}

	public void setCancel_bank(String cancel_bank) {
		this.cancel_bank = cancel_bank;
	}

	public String getCancel_reciver() {
		return cancel_reciver;
	}

	public void setCancel_reciver(String cancel_reciver) {
		this.cancel_reciver = cancel_reciver;
	}

	public String getCancel_account() {
		return cancel_account;
	}

	public void setCancel_account(String cancel_account) {
		this.cancel_account = cancel_account;
	}

	public String getCancel_condition() {
		return cancel_condition;
	}

	public void setCancel_condition(String cancel_condition) {
		this.cancel_condition = cancel_condition;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_phone() {
		return book_phone;
	}

	public void setBook_phone(String book_phone) {
		this.book_phone = book_phone;
	}

	public String getBook_email() {
		return book_email;
	}

	public void setBook_email(String book_email) {
		this.book_email = book_email;
	}

}
