package com.restaurant.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.admin.member.vo.AdminMemberVO;

@Repository(value="memberdao")
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		return session.selectList("memberList", avo);
	}

	@Override
	public AdminMemberVO memberOne(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		return session.selectOne("memberOne", avo);
	}

	@Override
	public int memberUpdate(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		return session.update("memberUpdate", avo);
	}

	@Override
	public int memberListCnt(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("memberListCnt");
	}

	@Override
	public List<CouponHistoryVO> memberCoupon(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		return session.selectList("memberCoupon", avo);
	}

	@Override
	public List<AdminMemberVO> giveBirthCnt() {
		// TODO Auto-generated method stub
		return session.selectList("giveBirthCnt");
	}

	@Override
	public void giveBirth(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		session.insert("giveBirth", avo);
	}

	@Override
	public List<AdminMemberVO> giveMarryCnt() {
		// TODO Auto-generated method stub
		return session.selectList("giveMarryCnt");
	}

	@Override
	public void giveMarry(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		session.insert("giveMarry", avo);
	}

	@Override
	public List<AdminMemberVO> giveVIPCnt() {
		// TODO Auto-generated method stub
		return session.selectList("giveVIPCnt");
	}

	@Override
	public void giveVIP(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		session.insert("giveVIP", avo);
	}

	@Override
	public int deleteCoupon() {
		// TODO Auto-generated method stub
		return session.update("deleteCoupon");
	}

	@Override
	public int adminDeleteCoupon(CouponHistoryVO cvo) {
		// TODO Auto-generated method stub
		return session.update("adminDeleteCoupon", cvo);
	}

	@Override
	public List<String> couponNameList() {
		// TODO Auto-generated method stub
		return session.selectList("couponNameList");
	}

	@Override
	public void newCouponGive(CouponHistoryVO cvo) {
		// TODO Auto-generated method stub
		session.insert("newCouponGive", cvo);
	}

}
