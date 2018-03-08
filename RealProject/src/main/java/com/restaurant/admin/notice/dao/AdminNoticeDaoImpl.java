package com.restaurant.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.restaurant.admin.notice.vo.AdminNoticeVO;

public class AdminNoticeDaoImpl implements AdminNoticeDao{
	
	@Autowired
	private SqlSession session;

	// �������� ���
	@Override
	public List<AdminNoticeVO> noticeList(AdminNoticeVO nvo) {
		return session.selectList("noticeList", nvo);
	}

	// �������� ������ �۾���
	@Override
	public int noticeInsert(AdminNoticeVO nvo) {
		return session.insert("noticeInsert", nvo);
	}

	// �������� �� �󼼺���
	@Override
	public AdminNoticeVO noticeDetail(AdminNoticeVO nvo) {
		return session.selectOne("noticeDetail", nvo);
	}

	// �������� �� ����
	@Override
	public int noticeUpdate(AdminNoticeVO nvo) {
		return session.update("noticeUpdate", nvo);
	}

	// �������� �� ����
	@Override
	public int noticeDelete(int notice_no) {
		return session.delete("noticeDelete", notice_no);
	}

	// ��ü ���ڵ� �� ����
	@Override
	public int noticeListCnt(AdminNoticeVO nvo) {
		return (Integer)session.selectOne("noticeListCnt");
	}
}
