package com.restaurant.admin.menu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.restaurant.common.file.FileUploadUtil;
import com.restaurant.common.page.Paging;

@Controller
@RequestMapping(value = "/menu")
public class menuController {
	@Autowired
	private MenuService menuService;

	Logger logger = Logger.getLogger(menuController.class);

	/* �޴� ��ü */
	@RequestMapping(value = "/menuSelect", method = RequestMethod.GET)
	public String boardList(@ModelAttribute AdminMenuVO bvo, Model model, HttpSession session) {

		// logger.info(menulist.get(0).getMenu_no());
		// ������ ����
		// ��ü ���ڵ�� ����
		/*
		 * Paging.setPage(bvo); int total = menuService.menuListCnt(bvo);
		 * logger.info("total = " + total);
		 */

		String url = "";
		if (session.getAttribute("admin") == null) {
			url = "redirect:/adminSecurity";
		} else {
			List<AdminMenuVO> menulist = menuService.menuSelect();

			model.addAttribute("menulist", menulist);
			/* model.addAttribute("total", total); */
			model.addAttribute("adminvo", null);
			url = "admin/menu/adminmenu";
		}

		return url;

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

	/* �޴� �̵� */
	@ResponseBody
	@RequestMapping(value = "/menuclick", method = RequestMethod.GET)
	public AdminMenuVO menuclick(/* Model model, */ HttpServletRequest request) {
		logger.info("menuclick ȣ�� ����");
		int num = 0;
		num = Integer.parseInt(request.getParameter("menu_no"));
		logger.info("menu_no" + num);
		AdminMenuVO selectMenuVo = new AdminMenuVO();
		selectMenuVo = menuService.menuClick(num);

		// List<AdminMenuVO> menulist = menuService.menuSelect();
		// logger.info(menulist.get(0).getMenu_no());

		// model.addAttribute("menulist", menulist);
		// model.addAttribute("selectMenuVo", selectMenuVo);
		return selectMenuVo;
	}

	/* �޴� ���� */

	@RequestMapping(value = "/menuEdit", method = RequestMethod.POST)
	public String menuEdit(@ModelAttribute AdminMenuVO bvo, Model model, HttpServletRequest request) throws Exception {
		logger.info("menuEdit ȣ�� ����");
		logger.info("menu_no :" + bvo.getMenu_no() + "�޴� ��ȣ ȣ��");
		logger.info("menu_no :" + bvo.getMenu_menufile() + "�޴� �̹��� ȣ��");
		int result = 0;
		String url = "";

		if (!bvo.getFile().isEmpty()) {
			logger.info("file = " + bvo.getFile().getOriginalFilename());
			if (!bvo.getMenu_menufile().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getMenu_menufile(), request);
			}
			String menufile = FileUploadUtil.fileUpload(bvo.getFile(), request, "menu");
			String thumbName = FileUploadUtil.makeThumbnail(menufile, request);
			bvo.setMenu_menufile(thumbName);
		} else {
			logger.info("�������� ���� ����");
		}
		result = menuService.menuEdit(bvo);
		if (result == 1) {
			url = "/menu/menuSelect";
		} else {
			model.addAttribute("code", 1);
			url = "/menu/menuSelect";
		}

		return "redirect:" + url;
	}

	/* ������ ���� */
	@RequestMapping(value = "/menuDelete", method = RequestMethod.GET)
	public String menuDelete(@ModelAttribute AdminMenuVO bvo, Model model, HttpServletRequest request,
			HttpSession session) throws IOException {
		String url = "";
		int result = 0;

		if (session.getAttribute("admin") == null) {
			url = "/adminSecurity";
		} else {
			logger.info("menudelete ȣ�� ����");

			FileUploadUtil.fileDelete(bvo.getMenu_menufile(), request);
			result = menuService.menuDelete(bvo.getMenu_no());
			logger.info("���� ���� ����");
			if (result == 1) {
				url = "/menu/menuSelect";
			} else {
				model.addAttribute("code", 1);
				url = "/menu/menuSelect";
			}
		}
		return "redirect:" + url;
	}

}
