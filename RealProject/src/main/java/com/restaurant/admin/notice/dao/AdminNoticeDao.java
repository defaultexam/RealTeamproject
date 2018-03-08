package com.restaurant.admin.notice.dao;

import java.util.List;

import com.restaurant.admin.notice.vo.AdminNoticeVO;

public interface AdminNoticeDao {
	public List<AdminNoticeVO> noticeList(AdminNoticeVO nvo);
	public int noticeInsert(AdminNoticeVO nvo);
	public AdminNoticeVO noticeDetail(AdminNoticeVO nvo);
	public int noticeUpdate(AdminNoticeVO nvo);
	public int noticeDelete(int notice_no);
	public int noticeListCnt(AdminNoticeVO nvo);
}
