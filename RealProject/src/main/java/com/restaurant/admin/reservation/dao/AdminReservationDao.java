package com.restaurant.admin.reservation.dao;

import java.util.List;

import com.restaurant.admin.reservation.vo.AdminReservationVO;

public interface AdminReservationDao {

	public List<AdminReservationVO> reservationNumberList(AdminReservationVO rvo);

	public AdminReservationVO reservationOne(AdminReservationVO rvo);

	public int reservationListCnt(AdminReservationVO rvo);

	public int reservationEdit(AdminReservationVO rvo);
	
	public void lateReservationEdit();

}
