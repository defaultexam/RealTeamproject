package com.restaurant.user.register.dao;

import com.restaurant.user.member.vo.MemberVO;

public interface RegisterDAO {
	
	public int memberInsert(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public int memberDelete(String userID);
	public MemberVO memberSelect(String userId);
	/*
	public int securityInsert(MemberSecurity set);
	public MemberSecurity securitySelect(String userId);
	public int securityDelete(String userId);
	
	public MemberVO memberSelect(String userId);
	public int memberInsert(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public int memberDelete(String userId);
	*/

}
