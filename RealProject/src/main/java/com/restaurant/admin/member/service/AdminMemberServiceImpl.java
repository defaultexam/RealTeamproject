package com.restaurant.admin.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.member.dao.AdminMemberDao;
import com.restaurant.admin.member.vo.AdminMemberVO;

@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {
	Logger logger = Logger.getLogger(AdminMemberServiceImpl.class);
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		List<AdminMemberVO> list = null;
		list = adminMemberDao.memberList(avo);
		return list;
	}

	@Override
	public AdminMemberVO memberOne(AdminMemberVO avo) {
		// TODO Auto-generated method stub
		AdminMemberVO result = new AdminMemberVO();
		
		logger.info(avo.getMember_no());
		
		result = adminMemberDao.memberOne(avo);
		return result;
	}

}
