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
import com.restaurant.user.member.vo.MemberSecurity;
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
	public String mypage(HttpSession session, Model model) throws Exception {
		logger.info("���������� GET ȣ�� ����");
		loginvo = (LoginVO) session.getAttribute("login");
		int login_no = loginvo.getMember_no();
		String login_id = loginvo.getId();
		MyPageVO insertId = new MyPageVO();
		insertId.setId(login_id);
		
		MyPageVO loginInfoVo = mypageservice.selectMemberID(insertId);

		MyPageVO myPageMember = mypageservice.memberInfoCnt(login_no);

		model.addAttribute("myPageMember", myPageMember);
		model.addAttribute("loginInfo", loginInfoVo);

		return "user/mypage/mypage";
	}

	// ���� ����
	@RequestMapping(value = "/reservationList", method = RequestMethod.GET)
	public ModelAndView reservationList(HttpSession session, Model model, @ModelAttribute MyPageVO mvo) {
		ModelAndView mav = new ModelAndView();
		logger.info("/reservationList GET ȣ�� ����");

		int login_no = loginvo.getMember_no();
		mvo.setMember_no(login_no);
		List<MyPageVO> userReservationList = mypageservice.userReservationNumberList(mvo);

		List<MyPageVO> reservationList = new ArrayList<>();
		if (userReservationList.isEmpty()) {
			logger.info("���೻������");
		} else {
			for (int i = 0; i < userReservationList.size(); i++) {
				reservationList.add(mypageservice.userReservationOne(userReservationList.get(i)));
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
		List<MyPageVO> userReservationNumberCancel = mypageservice.userReservationNumberCancel(mvo);

		List<MyPageVO> reservationCancel = new ArrayList<>();
		if (userReservationNumberCancel.isEmpty()) {
			logger.info("��ҳ�������");
		} else {
			for (int i = 0; i < userReservationNumberCancel.size(); i++) {
				reservationCancel.add(mypageservice.userReservationOneCancel(userReservationNumberCancel.get(i)));
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
		System.out.println("������Ʈ�ѷ� ����");
		result = mypageservice.userReservationEdit(mvo);
		return result;
	}

	// ���� ����Ʈ
	@RequestMapping(value = "/coupon", method = RequestMethod.GET)
	public String coupon(HttpSession session, Model model) {
		logger.info("/coupon GET ȣ�� ����");
		int login_no = loginvo.getMember_no();
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
			MyPageVO mvo2 = new MyPageVO();
			mvo2 = mypageservice.retrySelect(mvo);
			mvo.setRetry(mvo2.getRetry() + 1);
			mypageservice.retryUpdate(mvo);
			mav.addObject("retry", mvo.getRetry());
			mav.addObject("errCode", 1);
			if (mvo.getRetry() >= 5) {
				mvo.setRetry(0);
				mypageservice.retryUpdate(mvo);
				session.invalidate();
				session = request.getSession(true);

				mav.setViewName("user/login/login");
				mav.addObject("errCode", 7);
				return mav;
			}
			System.out.println(mvo.getRetry());
			mav.setViewName("user/mypage/updatePassword");
		} else {
			mvo.setRetry(0);
			mypageservice.retryUpdate(mvo);
			model.addAttribute("update", pwCheck);
			mav.setViewName("user/mypage/update");
		}
		return mav;
	}

	@RequestMapping(value = "/outPassword", method = RequestMethod.GET)
	public String outPassword() {
		logger.info("/outPassword GET ȣ�� ����");
		return "user/mypage/updatePassword";
	}

	@RequestMapping(value = "/outPassword", method = RequestMethod.POST)
	public ModelAndView out(@ModelAttribute MyPageVO mvo, HttpSession session, HttpServletRequest request, Model model)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		loginvo = (LoginVO) session.getAttribute("login");
		mvo.setId(loginvo.getId());
		MyPageVO pwCheck = mypageservice.pwSelect(mvo);
		if (pwCheck == null) {
			MyPageVO mvo2 = new MyPageVO();
			mvo2 = mypageservice.retrySelect(mvo);
			mvo.setRetry(mvo2.getRetry() + 1);
			mypageservice.retryUpdate(mvo);
			mav.addObject("retry", mvo.getRetry());
			mav.addObject("errCode", 1);
			if (mvo.getRetry() >= 5) {
				mvo.setRetry(0);
				mypageservice.retryUpdate(mvo);
				session.invalidate();
				session = request.getSession(true);

				mav.setViewName("user/login/login");
				mav.addObject("errCode", 7);
				return mav;
			}
			System.out.println(mvo.getRetry());
			mav.setViewName("user/mypage/outPassword");
		} else {
			mvo.setRetry(0);
			mypageservice.retryUpdate(mvo);
			model.addAttribute("out", pwCheck);

			mav.setViewName("user/mypage/out");
		}
		return mav;
	}

	// ȸ�� ���� ����
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute MyPageVO mvo, HttpSession session, Model model) {
		logger.info("/update post ��Ŀ� ���� �޼��� ȣ�� ����");
		ModelAndView mav = new ModelAndView();
		MemberSecurity sec = memberDAO.securitySelect(mvo.getId());
		int result = 0;
		mvo.setPassword(new String(OpenCrypt.getSHA256(mvo.getPassword(), sec.getSalt())));
		result = mypageservice.updateMember(mvo);
		if (result == 1) {
			mav.addObject("errCode", 3);
			mav.setViewName("redirect:/mypage"); // success to add new member; move to login page
			logger.info("ȸ������ ����, mypage�� �̵� �Ϸ�.");
		} else {
			logger.info("��������" + result);
			mav.setViewName("redirect:/mypage/update");
		}
		return mav;
	}

	@RequestMapping(value = "/out", method = RequestMethod.POST)
	public ModelAndView outMember(@ModelAttribute MyPageVO mvo1, HttpSession session, HttpServletRequest request,
			Model model) throws Exception {
		logger.info("/out post ��Ŀ� ���� �޼��� ȣ�� ����");
		ModelAndView mav = new ModelAndView();
		MyPageVO mvo2 = new MyPageVO();
		int count = 0;
		loginvo = (LoginVO) session.getAttribute("login");
		mvo1.setId(loginvo.getId());

		mvo2 = mypageservice.conditionSelect(mvo1);
		mvo2.setNo(mvo1.getNo());
		count = mvo2.getBookingCnt();
		System.out.println(count + " : ���హ��2");
		logger.info(count + " : ���హ��2");
		int no = mvo2.getNo();
		System.out.println(no + " : ȸ���ѹ�");
		logger.info(no + " : ȸ���ѹ�");

		if (count != 0) {
			logger.info("Ż����� : ���హ�� : " + count + "��");
			mav.addObject("errCode", 1);
			MyPageVO fail = mypageservice.memberInfoCnt(no);
			mav.addObject("myPageMember", fail);
			mav.addObject("loginInfo", loginvo);
			mav.setViewName("user/mypage/mypage");
		} else {
			logger.info("Ż��Ϸ�");
			mypageservice.outMember(no);
			session.invalidate();
			session = request.getSession(true);
			mav.setViewName("user/outsuccess/outSuccess");
		}
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
