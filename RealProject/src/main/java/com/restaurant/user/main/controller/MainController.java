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

	// ���� ���� �� ����ȭ��(����ڸ���������)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("���� ������ GET ȣ�� ����");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("�޴� ���� ����");
		model.addAttribute("menulist", menulist);
		logger.info("Attribute : 'menulist' �߰�");
		return "index";
	}

	// ������ ���� ������(�α���ȭ��)
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