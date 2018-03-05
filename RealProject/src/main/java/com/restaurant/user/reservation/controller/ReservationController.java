package com.restaurant.user.reservation.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.user.register.controller.RegisterController;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	Logger logger = Logger.getLogger(RegisterController.class);

	/* 주소/register (GET 메소드) */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String reservation() {
		logger.info("register get 호출 성공");
		return "user/reservation/reservation";
	}

}
