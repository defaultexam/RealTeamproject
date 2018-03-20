package com.restaurant.user.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.common.util.OpenCrypt;
import com.restaurant.common.util.Util;
import com.restaurant.user.member.dao.MemberDAO;
import com.restaurant.user.member.vo.MemberSecurity;
import com.restaurant.user.member.vo.MemberVO;

@Service("MemberService")
@Transactional
public class MemberServiceImpl implements MemberService {
	Logger logger = Logger.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int userIdConfirm(String userId) {
		int result;
		if (memberDAO.memberSelect(userId) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		int sCode = 2;
		if (memberDAO.memberSelect(mvo.getId()) != null) {
			return 1;
		} else {
			try {
				MemberSecurity sec = new MemberSecurity();
				sec.setUserid(mvo.getId());
				sec.setSalt(Util.getRandomString());
				sCode = memberDAO.securityInsert(sec);
				if (sCode == 1) {
					mvo.setPassword(new String(OpenCrypt.getSHA256(mvo.getPassword(), sec.getSalt())));
					memberDAO.memberInsert(mvo);
					return 3;
				} else {
					return 2;
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				return 2;
			}
		}
	}

	@Override
	public MemberVO memberSelect(String userId) {
		MemberVO vo = memberDAO.memberSelect(userId);
		return vo;
	}

	@Override
	public boolean memberUpdate(MemberVO mvo) {
		try {
			if (!mvo.getPassword().isEmpty()) {
				MemberSecurity sec = memberDAO.securitySelect(mvo.getId());
				mvo.setPassword(new String(OpenCrypt.getSHA256(mvo.getPassword(), sec.getSalt())));
			}
			memberDAO.memberUpdate(mvo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public int memberDelete(String userId) {
		int mCode, sCode, isSucessCode = 3;
		try {
			mCode = memberDAO.memberDelete(userId);
			if (mCode == 1) {
				sCode = memberDAO.securityDelete(userId);
				if (sCode == 1) {
					isSucessCode = 2;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			isSucessCode = 3;
		}
		return isSucessCode;
	}

	@Override
	public String memberSearchByName(String name, String email) {
		MemberVO mvo = new MemberVO();
		mvo.setName(name);
		mvo.setEmail(email);
		return memberDAO.memberSearchByName(mvo);
	}

	@Override
	public String memberSearchByID(String id, String email) {
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setEmail(email);
		return memberDAO.memberSearchByID(mvo);
	}

	@Override
	public List<CouponHistoryVO> memberCoupon(int member_no) {
		// TODO Auto-generated method stub
		List<CouponHistoryVO> result = null;
		result = memberDAO.memberCoupon(member_no);
		return result;
	}

	@Override
	public int memberCouponUpdate(MemberVO mvo) {
		int result;
		try {
			memberDAO.memberCouponUpdate(mvo);
			result = 1;
			logger.info("memberCouponUpdate 성공, 쿠폰번호: " + mvo.getAgreement1());
		} catch (Exception e) {
			result = 0;
			logger.info("memberCouponUpdate 실패, 쿠폰번호: " + mvo.getAgreement1());
		}
		return result;
	}
}
