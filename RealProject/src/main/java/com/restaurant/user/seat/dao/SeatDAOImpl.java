package com.restaurant.user.seat.dao;


import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.user.seat.vo.SeatVO;

@Repository
public class SeatDAOImpl implements SeatDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<SeatVO> selectSeat(Date seat_date) {
		return session.selectList("selectSeat", seat_date);
	}

	@Override
	public int updateSeat(SeatVO svo) {
		return session.update("updateSeat", svo);
	}

}
