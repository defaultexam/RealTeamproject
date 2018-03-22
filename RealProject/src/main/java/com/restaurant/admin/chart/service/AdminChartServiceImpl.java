package com.restaurant.admin.chart.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.chart.dao.AdminChartDao;
import com.restaurant.admin.chart.vo.AdminChartVO;

@Service
@Transactional
public class AdminChartServiceImpl implements AdminChartService {
	
	@Autowired
	private AdminChartDao chartdao;

	@Override
	public AdminChartVO chartMemberCnt() {
		// TODO Auto-generated method stub
		AdminChartVO avo = chartdao.chartMemberCnt();
		return avo;
	}

	@Override
	public AdminChartVO chartRankCnt() {
		// TODO Auto-generated method stub
		AdminChartVO avo = chartdao.chartRankCnt();
		return avo;
	}

	@Override
	public List<AdminChartVO> chartSeatDate(AdminChartVO avo) {
		// TODO Auto-generated method stub
		List<AdminChartVO> chartList = null;
		chartList = chartdao.chartSeatDate(avo);
		return chartList;
	}

	@Override
	public AdminChartVO chartSeatExtra(AdminChartVO avo) {
		// TODO Auto-generated method stub
		AdminChartVO chartvo = chartdao.chartSeatExtra(avo);
		return chartvo;
	}

}
