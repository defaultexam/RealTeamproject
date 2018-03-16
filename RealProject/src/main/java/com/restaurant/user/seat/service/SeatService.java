package com.restaurant.user.seat.service;

import java.sql.Date;
import java.util.List;

import com.restaurant.user.seat.vo.SeatVO;

public interface SeatService {
	public List<SeatVO> selectSeat(Date res_time);
	public boolean updateSeat(SeatVO svo);
}
