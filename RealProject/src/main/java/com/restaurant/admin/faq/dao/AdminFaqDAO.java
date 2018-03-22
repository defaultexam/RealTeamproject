package com.restaurant.admin.faq.dao;

import java.util.List;

import com.restaurant.admin.faq.vo.AdminFaqVO;

public interface AdminFaqDAO {

	public List<AdminFaqVO> faqList(AdminFaqVO fvo);
	public void faqInsert(AdminFaqVO fvo);
	int faqListCnt(AdminFaqVO fvo);
	public AdminFaqVO faqDetail(int fvo);
	public int faqUpdate(AdminFaqVO fvo);
	public void faqDelete(int fvo);
}
