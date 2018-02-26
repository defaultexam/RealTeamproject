package com.restaurant.user.register.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.user.member.vo.MemberVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO {
	@Autowired
	private SqlSession session;

	@Override
	public int memberInsert(MemberVO mvo) {
		return session.insert("memberInsert");
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return session.update("memberUpdate", mvo);
	}

	@Override
	public int memberDelete(String userID) {
		return session.delete("memberDelete", userID);
	}

	@Override
	public MemberVO memberSelect(String userId) {
		return (MemberVO) session.selectOne("memberSelect", userId);
	}

}
