package com.restaurant.admin.notice.service;

import java.util.List;

import com.restaurant.admin.notice.vo.AdminNoticeVO;


public interface AdminNoticeService {

	public List<AdminNoticeVO> noticeList(AdminNoticeVO nvo);
	public int noticeInsert(AdminNoticeVO nvo);
	public AdminNoticeVO noticeDetail(AdminNoticeVO nvo);
	public int noticeUpdate(AdminNoticeVO nvo);
	public int noticeDelete(int notice_no);
	// ��ü ���ڵ� ���� ���ϱ� ���ؼ� �߰��ڵ�
	public int noticeListCnt(AdminNoticeVO nvo);
}
