package com.restaurant.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.menu.dao.AdminMenuDAO;
import com.restaurant.admin.menu.vo.AdminMenuVO;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
	@Autowired
	private AdminMenuDAO adminMenuDAO;

	@Override
	public List<AdminMenuVO> menuSelect() {
		List<AdminMenuVO> menulist = adminMenuDAO.menuSelect();

		return menulist;
	}

	@Override
	public int menuInsert(AdminMenuVO bvo) {
		int result = 0;
		try {
			result = adminMenuDAO.menuInsert(bvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}
	/*
	 * @Override public int menuUpdate(AdminMenuVO bvo) { // TODO Auto-generated
	 * method stub return 0; }
	 * 
	 * @Override public int menuDelete(int menu_no) { // TODO Auto-generated method
	 * stub return 0; }
	 */

	@Override
	public List<AdminMenuVO> menuList() {
		List<AdminMenuVO> myList = null;
		myList = adminMenuDAO.adminMenuDAO();
		return myList;
	}

	@Override
	public AdminMenuVO menuClick(AdminMenuVO bvo) {
		AdminMenuVO menuClickvo = null;
		menuClickvo = adminMenuDAO.menuClick(bvo);
		return menuClickvo;

	}

	@Override
	public AdminMenuVO menuSelectByNum(int menu_no) {
		AdminMenuVO menulist = adminMenuDAO.menuSelectByNum(menu_no);
		return menulist;
	}
}