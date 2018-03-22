package com.restaurant.user.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.restaurant.user.faq.vo.faqVO;


@Repository("userfaqdao")
public class faqDAOImpl implements faqDAO {

	@Autowired
	private SqlSession session;

	/* 글목록 */
	@Override
	public List<faqVO> faqList(faqVO fvo) {
		List<faqVO> list = session.selectList("userfaqList", fvo);
		return list;
	}

	/* 글개수 */
	@Override
	public int faqListCnt(faqVO fvo) {
		return (Integer) session.selectOne("userfaqListCnt", fvo);
	}

}
