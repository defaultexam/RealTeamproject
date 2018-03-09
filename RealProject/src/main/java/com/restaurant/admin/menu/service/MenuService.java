package com.restaurant.admin.menu.service;

import java.util.List;

import com.restaurant.admin.menu.vo.AdminMenuVO;

public interface MenuService {

	public List<AdminMenuVO> menuSelect();

	public int menuInsert(AdminMenuVO bvo);

	public List<AdminMenuVO> menuList();

	public AdminMenuVO menuClick(int no);

	public int menuEdit(AdminMenuVO bvo);

	public int menuDelete(int bvo);

	public AdminMenuVO menuSelectByNum(int menu_no);

	/*public int menuListCnt(AdminMenuVO bvo);*/

}
