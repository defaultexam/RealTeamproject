package com.restaurant.common.page;

import com.restaurant.common.util.Util;
import com.restaurant.common.vo.CommonVO;

public class Paging {
	/*
	 * 페이징을 위한 설정 작업
	 * 
	 * @param cvo
	 */

	public static void setPage(CommonVO cvo) {
		System.out.println(cvo.getPage());
		int page = Util.nvl(cvo.getPage(), 1);
		System.out.println(cvo.getPageSize());
		int pageSize = Util.nvl(cvo.getPageSize(), 10);

		if (cvo.getPage() == null)
			cvo.setPage(page + "");
		if (cvo.getPageSize() == null)
			cvo.setPageSize(pageSize + "");

		int start_row = (page - 1) * pageSize + 1;
		int end_row = (page - 1) * pageSize + pageSize;

		cvo.setStart_row(start_row + "");
		cvo.setEnd_row(end_row + "");
	}

}
