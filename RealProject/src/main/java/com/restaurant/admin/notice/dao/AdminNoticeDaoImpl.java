package com.restaurant.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.restaurant.admin.notice.vo.AdminNoticeVO;

public class AdminNoticeDaoImpl implements AdminNoticeDao{
	
	@Autowired
	private SqlSession session;

	// 공지사항 목록
	@Override
	public List<AdminNoticeVO> noticeList(AdminNoticeVO nvo) {
		return session.selectList("noticeList", nvo);
	}

	// 공지사항 관리자 글쓰기
	@Override
	public int noticeInsert(AdminNoticeVO nvo) {
		return session.insert("noticeInsert", nvo);
	}

	// 공지사항 글 상세보기
	@Override
	public AdminNoticeVO noticeDetail(AdminNoticeVO nvo) {
		return session.selectOne("noticeDetail", nvo);
	}

	// 공지사항 글 수정
	@Override
	public int noticeUpdate(AdminNoticeVO nvo) {
		return session.update("noticeUpdate", nvo);
	}

	// 공지사항 글 삭제
	@Override
	public int noticeDelete(int notice_no) {
		return session.delete("noticeDelete", notice_no);
	}

	// 전체 레코드 수 구현
	@Override
	public int noticeListCnt(AdminNoticeVO nvo) {
		return (Integer)session.selectOne("noticeListCnt");
	}
}
