package com.restaurant.user.member.service;

import java.util.List;

import org.apache.ibatis.exceptions.TooManyResultsException;
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

	@Override
	public MemberVO memberNoSearch(int member_no) {
		return memberDAO.memberNoSearch(member_no);
	}

	@Override
	public int memberCheckEmail(String email) {
		int result = 0;
		MemberVO mvo = new MemberVO();
		try {
			mvo = memberDAO.memberCheckEmail(email);
			// 이메일이 존재하지 않을 경우
			if (mvo.getEmail() == null || mvo.getEmail() == "") {
				result = 1;
			}
			// 이메일이 존재할 경우
			else {
				result = 2;
			}
			// 조회 결과가 NULL값일 경우
		} catch (NullPointerException e) {
			result = 0;
			// 조회 결과값이 다중으로 여러개 출력되었을 경우
		} catch (TooManyResultsException e2) {
			result = 2;
			// 이외 통합 예외 처리는 존재하는 이메일로 간주.
		} catch (Exception e3) {
			result = 2;
		}
		// 조회된 이메일이 2개 이상일 경우 Error 출력.
		return result;
	}

	@Override
	public int memberPointUpdate(MemberVO mvo) {
		int result = 0;
		try {
			// 받아온 mvo의 point값 만큼을 기존의 point 컬럼에 더한다.
			memberDAO.memberPointUpdate(mvo);
			result = 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public int memberNewMeberno(String id) {
		int member_no = 0;
		member_no = memberDAO.memberNewMeberno(id);
		return member_no;
	}
	
	@Override
	public void memberNewCouponGive(int member_no) {
		memberDAO.memberNewCouponGive(member_no);
	}
	
}
