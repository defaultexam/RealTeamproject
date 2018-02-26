package com.restaurant.user.main.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	Logger logger = Logger.getLogger(MainController.class);

	// 서버 접속 시 메인화면(사용자메인페이지)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "index";
	}

	//관리자 메인 페이지(로그인화면)
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