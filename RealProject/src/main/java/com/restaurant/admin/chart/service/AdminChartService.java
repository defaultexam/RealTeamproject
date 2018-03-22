package com.restaurant.admin.chart.service;

import java.util.List;

import com.restaurant.admin.chart.vo.AdminChartVO;

public interface AdminChartService {

	public AdminChartVO chartMemberCnt();

	public AdminChartVO chartRankCnt();

	public List<AdminChartVO> chartSeatDate(AdminChartVO avo);

	public AdminChartVO chartSeatExtra(AdminChartVO avo);

}
