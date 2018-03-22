package com.restaurant.user.faq.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.restaurant.common.page.Paging;
import com.restaurant.common.util.Util;
import com.restaurant.user.faq.service.faqService;
import com.restaurant.user.faq.vo.faqVO;

@Controller
@RequestMapping(value = "/faq")
public class faqController {

	Logger logger = Logger.getLogger(faqController.class);

	@Autowired
	private faqService faqService;

	/* �� ��� ���� */
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public String AdminFaqList(@ModelAttribute faqVO fvo, Model model) {
		logger.info("faq ����Ʈ ȣ��");
		/* ������ ���� */
		Paging.setPage(fvo);
		/* ��ü ���ڵ� �� ���� - service */
		int total = faqService.faqListCnt(fvo);
		logger.info("total: " + total);
		/* �۹�ȣ �缳�� */
		int count = total - (Util.nvl(fvo.getPage()) - 1) * Util.nvl(fvo.getPageSize());
		logger.info("count :" + count);

		List<faqVO> faqList = faqService.faqList(fvo);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("faqList", faqList);
		return "user/faq/faq";
	}
}
