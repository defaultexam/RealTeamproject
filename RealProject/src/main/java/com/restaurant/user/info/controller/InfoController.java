package com.restaurant.user.info.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.user.member.controller.MemberController;

@Controller
@RequestMapping("/info")
public class InfoController {
	Logger logger = Logger.getLogger(MemberController.class);
/*으이그*/
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		logger.info("/info GET 호출 성공");
		return "user/info/info";
	}

	@RequestMapping(value = "/way", method = RequestMethod.GET)
	public String way() {
		logger.info("/info GET 호출 성공");
		return "user/info/way";
	}
}
