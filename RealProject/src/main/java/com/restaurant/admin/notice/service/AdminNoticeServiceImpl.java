package com.restaurant.admin.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.notice.dao.AdminNoticeDao;
import com.restaurant.admin.notice.vo.AdminNoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {
	Logger logger = Logger.getLogger(AdminNoticeServiceImpl.class);

	@Autowired
	private AdminNoticeDao adminNoticeDao;

	// 공지사항 목록
	@Override
	public List<AdminNoticeVO> noticeList(AdminNoticeVO nvo) {
		List<AdminNoticeVO> myList = null;

		// 정렬에 대한 기본값 설정
		if (nvo.getOrder_by() == null)
			nvo.setOrder_by("notice_no");
		if (nvo.getOrder_sc() == null)
			nvo.setOrder_sc("DESC");

		myList = adminNoticeDao.noticeList(nvo);

		return myList;
	}

	// 공지사항 관리자 글쓰기
	@Override
	public int noticeInsert(AdminNoticeVO nvo) {
		int result = 0;

		try {
			result = adminNoticeDao.noticeInsert(nvo);

		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 공지사항 상세보기
	@Override
	public AdminNoticeVO noticeDetail(AdminNoticeVO nvo) {
		AdminNoticeVO detail = null;
		detail = adminNoticeDao.noticeDetail(nvo);

		return detail;
	}

	// 공지사항 관리자 수정
	@Override
	public int noticeUpdate(AdminNoticeVO nvo) {
		int result = 0;

		try {
			result = adminNoticeDao.noticeUpdate(nvo);

		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	// 공지사항 관리자 삭제
	@Override
	public int noticeDelete(int notice_no) {
		int result = 0;

		try {
			result = adminNoticeDao.noticeDelete(notice_no);

		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 전체 레코드 수 구현
	@Override
	public int noticeListCnt(AdminNoticeVO nvo) {
		return adminNoticeDao.noticeListCnt(nvo);
	}

}
