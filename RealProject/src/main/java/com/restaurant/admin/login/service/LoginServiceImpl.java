package com.restaurant.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.login.dao.LoginDao;
import com.restaurant.admin.login.vo.LoginVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDao loginDao;

	@Override
	public String loginSelect(LoginVO vo) {
		String lvo = "";
		lvo = loginDao.loginSelect(vo);
		return lvo;
	}

}
