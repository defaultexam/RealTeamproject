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
		return faqdao.boardListCnt(fvo);
	}

	/* �߰���� */
	@Override
	public void faqInsert(AdminFaqVO fvo) {
		faqdao.faqInsert(fvo);
	
	}

	/* �󼼺��� ���� ���� */
	@Override
	public AdminFaqVO faqDetail(AdminFaqVO fvo) {
		// TODO Auto-generated method stub
		return null;
	}

	/* ������� */
	@Override
	public int faqUpdate(AdminFaqVO fvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* ������� */
	@Override
	public int faqDelete(int faq_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
