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
	public AdminMenuVO menuClick(AdminMenuVO bvo) {
		// TODO Auto-generated method stub
		return (AdminMenuVO) session.selectOne("menuClick", bvo);
	}

}
