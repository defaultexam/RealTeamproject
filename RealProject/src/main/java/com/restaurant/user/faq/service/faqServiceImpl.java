package com.restaurant.user.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.user.faq.dao.faqDAO;
import com.restaurant.user.faq.vo.faqVO;

@Service
@Transactional
public class faqServiceImpl implements faqService {
	@Autowired
	private faqDAO userfaqdao;

	/* 글목록 구현 */
	@Override
	public List<faqVO> faqList(faqVO fvo) {
		List<faqVO> faqList = null;

		faqList = userfaqdao.faqList(fvo);
		return faqList;
	}

	/* 전체 레코드 수 구현 */
	@Override
	public int faqListCnt(faqVO fvo) {
		return userfaqdao.faqListCnt(fvo);
	}

	
	
}
