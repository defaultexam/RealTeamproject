package com.restaurant.user.menu.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.restaurant.admin.menu.service.MenuService;
import com.restaurant.admin.menu.vo.AdminMenuVO;

@Controller
@RequestMapping(value = "/usermenu")
public class UserMenuController {
	@Autowired
	private MenuService menuService;
	Logger logger = Logger.getLogger(UserMenuController.class);

	/* 메인메뉴 */
	@RequestMapping(value = "/mainMenu", method = RequestMethod.GET)
	public String mainMenu(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("mainMenu POST 호출 성공");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("메뉴 서비스 접근");
		model.addAttribute("menulist", menulist);
		logger.info("menulist 추가");
		return "user/menu/mainMenu";
	}

	/* 코스요리 */
	@RequestMapping(value = "/course", method = RequestMethod.GET)
	public String course(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("course POST 호출 성공");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("메뉴 서비스 접근");
		model.addAttribute("menulist", menulist);
		logger.info("menulist 추가");
		return "user/menu/course";
	}

	/* 음료 */
	@RequestMapping(value = "/drink", method = RequestMethod.GET)
	public String drink(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("drink POST 호출 성공");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("메뉴 서비스 접근");
		model.addAttribute("menulist", menulist);
		logger.info("menulist 추가");
		return "user/menu/drink";
	}
}
