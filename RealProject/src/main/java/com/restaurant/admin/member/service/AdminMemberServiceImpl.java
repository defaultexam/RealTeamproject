package com.restaurant.admin.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.admin.member.dao.AdminMemberDao;
import com.restaurant.admin.member.vo.AdminMemberVO;

@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {
	Logger logger = Logger.getLogger(AdminMemberServiceImpl.class);
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		List<AdminMemberVO> list = null;
		list = adminMemberDao.memberList(avo);
		return list;
	}

	@Override
	public AdminMemberVO memberOne(AdminMemberVO avo) throws Exception {
		// TODO Auto-generated method stub
		AdminMemberVO result = new AdminMemberVO();

		logger.info(avo.getMember_no());

		result = adminMemberDao.memberOne(avo);
		return result;
	}

	@Override
	public int memberUpdate(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = adminMemberDao.memberUpdate(avo);
		return result;
	}

	/* 멤버 리스트 수 구하기 */
	@Override
	public int memberListCnt(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		return adminMemberDao.memberListCnt(avo);
	}

	@Override
	public List<CouponHistoryVO> memberCoupon(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		List<CouponHistoryVO> result = null;
		result = adminMemberDao.memberCoupon(avo);
		return result;
	}

	// 매일 0시 2분에 자동실행처리
	@Scheduled(cron = "0 2 0 * * *")
	@Override
	public void giveBirth() {
		AdminMemberVO relist = null;
		List<AdminMemberVO> list = adminMemberDao.giveBirthCnt();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				relist = (AdminMemberVO) list.get(i);
				adminMemberDao.giveBirth(relist);
			}
		}
		System.out.println("생일쿠폰 자동지급");
	}
	// 매일 0시 3분에 자동실행처리
	@Scheduled(cron = "0 3 0 * * *")
	@Override
	public void giveMarry() {
		AdminMemberVO relist = null;
		List<AdminMemberVO> list = adminMemberDao.giveMarryCnt();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				relist = (AdminMemberVO) list.get(i);
				adminMemberDao.giveMarry(relist);
			}
		}
		System.out.println("결혼쿠폰 자동지급");
	}
	// 매일 0시 4분에 자동실행
	@Scheduled(cron = "0 4 0 * * *")
	@Override
	public void giveVIP() {
		AdminMemberVO relist = null;
		List<AdminMemberVO> list = adminMemberDao.giveVIPCnt();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				relist = (AdminMemberVO) list.get(i);
				adminMemberDao.giveVIP(relist);
			}
		}
		System.out.println("VIP쿠폰 자동지급");
	}
	// 매일 0시 5분에자동실행처리
	@Scheduled(cron = "0 5 0 * * *")
	@Override
	public void deleteCoupon() {
		// TODO Auto-generated method stub
		adminMemberDao.deleteCoupon();
		System.out.println("기한만료 쿠폰 자동삭제");
	}

	@Override
	public int adminDeleteCoupon(CouponHistoryVO cvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = adminMemberDao.adminDeleteCoupon(cvo);
		return result;
	}

	@Override
	public List<String> couponNameList(int no) {
		// TODO Auto-generated method stub
		List<String> list = adminMemberDao.couponNameList(no);
		return list;
	}

	@Override
	public void newCouponGive(CouponHistoryVO cvo) {
		// TODO Auto-generated method stub
		adminMemberDao.newCouponGive(cvo);
	}

	// 매일 0시 1분에 자동실행처리
	@Scheduled(cron = "0 1 0 * * *")
	@Override
	public void memberRankAutoChange() {
		adminMemberDao.memberRankAutoChange();
		System.out.println("2000P 일반회원 VIP등급으로 자동변경 실행");
	}

}
