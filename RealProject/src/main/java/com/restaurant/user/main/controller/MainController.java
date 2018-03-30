package com.restaurant.user.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public String sub(HttpSession session) {
		String url = "";
		if (session.getAttribute("admin") == null) {
			url = "redirect:/adminSecurity";
		} else {
			url = "adminSub";
		}
		return url;
	}
	// 관리자 화면 보안처리
	@RequestMapping(value = "/adminSecurity", method = RequestMethod.GET)
	public String adminSecurity() {
		return "adminSecurity";
	}

	// 사용자 화면 보안처리
	@RequestMapping(value = "/security", method = RequestMethod.GET)
	public String security() {
		return "security";
	}

}