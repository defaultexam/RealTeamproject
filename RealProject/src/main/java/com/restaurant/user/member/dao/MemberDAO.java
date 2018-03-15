package com.restaurant.user.member.dao;


import java.util.List;

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.user.member.vo.MemberSecurity;
import com.restaurant.user.member.vo.MemberVO;

public interface MemberDAO {
	public int securityInsert(MemberSecurity set);
	public MemberSecurity securitySelect(String userId);
	public int securityDelete(String userId);
	public MemberVO memberSelect(String userId);
	public int memberInsert(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public int memberDelete(String userId);
	public String memberSearchByID(MemberVO mvo);
	public String memberSearchByName(MemberVO mvo);
	public List<CouponHistoryVO> memberCoupon(int member_no);
}
