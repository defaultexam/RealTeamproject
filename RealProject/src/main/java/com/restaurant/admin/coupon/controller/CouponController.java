package com.restaurant.admin.coupon.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.restaurant.admin.coupon.service.CouponService;
import com.restaurant.admin.coupon.vo.CouponVO;

@Controller
@RequestMapping("/adminCoupon")
public class CouponController {
	Logger logger = Logger.getLogger(CouponController.class);

	@Autowired
	private CouponService couponservice;

	@RequestMapping(value = "/couponList", method = RequestMethod.GET)
	public String couponListView(Model model) {
		List<CouponVO> couponList = couponservice.couponList();
		model.addAttribute("couponList", couponList);
		return "admin/coupon/adminCoupon";
	}

	@ResponseBody
	@RequestMapping(value = "/couponList", method = RequestMethod.POST)
	public List<CouponVO> couponList() {
		List<CouponVO> list = couponservice.couponList();
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/insertCoupon", method = RequestMethod.POST)
	public void insertCoupon(@ModelAttribute CouponVO cvo) {
		couponservice.insertCoupon(cvo);
	}

	@ResponseBody
	@RequestMapping(value = "/updateCoupon", method = RequestMethod.GET)
	public int updateCoupon(@ModelAttribute CouponVO cvo) {
		int result;
		result = couponservice.updateCoupon(cvo);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/selectCoupon", method = RequestMethod.GET)
	public CouponVO couponOne(int cno) {
		CouponVO cvo = new CouponVO();
		cvo = couponservice.couponOne(cno);
		return cvo;
	}

}
