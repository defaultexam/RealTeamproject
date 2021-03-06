package com.restaurant.admin.reservation.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.reservation.dao.AdminReservationDao;
import com.restaurant.admin.reservation.vo.AdminReservationVO;

@Service
@Transactional
public class AdminReservationServiceImpl implements AdminReservationService {
	Logger logger = Logger.getLogger(AdminReservationServiceImpl.class);

	@Autowired
	private AdminReservationDao adminreservationdao;

	@Override
	public List<AdminReservationVO> reservationNumberList(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		List<AdminReservationVO> list = null;
		list = adminreservationdao.reservationNumberList(rvo);
		return list;
	}

	@Override
	public AdminReservationVO reservationOne(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		AdminReservationVO resultVo = adminreservationdao.reservationOne(rvo);
		return resultVo;
	}

	// 예약 내역 수 구하기
	@Override
	public int reservationListCnt(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminreservationdao.reservationListCnt(rvo);
	}

	@Override
	public int reservationEdit(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminreservationdao.reservationEdit(rvo);
	}

	@Override
	public int reservationEditPoint(AdminReservationVO rvo) {
		return adminreservationdao.reservationEditPoint(rvo);
	}

	// 매일 0시 6분에 자동실행처리
	@Scheduled(cron = "0 6 0 * * *")
	@Override
	public void lateReservationEdit() {
		// TODO Auto-generated method stub
		List<AdminReservationVO> list = adminreservationdao.lateReservationEditList();
		for (int i = 0; i < list.size(); i++) {
			adminreservationdao.reservationEditPoint(list.get(i));
		}
		adminreservationdao.lateReservationEdit();
		System.out.println("기간만료 예약내역 자동삭제(기간만료)처리 ");
	}

	@Override
	public void cancelUpdate(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		adminreservationdao.cancelUpdate(rvo);
	}
//
	// 매일 0시에 자동실행처리
	// (cron = "초 분 시간 일 달 주 년(선택적)")
	@Scheduled(cron = "0 0 0 * * *")
	@Override
	public void insertSeat() {
		// TODO Auto-generated method stub
		adminreservationdao.insertSeatFirst();
		adminreservationdao.insertSeatSecond();
		adminreservationdao.insertSeatThird();
		adminreservationdao.insertSeatFourth();
		System.out.println("15일뒤 예약가능 좌석 수 DB세팅 완료");
	}

}
