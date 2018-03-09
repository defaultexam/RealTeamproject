package com.restaurant.admin.menu.dao;

import java.util.List;

import com.restaurant.admin.menu.vo.AdminMenuVO;

public interface AdminMenuDAO {
	public List<AdminMenuVO> menuSelect();

	public int menuInsert(AdminMenuVO bvo);

	public List<AdminMenuVO> menulist();

	public List<AdminMenuVO> adminMenuDAO();

	public AdminMenuVO menuClick(int no);

	public int menuEdit(AdminMenuVO bvo);

	public int menuDelete(int menu_no);

	public AdminMenuVO menuSelectByNum(int menu_no);

	/*public int menuListCnt(AdminMenuVO bvo);*/

}
