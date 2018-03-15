package com.restaurant.user.member.service;

import java.util.List;

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.user.member.vo.MemberVO;

public interface MemberService {
	public int userIdConfirm(String userId);

	public MemberVO memberSelect(String userId);

	public int memberInsert(MemberVO mvo);

	public boolean memberUpdate(MemberVO mvo);

	public int memberDelete(String userId);

	public String memberSearchByName(String name, String email);

	public String memberSearchByID(String id, String email);
	
	public List<CouponHistoryVO> memberCoupon(int member_no);
}
