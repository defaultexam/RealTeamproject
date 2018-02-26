package com.restaurant.admin.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.login.vo.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSession session;

	@Override
	public String loginSelect(LoginVO vo) {
		// TODO Auto-generated method stub
		return (String) session.selectOne("loginSelect", vo);
	}

}
