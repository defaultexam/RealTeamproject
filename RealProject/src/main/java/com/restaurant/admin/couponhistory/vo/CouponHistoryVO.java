package com.restaurant.admin.couponhistory.vo;

import java.sql.Date;

public class CouponHistoryVO {

	private int couponhistory_no = 0;
	private int member_no = 0;
	private String coupon_name = "";
	private String coupon_start = "";
	private String coupon_end = "";
	private String coupon_status = "";
	private double coupon_discountrate = 0.0;
	private int discountprice = 0;
	private Date useddate = null;
	private Date deletedate = null;

	public int getCouponhistory_no() {
		return couponhistory_no;
	}

	public void setCouponhistory_no(int couponhistory_no) {
		this.couponhistory_no = couponhistory_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
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

	public String getCoupon_status() {
		return coupon_status;
	}

	public void setCoupon_status(String coupon_status) {
		this.coupon_status = coupon_status;
	}

	public double getCoupon_discountrate() {
		return coupon_discountrate;
	}

	public void setCoupon_discountrate(double coupon_discountrate) {
		this.coupon_discountrate = coupon_discountrate;
	}

	public int getDiscountprice() {
		return discountprice;
	}

	public void setDiscountprice(int discountprice) {
		this.discountprice = discountprice;
	}

	public Date getUseddate() {
		return useddate;
	}

	public void setUseddate(Date useddate) {
		this.useddate = useddate;
	}

	public Date getDeletedate() {
		return deletedate;
	}

	public void setDeletedate(Date deletedate) {
		this.deletedate = deletedate;
	}

}
