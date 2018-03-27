package com.restaurant.user.mypage.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.reservation.vo.AdminReservationVO;
import com.restaurant.common.util.OpenCrypt;
import com.restaurant.user.login.vo.LoginVO;
import com.restaurant.user.member.dao.MemberDAO;
import com.restaurant.user.member.service.MemberServiceImpl;
import com.restaurant.user.member.vo.MemberSecurity;
import com.restaurant.user.mypage.dao.MyPageDAO;
import com.restaurant.user.mypage.vo.MyPageVO;

@Service
@Transactional
public class MyPageServiceImpl implements MyPageService {
	Logger logger = Logger.getLogger(MemberServiceImpl.class);

	@Autowired
	private MyPageDAO mypagedao;
	@Autowired
	private MemberDAO memberDAO;

	// 내정보카운트
	@Override
	public MyPageVO memberInfoCnt(int no) {
		MyPageVO mvo = mypagedao.memberInfoCnt(no);
		return mvo;
	}

	// 쿠폰
	@Override
	public List<MyPageVO> userCouponList(int no) {
		List<MyPageVO> mvo = mypagedao.userCouponList(no);
		return mvo;
	}

	@Override
	public List<MyPageVO> userReservationList(int no) {
		List<MyPageVO> mvo = mypagedao.userReservationList(no);
		return mvo;
	}

	@Override
	public List<MyPageVO> userReservationNumberList(MyPageVO mvo) {
		// TODO Auto-generated method stub
		List<MyPageVO> list = null;
		list = mypagedao.userReservationNumberList(mvo);
		return list;
	}

	@Override
	public MyPageVO userReservationOne(MyPageVO mvo) {
		// TODO Auto-generated method stub
		MyPageVO resultVo = mypagedao.userReservationOne(mvo);
		return resultVo;
	}

	@Override
	public List<MyPageVO> userReservationNumberCancel(MyPageVO mvo) {
		// TODO Auto-generated method stub
		List<MyPageVO> list = null;
		list = mypagedao.userReservationNumberCancel(mvo);
		return list;
	}

	@Override
	public MyPageVO userReservationOneCancel(MyPageVO mvo) {
		// TODO Auto-generated method stub
		MyPageVO resultVo = mypagedao.userReservationOneCancel(mvo);
		return resultVo;
	}

	@Override
	public int userReservationEdit(MyPageVO mvo) {
		// TODO Auto-generated method stub
		return mypagedao.userReservationEdit(mvo);
	}

	@Override
	public MyPageVO pwSelect(MyPageVO mvo1) throws Exception {
		MemberSecurity sec = memberDAO.securitySelect(mvo1.getId());
		System.out.println(sec.getSalt());
		MyPageVO mvo2 = new MyPageVO();
		if (sec != null) {
			System.out.println(mvo1.getPassword());
			mvo1.setPassword(new String(OpenCrypt.getSHA256(mvo1.getPassword(), sec.getSalt())));
			System.out.println(mvo1.getPassword());
			System.out.println(mvo1.getId());
			mvo2 = mypagedao.pwSelect(mvo1);
			System.out.println("mvo2 : "+mvo2);
		}
		return mvo2;
	}
	
	@Override
	public int updateMember(MyPageVO mvo) {
		return mypagedao.updateMember(mvo);
	}
	
	@Override
	public int retryUpdate(MyPageVO mvo) {
		return mypagedao.retryUpdate(mvo);
	}
	
	@Override
	public MyPageVO retrySelect(MyPageVO mvo) {
		return mypagedao.retrySelect(mvo);
	}
}
