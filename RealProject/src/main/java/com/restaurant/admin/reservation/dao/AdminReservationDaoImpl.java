package com.restaurant.admin.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.reservation.vo.AdminReservationVO;

@Repository(value = "adminreservationdao")
public class AdminReservationDaoImpl implements AdminReservationDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<AdminReservationVO> reservationNumberList(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		return session.selectList("reservationNumberList", rvo);
	}

	@Override
	public AdminReservationVO reservationOne(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		return session.selectOne("reservationOne", rvo);
	}

	@Override
	public int reservationListCnt(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		return session.selectOne("reservationListCnt", rvo);
	}

	@Override
	public int reservationEdit(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		return session.update("reservationEdit", rvo);
	}
	
	@Override
	public int reservationEditPoint(AdminReservationVO rvo) {
		return session.update("reservationEditPoint", rvo);
	}

	@Override
	public void lateReservationEdit() {
		// TODO Auto-generated method stub
		session.update("lateReservationEdit");
	}
	
	@Override
	public List<AdminReservationVO> lateReservationEditList() {
		return session.selectList("lateReservationEditList");
	}

	@Override
	public void cancelUpdate(AdminReservationVO rvo) {
		// TODO Auto-generated method stub
		session.update("cancelUpdate", rvo);
		
	}

	@Override
	public void insertSeatFirst() {
		// TODO Auto-generated method stub
		session.insert("insertSeatFirst");
		
	}

	@Override
	public void insertSeatSecond() {
		// TODO Auto-generated method stub
		session.insert("insertSeatSecond");
	}

	@Override
	public void insertSeatThird() {
		// TODO Auto-generated method stub
		session.insert("insertSeatThird");
	}

	@Override
	public void insertSeatFourth() {
		// TODO Auto-generated method stub
		session.insert("insertSeatFourth");
	}

}
