package com.restaurant.admin.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.admin.faq.vo.AdminFaqVO;

import oracle.net.aso.i;

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
	public int faqListCnt(AdminFaqVO fvo) {
		return (Integer) session.selectOne("faqListCnt", fvo);
	}

	/* 글 추가 */
	@Override
	public void faqInsert(AdminFaqVO fvo) {
		session.insert("faqInsert", fvo);
	}

	/* 수정 상세 */
	@Override
	public AdminFaqVO faqDetail(int fno) {
		return (AdminFaqVO) session.selectOne("faqDetail", fno);
	}

	/* 글 수정 */
	@Override
	public int faqUpdate(AdminFaqVO fvo) {
		return (Integer) session.update("faqUpdate", fvo);
	}

	/* 글삭제 */
	@Override
	public void faqDelete(int fno) {
		session.delete("faqDelete", fno);
	}

}
