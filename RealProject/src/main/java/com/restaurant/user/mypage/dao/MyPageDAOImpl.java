package com.restaurant.user.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.reservation.vo.AdminReservationVO;
import com.restaurant.user.mypage.vo.MyPageVO;

@Repository("mypagedao")
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession session;

	@Override
	public MyPageVO memberInfoCnt(int no) {
		return session.selectOne("memberInfoCnt", no);
	}

	@Override
	public List<MyPageVO> userCouponList(int no) {
		return session.selectList("userCouponList", no);
	}

	@Override
	public List<MyPageVO> userReservationList(int no) {
		return session.selectList("userReservationList", no);
	}

	@Override
	public List<MyPageVO> userReservationNumberList(MyPageVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("userReservationNumberList", mvo);
	}

	@Override
	public MyPageVO userReservationOne(MyPageVO mvo) {
		// TODO Auto-generated method stub
		return session.selectOne("userReservationOne", mvo);
	}

	@Override
	public List<MyPageVO> userReservationNumberCancel(MyPageVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("userReservationNumberCancel", mvo);
	}

	@Override
	public MyPageVO userReservationOneCancel(MyPageVO mvo) {
		// TODO Auto-generated method stub
		return session.selectOne("userReservationOneCancel", mvo);
	}

	@Override
	public int userReservationEdit(MyPageVO mvo) {
		// TODO Auto-generated method stub
		return session.update("userReservationEdit", mvo);
	}

	@Override
	public MyPageVO pwSelect(MyPageVO mvo) {
		return (MyPageVO) session.selectOne("pwSelect", mvo);
	}

	@Override
	public int updateMember(MyPageVO mvo) {
		return session.update("updateMember", mvo);
	}

	@Override
	public int retryUpdate(MyPageVO mvo) {
		return session.update("retryUpdate", mvo);
	}

	@Override
	public MyPageVO retrySelect(MyPageVO mvo) {
		return session.selectOne("retrySelect", mvo);
	}
	
	@Override
	public MyPageVO conditionSelect(MyPageVO mvo) {
		return session.selectOne("conditionSelect", mvo);
	}
	
	@Override
	public int outMember(int no) {
		return session.update("outMember", no);
	}

	@Override
	public MyPageVO selectMemberID(MyPageVO mvo) {
		return session.selectOne("selectMemberID", mvo);
	}
}
