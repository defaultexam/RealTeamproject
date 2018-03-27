package com.restaurant.user.mypage.dao;

import java.util.List;

import com.restaurant.user.mypage.vo.MyPageVO;

public interface MyPageDAO {
	public MyPageVO memberInfoCnt(int no);

	public List<MyPageVO> userCouponList(int no);

	public List<MyPageVO> userReservationList(int no);

	public List<MyPageVO> userReservationNumberList(MyPageVO mvo);

	public MyPageVO userReservationOne(MyPageVO mvo);

	public List<MyPageVO> userReservationNumberCancel(MyPageVO mvo);

	public MyPageVO userReservationOneCancel(MyPageVO mvo);

	public int userReservationEdit(MyPageVO mvo);

	public MyPageVO pwSelect(MyPageVO mvo);

	public int updateMember(MyPageVO mvo);
	
	public int retryUpdate(MyPageVO mvo);
	
	public MyPageVO retrySelect(MyPageVO mvo);
}
