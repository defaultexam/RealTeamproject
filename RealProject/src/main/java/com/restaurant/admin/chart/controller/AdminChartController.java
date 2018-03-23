package com.restaurant.admin.chart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.restaurant.admin.chart.service.AdminChartService;
import com.restaurant.admin.chart.vo.AdminChartVO;
import com.restaurant.common.file.FileUploadUtil;

@Controller
@RequestMapping("/adminChart")
public class AdminChartController {
	Logger logger = Logger.getLogger(AdminChartController.class);
	@Autowired
	private AdminChartService adminchartservice;

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String chartMemberCnt(Model model) {

		AdminChartVO membervo = adminchartservice.chartMemberCnt();
		AdminChartVO rankvo = adminchartservice.chartRankCnt();
		model.addAttribute("memberCnt", membervo);
		model.addAttribute("rankCnt", rankvo);

		return "admin/chart/memberChart";
	}
	
	@RequestMapping(value="/reservation",method=RequestMethod.GET)
	public String charReservationView() {
		return "admin/chart/reservationChart";
	}

	@ResponseBody
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public List<AdminChartVO> chartReservation(@ModelAttribute AdminChartVO avo) throws Exception {
		List<AdminChartVO> chartSeatDateList = adminchartservice.chartSeatDate(avo);
		AdminChartVO tempVo = new AdminChartVO();
		
		if (chartSeatDateList.isEmpty()) {
			logger.info("차트내역없음");
		} else {
			for (int i = 0; i < chartSeatDateList.size(); i++) {
				String iSeat = chartSeatDateList.get(i).getSeat_date().substring(0, 10);
				avo.setSeat_date(iSeat);

				tempVo = adminchartservice.chartSeatExtra(avo);

				chartSeatDateList.get(i).setFirstSeat(tempVo.getFirstSeat());
				chartSeatDateList.get(i).setSecondSeat(tempVo.getSecondSeat());
				chartSeatDateList.get(i).setThirdSeat(tempVo.getThirdSeat());
				chartSeatDateList.get(i).setFourthSeat(tempVo.getFourthSeat());
			}
		}

		return chartSeatDateList;
	}
}
