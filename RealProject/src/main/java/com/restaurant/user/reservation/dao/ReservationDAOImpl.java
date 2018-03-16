package com.restaurant.user.reservation.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.user.reservation.vo.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	@Autowired
	private SqlSession session;

	@Override
	public int reservationInsert(ReservationVO rvo) {
		return session.insert("reservationInsert", rvo);
	}
}
