package com.restaurant.user.reservation.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.restaurant.admin.menu.service.MenuService;
import com.restaurant.admin.menu.vo.AdminMenuVO;
import com.restaurant.user.register.controller.RegisterController;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	Logger logger = Logger.getLogger(RegisterController.class);
	@Autowired
	private MenuService menuService;
	/* 주소/register (GET 메소드) */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String reservation() {
		logger.info("register get 호출 성공");
		return "user/reservation/reservation";
	}

	/* 메뉴 전체 */
	@RequestMapping(value = "/menu", method = RequestMethod.POST)
	public String loadMenu(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("loadMenu POST 호출 성공");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("메뉴 서비스 접근");
		model.addAttribute("menulist", menulist);
		logger.info("menulist 추가");
		return "user/reservation/reservation";
	}

	/* 메뉴 번호를 받아서 정보 반환 */
	@ResponseBody
	@RequestMapping(value = "/checkmenu", method = RequestMethod.POST)
	public AdminMenuVO checkMenu(@ModelAttribute AdminMenuVO bvo, Model model) {
		AdminMenuVO selectedMenu = menuService.menuSelectByNum(bvo.getMenu_no());
		model.addAttribute("selectedmenu", selectedMenu);
		return selectedMenu;
	}

	/* 예약 */
	@ResponseBody
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserve(@RequestParam("cart_menuno") List<String> cart_menuno,
			@RequestParam("cart_name") List<String> cart_name, @RequestParam("cart_price") List<String> cart_price,
			@RequestParam("cart_amount") List<String> cart_amount, Model model) {
		System.out.println("cart_menuno : " + cart_menuno);
		System.out.println("cart_name : " + cart_name);
		System.out.println("cart_price : " + cart_price);
		System.out.println("cart_amount : " + cart_amount);
		String result;
		result = "아~";
		return result;
	}
}
