package com.restaurant.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.member.vo.AdminMemberVO;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		return session.selectList("memberList", avo);
	}

	@Override
	public AdminMemberVO memberOne(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		return session.selectOne("memberOne", avo);
	}

}
