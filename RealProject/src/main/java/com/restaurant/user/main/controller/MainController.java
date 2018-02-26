package com.restaurant.user.main.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	Logger logger = Logger.getLogger(MainController.class);

	// ���� ���� �� ����ȭ��(����ڸ���������)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "index";
	}

	//������ ���� ������(�α���ȭ��)
	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public String manager() {
		return "admin";
	}

	// �α��� �Ϸ� �� ȭ�� 
	@RequestMapping(value = "/afterAdminLogin", method = RequestMethod.GET)
	public String sub() {
		return "adminSub";
	}
}