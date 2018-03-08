package com.restaurant.admin.notice.service;

import java.util.List;

import com.restaurant.admin.notice.vo.AdminNoticeVO;


public interface AdminNoticeService {

	public List<AdminNoticeVO> noticeList(AdminNoticeVO nvo);
	public int noticeInsert(AdminNoticeVO nvo);
	public AdminNoticeVO noticeDetail(AdminNoticeVO nvo);
	public int noticeUpdate(AdminNoticeVO nvo);
	public int noticeDelete(int notice_no);
	// 전체 레코드 수를 구하기 위해서 추가코딩
	public int noticeListCnt(AdminNoticeVO nvo);
}
