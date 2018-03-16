package com.restaurant.user.reservation.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.user.reservation.dao.ReservationDAO;
import com.restaurant.user.reservation.vo.ReservationVO;

@Service("ReservationService")
@Transactional
public class ReservationServiceImpl implements ReservationService {
	Logger logger = Logger.getLogger(ReservationServiceImpl.class);
	@Autowired
	private ReservationDAO reservationDAO;

	@Override
	public int reservationInsert(ReservationVO rvo) {
		int result;
		try {
			reservationDAO.reservationInsert(rvo);
			result = 1;
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

}
