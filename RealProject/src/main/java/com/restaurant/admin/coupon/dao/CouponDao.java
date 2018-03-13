package com.restaurant.admin.coupon.dao;

import java.util.List;

import com.restaurant.admin.coupon.vo.CouponVO;

public interface CouponDao {

	public List<CouponVO> couponList();

	public void insertCoupon(CouponVO cvo);

	public int updateCoupon(CouponVO cvo);
	
	public CouponVO couponOne(int cno);


}
