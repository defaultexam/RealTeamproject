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

	/* �۸�� ���� */
	@Override
	public List<AdminFaqVO> faqList(AdminFaqVO fvo) {
		List<AdminFaqVO> faqList = null;

		faqList = faqdao.faqList(fvo);
		return faqList;
	}

	/* ��ü ���ڵ� �� ���� */
	@Override
	public int faqListCnt(AdminFaqVO fvo) {
		return faqdao.faqListCnt(fvo);
	}

	/* �߰���� */
	@Override
	public void faqInsert(AdminFaqVO fvo) {
		faqdao.faqInsert(fvo);
	}

	/* ���� �󼼺��� */
	@Override
	public AdminFaqVO faqDetail(int fno) {
		AdminFaqVO fvo = new AdminFaqVO();
		fvo = faqdao.faqDetail(fno);
		return fvo;
	}

	/* ������� */
	@Override
	public int faqUpdate(AdminFaqVO fvo) {
		int resert = 0;
		resert = faqdao.faqUpdate(fvo);
		return resert;
	}

	/* ������� */
	@Override
	public void faqDelete(int faq_no) {
		faqdao.faqDelete(faq_no);
	}

}
