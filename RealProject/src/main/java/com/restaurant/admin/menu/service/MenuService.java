package com.restaurant.admin.menu.service;

import java.util.List;

import com.restaurant.admin.menu.vo.AdminMenuVO;


public interface MenuService {

	public List<AdminMenuVO> menuSelect();

	public int menuInsert(AdminMenuVO bvo);
	/*
	 * public int menuUpdate(AdminMenuVO bvo);
	 * 
	 * public int menuDelete(int menu_no);
	 */
	
	public List<AdminMenuVO> menuList();

	public AdminMenuVO menuClick(AdminMenuVO bvo);
	
}
