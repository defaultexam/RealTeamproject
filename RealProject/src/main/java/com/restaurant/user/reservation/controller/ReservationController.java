package com.restaurant.user.reservation.controller;

import java.sql.Date;
import java.text.ParseException;
import java.util.List;

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

import com.restaurant.admin.couponhistory.vo.CouponHistoryVO;
import com.restaurant.admin.menu.service.MenuService;
import com.restaurant.admin.menu.vo.AdminMenuVO;
import com.restaurant.user.login.vo.LoginVO;
import com.restaurant.user.member.service.MemberService;
import com.restaurant.user.member.vo.MemberVO;
import com.restaurant.user.register.controller.RegisterController;
import com.restaurant.user.reservation.service.ReservationService;
import com.restaurant.user.reservation.vo.ReservationVO;
import com.restaurant.user.seat.service.SeatService;
import com.restaurant.user.seat.vo.SeatVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	Logger logger = Logger.getLogger(RegisterController.class);
	@Autowired
	private MenuService menuService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SeatService seatService;
	@Autowired
	private ReservationService reservationService;

	// ReservationController ��ü���� ������ ����� �� �ְ� ������ ���� ������.
	LoginVO loginvo = new LoginVO();

	/* �ּ�/register (GET �޼ҵ�) */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String reservation(HttpSession session, Model model) {
		logger.info("reservation get ȣ�� ����");
		loginvo = (LoginVO) session.getAttribute("login");
		return "user/reservation/reservation";
	}

	/* �޴� ��ü && �α��� ���� �ƴ� ��� */
	@RequestMapping(value = "/menu", method = RequestMethod.POST)
	public String loadMenu(@ModelAttribute AdminMenuVO bvo, Model model) {
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("/reservation/menu POST ȣ�� ����");
		model.addAttribute("menulist", menulist);
		logger.info("menulist �߰� ����");
		return "user/reservation/reservation";
	}

	/* �޴� ��ü && �α��� ���� ��� */
	@RequestMapping(value = "/menus", method = RequestMethod.POST)
	public String loadMenuCoupon(@ModelAttribute AdminMenuVO bvo, Model model) {
		List<AdminMenuVO> menulist = menuService.menuSelect();
		List<CouponHistoryVO> memberCouponInfo = null;
		MemberVO memberInfo = new MemberVO();
		logger.info("/reservation/menu POST ȣ�� ����");
		model.addAttribute("menulist", menulist);
		if (loginvo != null) {
			memberInfo = memberService.memberSelect(loginvo.getId());
			memberCouponInfo = memberService.memberCoupon(loginvo.getMember_no());
			for (int i = 0; i < memberCouponInfo.size(); i++) {
				if (memberCouponInfo.get(i).getCoupon_start() != null) {
					memberCouponInfo.get(i).setCoupon_start(memberCouponInfo.get(i).getCoupon_start().substring(0, 10));
					memberCouponInfo.get(i).setCoupon_end(memberCouponInfo.get(i).getCoupon_end().substring(0, 10));
				}
			}
			model.addAttribute("memberInfo", memberInfo);
			model.addAttribute("memberCouponInfo", memberCouponInfo);
			logger.info("memberCouponInfo Method ȣ�� ����, Attribute ���� �Ϸ�.");
		}
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("memberCouponInfo", memberCouponInfo);
		return "user/reservation/reservation";
	}

	/* �޴� ��ȣ�� �޾Ƽ� ���� ��ȯ */
	@ResponseBody
	@RequestMapping(value = "/checkmenu", method = RequestMethod.POST)
	public AdminMenuVO checkMenu(@ModelAttribute AdminMenuVO bvo, Model model) {
		AdminMenuVO selectedMenu = menuService.menuSelectByNum(bvo.getMenu_no());
		model.addAttribute("selectedmenu", selectedMenu);
		return selectedMenu;
	}

	@ResponseBody
	@RequestMapping(value = "/couponInfo", method = RequestMethod.POST)
	public List<CouponHistoryVO> memberOne(Model model) throws Exception {
		logger.info("reservation/couponInfo POST ȣ�� ����");
		MemberVO memberInfo = new MemberVO();
		List<CouponHistoryVO> memberCouponInfo = null;
		memberInfo = memberService.memberSelect(loginvo.getId());
		System.out.println(loginvo.getId());
		memberCouponInfo = memberService.memberCoupon(loginvo.getMember_no());
		System.out.println(loginvo.getMember_no());
		for (int i = 0; i < memberCouponInfo.size(); i++) {
			if (memberCouponInfo.get(i).getCoupon_start() != null) {
				memberCouponInfo.get(i).setCoupon_start(memberCouponInfo.get(i).getCoupon_start().substring(0, 10));
				memberCouponInfo.get(i).setCoupon_end(memberCouponInfo.get(i).getCoupon_end().substring(0, 10));
			}
		}
		System.out.println(memberInfo);
		System.out.println(memberCouponInfo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("memberCouponInfo", memberCouponInfo);
		return memberCouponInfo;
	}

	/* ���� */
	@ResponseBody
	@RequestMapping(value = "/date", method = RequestMethod.POST)
	public List<SeatVO> date(@RequestParam("seat_date") Date seat_date, Model model) throws ParseException {
		logger.info("reservation/date POST ȣ�� ����");
		List<SeatVO> seatvo = null;
		seatvo = seatService.selectSeat(seat_date);
		model.addAttribute("seatInfo", seatvo);
		return seatvo;
	}

	/* ���� */
	@ResponseBody
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserve(@ModelAttribute ReservationVO rvo, Model model) {
		logger.info("/reservation/reserve POST ȣ�� ����");
		String result;
		int resultnumber = reservationService.reservationInsert(rvo);
		if (resultnumber == 1)
			result = "����";
		else
			result = "����";
		return result;
	}
}
