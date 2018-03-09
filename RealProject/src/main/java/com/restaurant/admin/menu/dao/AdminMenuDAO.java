package com.restaurant.admin.menu.dao;

import java.util.List;

import com.restaurant.admin.menu.vo.AdminMenuVO;

public interface AdminMenuDAO {
	public List<AdminMenuVO> menuSelect();

	public int menuInsert(AdminMenuVO bvo);

	public List<AdminMenuVO> menulist();

	public List<AdminMenuVO> adminMenuDAO();

	public AdminMenuVO menuClick(AdminMenuVO bvo);

	public AdminMenuVO menuSelectByNum(int menu_no);
}
