package com.restaurant.admin.reservation.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import com.restaurant.admin.reservation.service.AdminReservationService;
import com.restaurant.admin.reservation.vo.AdminReservationVO;
import com.restaurant.common.excel.ListExcelView;
import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;
import com.restaurant.user.reservation.vo.ReservationVO;

@Controller
@RequestMapping("/adminReservation")
public class AdminReservationController {

	Logger logger = Logger.getLogger(AdminReservationController.class);

	@Autowired
	private AdminReservationService adminreservationservice;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView reservationList(@ModelAttribute AdminReservationVO rvo) {
		ModelAndView mav = new ModelAndView();
		logger.info("������ ����ȭ�� ��Ʈ�ѷ� ȣ�⼺��");
		// ����������
		Paging.setPage(rvo);
		logger.info("������ : " + rvo.getPage());
		logger.info("������������ : " + rvo.getPageSize());

		// ��ü ���ڵ�� ��ȸ
		int total = adminreservationservice.reservationListCnt(rvo);
		logger.info("��ü �Խù��� : " + total);

		// �۹�ȣ ����
		int count = total - (Util.nvl(rvo.getPage()) - 1) * Util.nvl(rvo.getPageSize());
		logger.info("count : " + count);
		logger.info("name : "+rvo.getName());

		List<AdminReservationVO> numberList = adminreservationservice.reservationNumberList(rvo);
		List<AdminReservationVO> reservationList = new ArrayList<>();
		if (numberList.isEmpty()) {
			logger.info("���೻������");
		} else {
			for (int i = 0; i < numberList.size(); i++) {
				reservationList.add(adminreservationservice.reservationOne(numberList.get(i)));
			}
		}
		mav.addObject("reservationList", reservationList);
		mav.addObject("count", count);
		mav.addObject("total", total);
		mav.addObject("data", rvo);

		mav.setViewName("admin/reservation/adminReservation");

		return mav;
	}

	// ������� ����
	@ResponseBody
	@RequestMapping(value = "/reservationEdit", method = RequestMethod.POST)
	public int editReservationCondition(@ModelAttribute AdminReservationVO rvo) throws Exception {
		int result = 0;
		result = adminreservationservice.reservationEdit(rvo);
		return result;
	}

	@RequestMapping(value = "/reservationExcel", method = RequestMethod.GET)
	public ModelAndView reservationExcel(@ModelAttribute AdminReservationVO rvo) {
		logger.info("reservationExcel ȣ�� ����");

		List<AdminReservationVO> numberList = adminreservationservice.reservationNumberList(rvo);
		List<AdminReservationVO> reservationList = new ArrayList<>();
		if (numberList.isEmpty()) {
			logger.info("���೻������");
		} else {
			for (int i = 0; i < numberList.size(); i++) {
				reservationList.add(adminreservationservice.reservationOne(numberList.get(i)));
			}
		}
		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list", reservationList);
		mv.addObject("template", "reservation.xlsx");
		mv.addObject("file_name", "reservationList");
		return mv;
	}
	
	@RequestMapping(value = "/cancelUpdate", method=RequestMethod.GET)
	public String cancelUpdate(@ModelAttribute AdminReservationVO rvo) {
		logger.info("cancelUpdate ȣ�⼺��");
		
		adminreservationservice.cancelUpdate(rvo);
		
		return "redirect:/adminReservation/list";
	}
}
