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

	// 내정보 메인
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) throws Exception {
		logger.info("마이페이지 GET 호출 성공");
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

	// 예약 내역
	@RequestMapping(value = "/reservationList", method = RequestMethod.GET)
	public ModelAndView reservationList(HttpSession session, Model model, @ModelAttribute MyPageVO mvo) {
		ModelAndView mav = new ModelAndView();
		logger.info("/reservationList GET 호출 성공");

		int login_no = loginvo.getMember_no();
		mvo.setMember_no(login_no);
		List<MyPageVO> userReservationList = mypageservice.userReservationNumberList(mvo);

		List<MyPageVO> reservationList = new ArrayList<>();
		if (userReservationList.isEmpty()) {
			logger.info("예약내역없음");
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

	// 예약 취소 내역
	@RequestMapping(value = "/reservationCancel", method = RequestMethod.GET)
	public ModelAndView reservationCancel(HttpSession session, Model model, @ModelAttribute MyPageVO mvo) {
		ModelAndView mav = new ModelAndView();
		logger.info("/reservationCancel GET 호출 성공");

		int login_no = loginvo.getMember_no();
		mvo.setMember_no(login_no);
		List<MyPageVO> userReservationNumberCancel = mypageservice.userReservationNumberCancel(mvo);

		List<MyPageVO> reservationCancel = new ArrayList<>();
		if (userReservationNumberCancel.isEmpty()) {
			logger.info("취소내역없음");
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

	// 예약상태 수정
	@ResponseBody
	@RequestMapping(value = "/reservationEdit", method = RequestMethod.POST)
	public int userReservationEdit(@ModelAttribute MyPageVO mvo) throws Exception {
		int result = 0;
		System.out.println("수정컨트롤러 실행");
		result = mypageservice.userReservationEdit(mvo);
		return result;
	}

	// 쿠폰 리스트
	@RequestMapping(value = "/coupon", method = RequestMethod.GET)
	public String coupon(HttpSession session, Model model) {
		logger.info("/coupon GET 호출 성공");
		int login_no = loginvo.getMember_no();
		List<MyPageVO> myPageMember = null;
		myPageMember = mypageservice.userCouponList(login_no);
		model.addAttribute("myPageMember", myPageMember);
		model.addAttribute("loginInfo", loginvo);
		return "user/mypage/coupon";
	}

	// 정보수장 비밀번호 확인
	@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
	public String updatePassword() {
		logger.info("/updatePassword GET 호출 성공");
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
		logger.info("/outPassword GET 호출 성공");
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

	// 회원 정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute MyPageVO mvo, HttpSession session, Model model) {
		logger.info("/update post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		MemberSecurity sec = memberDAO.securitySelect(mvo.getId());
		int result = 0;
		mvo.setPassword(new String(OpenCrypt.getSHA256(mvo.getPassword(), sec.getSalt())));
		result = mypageservice.updateMember(mvo);
		if (result == 1) {
			mav.addObject("errCode", 3);
			mav.setViewName("redirect:/mypage"); // success to add new member; move to login page
			logger.info("회원수정 성공, mypage로 이동 완료.");
		} else {
			logger.info("수정실패" + result);
			mav.setViewName("redirect:/mypage/update");
		}
		return mav;
	}

	@RequestMapping(value = "/out", method = RequestMethod.POST)
	public ModelAndView outMember(@ModelAttribute MyPageVO mvo1, HttpSession session, HttpServletRequest request,
			Model model) throws Exception {
		logger.info("/out post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		MyPageVO mvo2 = new MyPageVO();
		int count = 0;
		loginvo = (LoginVO) session.getAttribute("login");
		mvo1.setId(loginvo.getId());

		mvo2 = mypageservice.conditionSelect(mvo1);
		mvo2.setNo(mvo1.getNo());
		count = mvo2.getBookingCnt();
		System.out.println(count + " : 예약갯수2");
		logger.info(count + " : 예약갯수2");
		int no = mvo2.getNo();
		System.out.println(no + " : 회원넘버");
		logger.info(no + " : 회원넘버");

		if (count != 0) {
			logger.info("탈퇴실패 : 예약갯수 : " + count + "개");
			mav.addObject("errCode", 1);
			MyPageVO fail = mypageservice.memberInfoCnt(no);
			mav.addObject("myPageMember", fail);
			mav.addObject("loginInfo", loginvo);
			mav.setViewName("user/mypage/mypage");
		} else {
			logger.info("탈퇴완료");
			mypageservice.outMember(no);
			session.invalidate();
			session = request.getSession(true);
			mav.setViewName("user/outsuccess/outSuccess");
		}
		return mav;
	}

	/* 회원가입 이메일 인증 */
	@ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	private String sendMail(HttpSession session, @RequestParam(value = "email") String email) {
		logger.info("/sendMail post 방식에 의한 메서드 호출 성공");
		return mailService.send(session, email);
	}
}
