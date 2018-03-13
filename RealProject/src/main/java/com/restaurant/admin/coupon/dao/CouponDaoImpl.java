package com.restaurant.admin.coupon.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.coupon.vo.CouponVO;

@Repository("coupondao")
public class CouponDaoImpl implements CouponDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<CouponVO> couponList() {
		// TODO Auto-generated method stub
		List<CouponVO> list = session.selectList("couponList");
		return list;
	}

	@Override
	public void insertCoupon(CouponVO cvo) {
		// TODO Auto-generated method stub
		session.insert("insertCoupon", cvo);

	}

	@Override
	public int updateCoupon(CouponVO cvo) {
		// TODO Auto-generated method stub
		return session.update("updateCoupon", cvo);
	}

	@Override
	public CouponVO couponOne(int cno) {
		// TODO Auto-generated method stub
		return (CouponVO) session.selectOne("couponOne", cno);
	}

}
