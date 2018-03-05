package com.restaurant.user.mail.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("MailService")
public class MailServiceImpl implements MailService {
	private final JavaMailSender javaMailSender;

	@Autowired
	public MailServiceImpl(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@Override
	public String send(HttpSession session, String to) {
		String joinCode = "";
		try {
			int randomCode = new Random().nextInt(10000) + 1000;
			joinCode = String.valueOf(randomCode);
			session.setAttribute("joinCode", joinCode);
			StringBuilder sb = new StringBuilder();
			sb.append("회원님의 회원가입 인증번호는 ").append(joinCode).append("입니다.");
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject("Yeop's Restaurant, 이메일 인증번호를 확인해주세요.");
			helper.setText(sb.toString());
			helper.setFrom("00aaaa00@naver.com");
			helper.setTo(to);
			javaMailSender.send(message);
			return joinCode;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return joinCode;
	}
}
