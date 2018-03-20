package com.restaurant.user.seat.service;

import java.sql.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.user.seat.dao.SeatDAO;
import com.restaurant.user.seat.vo.SeatVO;

@Service("SeatService")
@Transactional
public class SeatServiceImpl implements SeatService {
	Logger logger = Logger.getLogger(SeatServiceImpl.class);
	@Autowired
	private SeatDAO seatDAO;

	@Override
	public List<SeatVO> selectSeat(Date seat_time) {
		List<SeatVO> seatvo = null;
		seatvo = seatDAO.selectSeat(seat_time);
		return seatvo;
	}

	@Override
	public boolean updateSeat(SeatVO svo) {
		try {
			seatDAO.updateSeat(svo);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

}
