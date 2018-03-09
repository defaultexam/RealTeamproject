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

	/* ���θ޴� */
	@RequestMapping(value = "/mainMenu", method = RequestMethod.GET)
	public String mainMenu(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("mainMenu POST ȣ�� ����");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("�޴� ���� ����");
		model.addAttribute("menulist", menulist);
		logger.info("menulist �߰�");
		return "user/menu/mainMenu";
	}

	/* �ڽ��丮 */
	@RequestMapping(value = "/course", method = RequestMethod.GET)
	public String course(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("course POST ȣ�� ����");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("�޴� ���� ����");
		model.addAttribute("menulist", menulist);
		logger.info("menulist �߰�");
		return "user/menu/course";
	}

	/* ���� */
	@RequestMapping(value = "/drink", method = RequestMethod.GET)
	public String drink(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("drink POST ȣ�� ����");
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("�޴� ���� ����");
		model.addAttribute("menulist", menulist);
		logger.info("menulist �߰�");
		return "user/menu/drink";
	}
}
