package com.restaurant.admin.coupon.service;

import java.util.List;

import com.restaurant.admin.coupon.vo.CouponVO;

public interface CouponService {

	public List<CouponVO> couponList();

	public void insertCoupon(CouponVO cvo);

	public int updateCoupon(CouponVO cvo);

	public CouponVO couponOne(int cno);

}
