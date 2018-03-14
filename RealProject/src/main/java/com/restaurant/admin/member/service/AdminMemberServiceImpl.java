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

	// 매일 0시에 자동실행처리
	// (cron = "초 분 시간 일 달 주 년(선택적)")
	@Scheduled(cron = "0 0 0 * * *")
	@Override
	public void giveBirth() {
		System.out.println("생일쿠폰 자동지급");
		AdminMemberVO relist = null;
		List<AdminMemberVO> list = adminMemberDao.giveBirthCnt();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				relist = (AdminMemberVO) list.get(i);
				adminMemberDao.giveBirth(relist);
			}
		}
	}

	// 매일 0시에 자동실행처리
	@Scheduled(cron = "0 0 0 * * *")
	@Override
	public void giveMarry() {
		System.out.println("결혼쿠폰 자동지급");
		AdminMemberVO relist = null;
		List<AdminMemberVO> list = adminMemberDao.giveMarryCnt();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				relist = (AdminMemberVO) list.get(i);
				adminMemberDao.giveMarry(relist);
			}
		}
	}

	// 매년 1월 1일에 자동실행
	@Scheduled(cron = "0 0 0 1 1 *")
	@Override
	public void giveVIP() {
		System.out.println("VIP쿠폰 자동지급");
		AdminMemberVO relist = null;
		List<AdminMemberVO> list = adminMemberDao.giveVIPCnt();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				relist = (AdminMemberVO) list.get(i);
				adminMemberDao.giveVIP(relist);
			}
		}
	}

	// 매일 0시에 자동실행처리
	@Scheduled(cron = "0 0 0 * * *")
	@Override
	public void deleteCoupon() {
		// TODO Auto-generated method stub
		System.out.println("기한만료 쿠폰 자동삭제");
		adminMemberDao.deleteCoupon();
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

}
