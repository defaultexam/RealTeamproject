package com.restaurant.admin.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.faq.vo.AdminFaqVO;

@Repository("faqdao")
public class AdminFaqDAOImpl implements AdminFaqDAO {

	@Autowired
	private SqlSession session;

	/* 글목록 */
	@Override
	public List<AdminFaqVO> faqList(AdminFaqVO fvo) {
		List<AdminFaqVO> list = session.selectList("faqList", fvo);
		return list;
	}

	/* 글개수 */
	@Override
	public int boardListCnt(AdminFaqVO fvo) {
		return (Integer) session.selectOne("faqListCnt", fvo);
	}

	@Override
	public void faqInsert(AdminFaqVO fvo) {
		session.insert("faqInsert", fvo);

	}
}
