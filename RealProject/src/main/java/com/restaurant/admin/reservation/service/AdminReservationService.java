package com.restaurant.admin.reservation.service;

import java.util.List;

import com.restaurant.admin.reservation.vo.AdminReservationVO;

public interface AdminReservationService {

	public List<AdminReservationVO> reservationNumberList(AdminReservationVO rvo);

	public AdminReservationVO reservationOne(AdminReservationVO rvo);

	public int reservationListCnt(AdminReservationVO rvo);

	public int reservationEdit(AdminReservationVO rvo);

	public void lateReservationEdit();

	public void cancelUpdate(AdminReservationVO rvo);
	
	public void insertSeat();

}
