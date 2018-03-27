package com.restaurant.admin.member.dao;

import java.util.List;

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.admin.member.vo.AdminMemberVO;

public interface AdminMemberDao {

	public List<AdminMemberVO> memberList(AdminMemberVO avo);

	public AdminMemberVO memberOne(AdminMemberVO avo);

	public int memberUpdate(AdminMemberVO avo);

	public int memberListCnt(AdminMemberVO avo);

	public List<CouponHistoryVO> memberCoupon(AdminMemberVO avo);

	public List<AdminMemberVO> giveBirthCnt();

	public void giveBirth(AdminMemberVO avo);

	public List<AdminMemberVO> giveMarryCnt();

	public void giveMarry(AdminMemberVO avo);

	public List<AdminMemberVO> giveVIPCnt();

	public void giveVIP(AdminMemberVO avo);

	public int deleteCoupon();

	public int adminDeleteCoupon(CouponHistoryVO cvo);

	public List<String> couponNameList(int no);
	
	public void newCouponGive(CouponHistoryVO cvo);

	void memberRankAutoChange();

}
