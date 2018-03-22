package com.restaurant.user.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.user.member.vo.MemberSecurity;
import com.restaurant.user.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;

	@Override
	public int securityInsert(MemberSecurity set) {
		return session.insert("securityInsert", set);
	}

	@Override
	public MemberSecurity securitySelect(String userId) {
		return (MemberSecurity) session.selectOne("securitySelect", userId);
	}

	@Override
	public int securityDelete(String userId) {
		return session.delete("securityDelete", userId);
	}

	@Override
	public MemberVO memberSelect(String userId) {
		return (MemberVO) session.selectOne("memberSelect", userId);
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		return session.insert("memberInsert");
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return session.update("memberUpdate", mvo);
	}

	@Override
	public int memberDelete(String userId) {
		return session.delete("memberDelete", userId);
	}

	@Override
	public String memberSearchByID(MemberVO mvo) {
		return session.selectOne("memberSearchByID", mvo);
	}

	@Override
	public String memberSearchByName(MemberVO mvo) {
		return session.selectOne("memberSearchByName", mvo);
	}

	@Override
	public List<CouponHistoryVO> memberCoupon(int member_no) {
		return session.selectList("memberCoupon", member_no);
	}

	@Override
	public int memberCouponUpdate(MemberVO mvo) {
		return session.update("memberCouponUpdate", mvo);
	}

	@Override
	public MemberVO memberNoSearch(int member_no) {
		// TODO Auto-generated method stub
		return session.selectOne("memberNoSearch", member_no);
	}
}
