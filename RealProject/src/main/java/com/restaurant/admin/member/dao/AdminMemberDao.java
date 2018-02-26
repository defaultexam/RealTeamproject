package com.restaurant.admin.member.dao;

import java.util.List;

import com.restaurant.admin.member.vo.AdminMemberVO;

public interface AdminMemberDao {

	public List<AdminMemberVO> memberList(AdminMemberVO avo);

	public AdminMemberVO memberOne(AdminMemberVO avo);

}
