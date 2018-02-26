package com.restaurant.user.login.dao;

import com.restaurant.user.login.vo.LoginVO;

public interface LoginDAO {
	public LoginVO userIdSelect(String userId);

	public LoginVO loginSelect(LoginVO lvo);

	public int loginHistoryInsert(LoginVO lvo);

	public int loginHistoryUpdate(LoginVO lvo);

	public LoginVO loginHistorySelect(String userId);
}
