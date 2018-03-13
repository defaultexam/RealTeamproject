package com.restaurant.admin.coupon.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.coupon.dao.CouponDao;
import com.restaurant.admin.coupon.vo.CouponVO;

@Service
@Transactional
public class CouponServiceImpl implements CouponService {
	Logger logger = Logger.getLogger(CouponServiceImpl.class);
	@Autowired
	private CouponDao coupondao;

	@Override
	public List<CouponVO> couponList() {
		// TODO Auto-generated method stub
		List<CouponVO> list = coupondao.couponList();
		return list;
	}

	@Override
	public void insertCoupon(CouponVO cvo) {
		// TODO Auto-generated method stub
		logger.info("쿠폰 등록실행");
		coupondao.insertCoupon(cvo);
	}

	@Override
	public int updateCoupon(CouponVO cvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = coupondao.updateCoupon(cvo);
		return result;
	}

	@Override
	public CouponVO couponOne(int cno) {
		// TODO Auto-generated method stub
		CouponVO cvo = new CouponVO();
		cvo = coupondao.couponOne(cno);
		return cvo;
	}

}
