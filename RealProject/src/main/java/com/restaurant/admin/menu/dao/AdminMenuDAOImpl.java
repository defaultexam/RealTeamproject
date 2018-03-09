package com.restaurant.admin.menu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.menu.vo.AdminMenuVO;

@Repository("menudao")
public class AdminMenuDAOImpl implements AdminMenuDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<AdminMenuVO> menuSelect() {
		List<AdminMenuVO> list = session.selectList("menuSelect");
		return list;
	}

	@Override
	public int menuInsert(AdminMenuVO bvo) {
		return session.insert("menuInsert", bvo);
	}

	@Override
	public List<AdminMenuVO> menulist() {
		return session.selectList("menuList");
	}

	@Override
	public List<AdminMenuVO> adminMenuDAO() {
		// TODO Auto-generated method stub
		return adminMenuDAO();
	}

	@Override
	public AdminMenuVO menuClick(int no) {
		// TODO Auto-generated method stub
		return (AdminMenuVO) session.selectOne("menuClick", no);
	}

	@Override
	public int menuEdit(AdminMenuVO bvo) {
		return session.update("menuEdit", bvo);
	}

	@Override
	public int menuDelete(int menu_no) {
		// TODO Auto-generated method stub
		return session.delete("menuDelete", menu_no);
	}

	@Override
	public AdminMenuVO menuSelectByNum(int menu_no) {
		AdminMenuVO list = session.selectOne("menuSelectByNum", menu_no);
		return list;
	}

/*	@Override
	public int menuListCnt(AdminMenuVO bvo) {
		return (Integer)session.selectOne("menuListCnt");
	}*/

}
