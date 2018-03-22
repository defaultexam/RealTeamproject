package com.restaurant.admin.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.restaurant.admin.faq.dao.AdminFaqDAO;
import com.restaurant.admin.faq.vo.AdminFaqVO;

@Service
@Transactional
public class AdminFaqServiceImpl implements AdminFaqService {
	@Autowired
	private AdminFaqDAO faqdao;

	/* 글목록 구현 */
	@Override
	public List<AdminFaqVO> faqList(AdminFaqVO fvo) {
		List<AdminFaqVO> faqList = null;

		faqList = faqdao.faqList(fvo);
		return faqList;
	}

	/* 전체 레코드 수 구현 */
	@Override
	public int faqListCnt(AdminFaqVO fvo) {
		return faqdao.faqListCnt(fvo);
	}

	/* 추가기능 */
	@Override
	public void faqInsert(AdminFaqVO fvo) {
		faqdao.faqInsert(fvo);
	}

	/* 수정 상세보기 */
	@Override
	public AdminFaqVO faqDetail(int fno) {
		AdminFaqVO fvo = new AdminFaqVO();
		fvo = faqdao.faqDetail(fno);
		return fvo;
	}

	/* 수정기능 */
	@Override
	public int faqUpdate(AdminFaqVO fvo) {
		int resert = 0;
		resert = faqdao.faqUpdate(fvo);
		return resert;
	}

	/* 삭제기능 */
	@Override
	public void faqDelete(int faq_no) {
		faqdao.faqDelete(faq_no);
	}

}
