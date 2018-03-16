package com.restaurant.user.seat.dao;


import java.sql.Date;
import java.util.List;

import com.restaurant.user.seat.vo.SeatVO;

public interface SeatDAO {

	public List<SeatVO> selectSeat(Date seat_date);
	public int updateSeat(SeatVO svo);
}
