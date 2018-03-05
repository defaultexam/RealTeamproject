package com.restaurant.user.mail.service;

import javax.servlet.http.HttpSession;

public interface MailService {

	String send(HttpSession session, String to);
}
