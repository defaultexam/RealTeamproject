package com.restaurant.admin.menu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.restaurant.admin.menu.service.MenuService;
import com.restaurant.admin.menu.vo.AdminMenuVO;
import com.restaurant.common.file.FileUploadUtil;

@Controller
@RequestMapping(value = "/menu")
public class menuController {
	@Autowired
	private MenuService menuService;

	Logger logger = Logger.getLogger(menuController.class);

	/* �޴� ��ü */
	@RequestMapping(value = "/menuSelect", method = RequestMethod.GET)
	public String boardList(@ModelAttribute AdminMenuVO bvo, Model model) {

		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info(menulist.get(0).getMenu_no());

		model.addAttribute("menulist", menulist);
		model.addAttribute("adminvo", null);
		return "admin/menu/adminmenu";
	}

	/* �޴� �߰� ��� */
	@RequestMapping(value = "/menuInsert", method = RequestMethod.POST)
	public String menuInsert(@ModelAttribute AdminMenuVO bvo, Model model, HttpServletRequest request)
			throws Exception {

		logger.info("menuInsert ȣ�� ����");

		// Ȯ�� �� �ּ�ó��
		// logger.info("fileName : " + bvo.getFile().getOriginalFilename());
		logger.info("name : " + bvo.getMenu_name() + "����");

		int result = 0;
		String url = "";

		if (bvo.getMenu_menufile() != null) {
			String menu_menufile = FileUploadUtil.fileUpload(bvo.getFile(), request, "menu");
			bvo.setMenu_menufile(menu_menufile);
			// fileUpload.java ���� makeThumbnail �޼ҵ带 �����ؾ���.
			String thumbName = FileUploadUtil.makeThumbnail(menu_menufile, request);
			bvo.setMenu_menufile(thumbName);
		}

		result = menuService.menuInsert(bvo);
		if (result == 1) {
			url = "/menu/menuSelect";
		} else {
			model.addAttribute("code", 1);
			url = "/menu/menuSelect";
		}

		return "redirect:" + url;
	}

	/* ��ü����Ʈ������ */
	@ResponseBody
	@RequestMapping(value = "/menuData.do")
	public String menuData(ObjectMapper mapper) {
		logger.info("menuData ȣ�� ����");
		String listData = "";
		List<AdminMenuVO> menuList = menuService.menuSelect();

		try {
			listData = mapper.writeValueAsString(menuList);
			logger.info(listData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;

	}

	@RequestMapping(value = "/menuclick", method = RequestMethod.GET)
	public String menuclick(@ModelAttribute AdminMenuVO bvo, Model model) {
		logger.info("menuclick ȣ�� ����");
		logger.info("menu_no" + bvo.getMenu_no());
		AdminMenuVO adminvo = new AdminMenuVO();
		adminvo = menuService.menuClick(bvo);

		List<AdminMenuVO> menulist = menuService.menuSelect();
		// logger.info(menulist.get(0).getMenu_no());

		model.addAttribute("menulist", menulist);
		model.addAttribute("adminvo", adminvo);
		return "admin/menu/adminmenu";
	}

}
