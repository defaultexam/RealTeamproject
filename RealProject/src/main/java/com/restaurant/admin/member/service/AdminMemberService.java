package com.restaurant.admin.member.service;

import java.util.List;

import com.restaurant.admin.member.vo.AdminMemberVO;

public interface AdminMemberService {
	
	public List<AdminMemberVO> memberList(AdminMemberVO avo);
	public AdminMemberVO memberOne(AdminMemberVO avo);

}
