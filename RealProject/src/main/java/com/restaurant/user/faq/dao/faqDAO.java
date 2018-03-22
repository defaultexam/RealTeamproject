package com.restaurant.user.faq.dao;

import java.util.List;

import com.restaurant.admin.faq.vo.AdminFaqVO;
import com.restaurant.user.faq.vo.faqVO;

public interface faqDAO {

	public List<faqVO> faqList(faqVO fvo);

	int faqListCnt(faqVO fvo);
}
