package com.restaurant.admin.chart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.chart.vo.AdminChartVO;

@Repository("chartdao")
public class AdminChartDaoImpl implements AdminChartDao {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public AdminChartVO chartMemberCnt() {
		// TODO Auto-generated method stub
		return (AdminChartVO)sqlsession.selectOne("chartMemberCnt");
	}

	@Override
	public AdminChartVO chartRankCnt() {
		// TODO Auto-generated method stub
		return (AdminChartVO) sqlsession.selectOne("chartRankCnt");
	}

	@Override
	public List<AdminChartVO> chartSeatDate(AdminChartVO avo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("chartSeatDate",avo);
	}

	@Override
	public AdminChartVO chartSeatExtra(AdminChartVO avo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("chartSeatExtra", avo);
	}

}
