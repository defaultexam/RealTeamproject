package com.restaurant.user.reservation.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String boardList(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("menuSelect POST 호출 성공");
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
}
