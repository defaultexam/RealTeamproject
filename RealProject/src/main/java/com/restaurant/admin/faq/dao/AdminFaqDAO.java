package com.restaurant.admin.faq.dao;

import java.util.List;

import com.restaurant.admin.faq.vo.AdminFaqVO;

public interface AdminFaqDAO {

	public List<AdminFaqVO> faqList(AdminFaqVO fvo);

	public int boardListCnt(AdminFaqVO fvo);
	
	public void faqInsert(AdminFaqVO fvo);

}
