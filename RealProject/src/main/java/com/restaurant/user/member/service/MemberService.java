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
	
	public int memberCouponUpdate(MemberVO mvo);
	
	public MemberVO memberNoSearch(int member_no);
	
	public int memberCheckEmail(String email);
	
	public int memberPointUpdate(MemberVO mvo);

	public int memberNewMeberno(String id);

	public void memberNewCouponGive(int member_no);
}
