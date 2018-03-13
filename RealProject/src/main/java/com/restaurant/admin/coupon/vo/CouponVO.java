package com.restaurant.admin.coupon.vo;


public class CouponVO {

	private int coupon_no = 0;
	private String coupon_name = "";
	private int coupon_term = 0;
	private double coupon_discountrate = 0.0;
	private String coupon_active = "";

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public int getCoupon_term() {
		return coupon_term;
	}

	public void setCoupon_term(int coupon_term) {
		this.coupon_term = coupon_term;
	}

	public double getcoupon_discountrate() {
		return coupon_discountrate;
	}

	public void setcoupon_discountrate(double coupon_discountrate) {
		this.coupon_discountrate = coupon_discountrate;
	}

	public String getCoupon_active() {
		return coupon_active;
	}

	public void setCoupon_active(String coupon_active) {
		this.coupon_active = coupon_active;
	}

}
