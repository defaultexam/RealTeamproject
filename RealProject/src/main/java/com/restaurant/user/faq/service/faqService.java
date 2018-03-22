package com.restaurant.user.faq.service;

import java.util.List;

import com.restaurant.user.faq.vo.faqVO;

public interface faqService {

	public List<faqVO> faqList(faqVO fvo);

	public int faqListCnt(faqVO fvo);

}
