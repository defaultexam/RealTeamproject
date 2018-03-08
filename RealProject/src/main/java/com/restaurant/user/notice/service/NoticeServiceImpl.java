package com.restaurant.user.notice.service;

import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.notice.dao.AdminNoticeDao;
import com.restaurant.admin.notice.vo.AdminNoticeVO;
import com.restaurant.common.page.Paging;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private AdminNoticeDao adminNoticeDao;

	@Override
	public List<AdminNoticeVO> noticeList(AdminNoticeVO nvo) {
		List<AdminNoticeVO> aList = null;

		// 페이지 셋팅
		Paging.setPage(nvo);

		// 정렬에 대한 기본값 설정
		if (nvo.getOrder_by() == null)
			nvo.setOrder_by("notice_date");
		if (nvo.getOrder_sc() == null)
			nvo.setOrder_sc("DESC");

		if (!nvo.getKeyword().equals("")) {
			nvo.setStart_date("");
			nvo.setEnd_date("");
		}

		aList = adminNoticeDao.noticeList(nvo);

		return aList;
	}

	@Override
	public int noticeListCnt(AdminNoticeVO nvo) {
		int countNum = 0;
		countNum = adminNoticeDao.noticeListCnt(nvo);

		return countNum;
	}

	// 공지사항 상세보기
	@Override
	public AdminNoticeVO userNoticeDetail(AdminNoticeVO nvo) {
		AdminNoticeVO detail = null;
		detail = adminNoticeDao.noticeDetail(nvo);

		return detail;
	}

}
