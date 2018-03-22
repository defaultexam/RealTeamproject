package com.restaurant.admin.faq.service;

import java.util.List;

import com.restaurant.admin.faq.vo.AdminFaqVO;

public interface AdminFaqService {

	public List<AdminFaqVO> faqList(AdminFaqVO fvo);

	public int faqListCnt(AdminFaqVO fvo);

	public void faqInsert(AdminFaqVO fvo);

	public AdminFaqVO faqDetail(int fno);

	public int faqUpdate(AdminFaqVO fvo);

	public void faqDelete(int faq_no);


}
