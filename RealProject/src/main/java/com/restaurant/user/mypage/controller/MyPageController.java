package com.restaurant.user.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.restaurant.common.util.OpenCrypt;
import com.restaurant.user.login.vo.LoginVO;
import com.restaurant.user.mail.service.MailService;
import com.restaurant.user.member.dao.MemberDAO;
import com.restaurant.user.member.service.MemberService;
import com.restaurant.user.member.vo.MemberSecurity;
import com.restaurant.user.member.vo.MemberVO;
import com.restaurant.user.mypage.service.MyPageService;
import com.restaurant.user.mypage.vo.MyPageVO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	Logger logger = Logger.getLogger(MyPageController.class);
	LoginVO loginvo = new LoginVO();

	@Autowired
	private MyPageService mypageservice;
	@Autowired
	private MailService mailService;
	@Autowired
	private MemberDAO memberDAO;

	// ������ ����
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		logger.info("���������� GET ȣ�� ����");
		loginvo = (LoginVO) session.getAttribute("login");
		int login_no = loginvo.getMember_no();

		MyPageVO myPageMember = mypageservice.memberInfoCnt(login_no);

		model.addAttribute("myPageMember", myPageMember);
		model.addAttribute("loginInfo", loginvo);

		return "user/mypage/mypage";
	}

	// ���� ����
	@RequestMapping(value = "/reservationList", method = RequestMethod.GET)
	public ModelAndView reservationList(HttpSession session, Model model, @ModelAttribute MyPageVO mvo) {
		ModelAndView mav = new ModelAndView();
		logger.info("/reservationList GET ȣ�� ����");

		int login_no = loginvo.getMember_no();
		mvo.setMember_no(login_no);
		logger.info("1");
		List<MyPageVO> userReservationList = mypageservice.userReservationNumberList(mvo);

		List<MyPageVO> reservationList = new ArrayList<>();
		if (userReservationList.isEmpty()) {
			logger.info("���೻������");
		} else {
			for (int i = 0; i < userReservationList.size(); i++) {
				reservationList.add(mypageservice.userReservationOne(userReservationList.get(i)));
				logger.info("2");
			}
		}
		mav.addObject("reservationList", reservationList);
		mav.addObject("loginInfo", loginvo);
		mav.setViewName("user/mypage/reservationList");
		return mav;
	}

	// ���� ��� ����
	@RequestMapping(value = "/reservationCancel", method = RequestMethod.GET)
	public ModelAndView reservationCancel(HttpSession session, Model model, @ModelAttribute MyPageVO mvo) {
		ModelAndView mav = new ModelAndView();
		logger.info("/reservationCancel GET ȣ�� ����");

		int login_no = loginvo.getMember_no();
		mvo.setMember_no(login_no);
		logger.info("1");
		List<MyPageVO> userReservationNumberCancel = mypageservice.userReservationNumberCancel(mvo);

		List<MyPageVO> reservationCancel = new ArrayList<>();
		if (userReservationNumberCancel.isEmpty()) {
			logger.info("��ҳ�������");
		} else {
			for (int i = 0; i < userReservationNumberCancel.size(); i++) {
				reservationCancel.add(mypageservice.userReservationOneCancel(userReservationNumberCancel.get(i)));
				logger.info("2");
			}
		}
		mav.addObject("reservationCancel", reservationCancel);
		mav.addObject("loginInfo", loginvo);
		mav.setViewName("user/mypage/reservationCancel");
		return mav;
	}

	// ������� ����
	@ResponseBody
	@RequestMapping(value = "/reservationEdit", method = RequestMethod.POST)
	public int userReservationEdit(@ModelAttribute MyPageVO mvo) throws Exception {
		int result = 0;
		System.out.println(mvo.getBook_no());
		System.out.println(mvo.getBook_condition());
		System.out.println(mvo.getCancel_bank());
		System.out.println("������Ʈ�ѷ� ����");
		result = mypageservice.userReservationEdit(mvo);
		return result;
	}

	// ���� ����Ʈ
	@RequestMapping(value = "/coupon", method = RequestMethod.GET)
	public String coupon(HttpSession session, Model model) {
		logger.info("/coupon GET ȣ�� ����");
		int login_no = loginvo.getMember_no();
		logger.info(login_no);

		List<MyPageVO> myPageMember = null;

		myPageMember = mypageservice.userCouponList(login_no);

		model.addAttribute("myPageMember", myPageMember);
		model.addAttribute("loginInfo", loginvo);
		return "user/mypage/coupon";
	}

	// �������� ��й�ȣ Ȯ��
	@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
	public String updatePassword() {
		logger.info("/updatePassword GET ȣ�� ����");
		return "user/mypage/updatePassword";
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute MyPageVO mvo, HttpSession session, HttpServletRequest request,
			Model model) throws Exception {
		ModelAndView mav = new ModelAndView();

		loginvo = (LoginVO) session.getAttribute("login");
		mvo.setId(loginvo.getId());
		MyPageVO pwCheck = mypageservice.pwSelect(mvo);
		if (pwCheck == null) {
			mvo.setRetry(mvo.getRetry() + 1);
			mav.addObject("retry", mvo.getRetry());
			mav.addObject("errCode", 1);
			if (mvo.getRetry() >= 5) {
				session.invalidate();
				session = request.getSession(true);
				mav.addObject("errCode", 3);
				return mav;
			}
			System.out.println(mvo.getRetry());
			mav.setViewName("user/mypage/updatePassword");
		} else {
			mvo.setRetry(0);
			model.addAttribute("update", pwCheck);
			mav.setViewName("user/mypage/update");
		}
		return mav;
	}

	@RequestMapping(value = "/outPassword", method = RequestMethod.GET)
	public String outPassword() {
		logger.info("/outPassword GET ȣ�� ����");
		return "user/mypage/outPassword";
	}

	// ȸ�� ���� ����
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute MyPageVO mvo, HttpSession session, Model model) {
		logger.info("/update post ��Ŀ� ���� �޼��� ȣ�� ����");
		System.out.println(mvo.getPassword()+"pw");
		System.out.println(mvo.getWeddingdate()+"wd");
		System.out.println(mvo.getPhone()+"ph");
		System.out.println(mvo.getEmail()+"em");
		System.out.println(mvo.getAddress()+"ad");
		System.out.println(mvo.getMarriage()+"ma");
		System.out.println(mvo.getJob()+"jo");
		System.out.println(mvo.getNo()+"no");
		
		
		ModelAndView mav = new ModelAndView();
		System.out.println(mvo.getId()+"+0");
		MemberSecurity sec = memberDAO.securitySelect(mvo.getId());
		int result = 0;
		System.out.println(sec.getSalt()+"+0");
		System.out.println(mvo.getPassword()+"+1");
		mvo.setPassword(new String(OpenCrypt.getSHA256(mvo.getPassword(), sec.getSalt())));
		System.out.println(mvo.getPassword()+"+2");
		result = mypageservice.updateMember(mvo);

		if (result == 1) {
			mav.addObject("errCode", 3);
			mav.setViewName("redirect:/mypage"); // success to add new member; move to login page
			logger.info("ȸ������ ����, mypage�� �̵� �Ϸ�.");

		} else {
			logger.info("��������" + result);
			mav.setViewName("redirect:/mypage/update");
		}
		/*
		 * switch (result) { case 1: mav.addObject("errCode", 1); // userId already
		 * exist mav.setViewName("user/mypage/update"); break; case 3:
		 * mav.addObject("errCode", 3); mav.setViewName("user/mypage/mypage"); //
		 * success to add new member; move to login page
		 * logger.info("ȸ������ ����, mypage�� �̵� �Ϸ�."); break; default:
		 * mav.addObject("errCode", 2); // failed to add new member
		 * mav.setViewName("user/mypage/update"); break; }
		 */
		return mav;
	}

	/* ȸ������ �̸��� ���� */
	@ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	private String sendMail(HttpSession session, @RequestParam(value = "email") String email) {
		logger.info("/sendMail post ��Ŀ� ���� �޼��� ȣ�� ����");
		return mailService.send(session, email);
	}
}
