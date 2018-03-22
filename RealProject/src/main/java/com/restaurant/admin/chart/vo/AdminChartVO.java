package com.restaurant.admin.chart.vo;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AdminChartVO {

	private int manCnt = 0;
	private int womanCnt = 0;

	private int normalCnt = 0;
	private int VIPCnt = 0;

	private int totalCnt = 0;

	// 예약 차트 생성시 필요 변수
	private Date chartStartDate = null;
	private Date chartEndDate = null;
	private String seat_date = "";
	private int firstSeat = 0;
	private int secondSeat = 0;
	private int thirdSeat = 0;
	private int fourthSeat = 0;

	public AdminChartVO() throws Exception {
		super();
		String oldString = "9999-12-31";
		java.util.Date date = new java.util.Date();
		date = new SimpleDateFormat("yyyy-mm-dd").parse(oldString);
		Date sqlDate = new java.sql.Date(date.getTime());
		this.chartStartDate = sqlDate;
		this.chartEndDate = sqlDate;
	}

	public int getManCnt() {
		return manCnt;
	}

	public void setManCnt(int manCnt) {
		this.manCnt = manCnt;
	}

	public int getWomanCnt() {
		return womanCnt;
	}

	public void setWomanCnt(int womanCnt) {
		this.womanCnt = womanCnt;
	}

	public int getNormalCnt() {
		return normalCnt;
	}

	public void setNormalCnt(int normalCnt) {
		this.normalCnt = normalCnt;
	}

	public int getVIPCnt() {
		return VIPCnt;
	}

	public void setVIPCnt(int vIPCnt) {
		VIPCnt = vIPCnt;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public Date getChartStartDate() {
		return chartStartDate;
	}

	public void setChartStartDate(Date chartStartDate) {
		this.chartStartDate = chartStartDate;
	}

	public Date getChartEndDate() {
		return chartEndDate;
	}

	public void setChartEndDate(Date chartEndDate) {
		this.chartEndDate = chartEndDate;
	}

	public int getFirstSeat() {
		return firstSeat;
	}

	public void setFirstSeat(int firstSeat) {
		this.firstSeat = firstSeat;
	}

	public int getSecondSeat() {
		return secondSeat;
	}

	public void setSecondSeat(int secondSeat) {
		this.secondSeat = secondSeat;
	}

	public int getThirdSeat() {
		return thirdSeat;
	}

	public void setThirdSeat(int thirdSeat) {
		this.thirdSeat = thirdSeat;
	}

	public int getFourthSeat() {
		return fourthSeat;
	}

	public void setFourthSeat(int fourthSeat) {
		this.fourthSeat = fourthSeat;
	}

	public String getSeat_date() {
		return seat_date;
	}

	public void setSeat_date(String seat_date) {
		this.seat_date = seat_date;
	}

}
