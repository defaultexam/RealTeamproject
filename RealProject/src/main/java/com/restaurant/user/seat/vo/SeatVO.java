package com.restaurant.user.seat.vo;

import java.sql.Date;

public class SeatVO {

	private int seat_no;
	private Date seat_date;
	private String seat_time;
	private int seat_extra;

	public SeatVO() {
		super();
	}

	public SeatVO(int seat_no, Date seat_date, String seat_time, int seat_extra) {
		super();
		this.seat_no = seat_no;
		this.seat_date = seat_date;
		this.seat_time = seat_time;
		this.seat_extra = seat_extra;
	}

	public int getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}

	public Date getSeat_date() {
		return seat_date;
	}

	public void setSeat_date(Date seat_date) {
		this.seat_date = seat_date;
	}

	public String getSeat_time() {
		return seat_time;
	}

	public void setSeat_time(String seat_time) {
		this.seat_time = seat_time;
	}

	public int getSeat_extra() {
		return seat_extra;
	}

	public void setSeat_extra(int seat_extra) {
		this.seat_extra = seat_extra;
	}

}
