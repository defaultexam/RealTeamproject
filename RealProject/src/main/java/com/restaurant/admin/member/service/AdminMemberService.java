package com.restaurant.admin.member.service;

import java.util.List;

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.admin.member.vo.AdminMemberVO;

public interface AdminMemberService {

	public List<AdminMemberVO> memberList(AdminMemberVO avo);

	public AdminMemberVO memberOne(AdminMemberVO avo) throws Exception;

	public int memberUpdate(AdminMemberVO avo);

	public int memberListCnt(AdminMemberVO avo);

	public List<CouponHistoryVO> memberCoupon(AdminMemberVO avo);

	public void giveBirth();

	public void giveMarry();

	public void giveVIP();

	public void deleteCoupon();

	public int adminDeleteCoupon(CouponHistoryVO cvo);

	public List<String> couponNameList(int no);

	public void newCouponGive(CouponHistoryVO cvo);

	void memberRankAutoChange();

}
