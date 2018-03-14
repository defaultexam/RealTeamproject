package com.restaurant.user.main.controller;

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
public class MainController {
	Logger logger = Logger.getLogger(MainController.class);
	@Autowired
	private MenuService menuService;

	// 서버 접속 시 메인화면(사용자메인페이지)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("메인 페이지 GET 호출 성공");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("메뉴 서비스 접근");
		model.addAttribute("menulist", menulist);
		logger.info("Attribute : 'menulist' 추가");
		return "index";
	}

	// 관리자 메인 페이지(로그인화면)
	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public String manager() {
		return "admin";
	}

	// 로그인 완료 후 화면
	@RequestMapping(value = "/afterAdminLogin", method = RequestMethod.GET)
	public String sub() {
		return "adminSub";
	}
}