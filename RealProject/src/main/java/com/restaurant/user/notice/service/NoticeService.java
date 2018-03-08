package com.restaurant.user.notice.service;

import java.util.List;

import com.restaurant.admin.notice.vo.AdminNoticeVO;

public interface NoticeService {
	public List<AdminNoticeVO> noticeList(AdminNoticeVO nvo);
	public int noticeListCnt(AdminNoticeVO nvo);
	public AdminNoticeVO userNoticeDetail(AdminNoticeVO nvo);

}
