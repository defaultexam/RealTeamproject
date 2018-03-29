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
import com.restaurant.user.reservation.service.ReservationService;
import com.restaurant.user.reservation.vo.ReservationVO;
import com.restaurant.user.seat.service.SeatService;
import com.restaurant.user.seat.vo.SeatVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	Logger logger = Logger.getLogger(ReservationController.class);
	@Autowired
	private MenuService menuService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SeatService seatService;
	@Autowired
	private ReservationService reservationService;

	// ReservationController 전체적인 곳에서 사용할 수 있게 밖으로 빼서 선언함.
	LoginVO loginvo = new LoginVO();

	/* 주소/register (GET 메소드) */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String reservation(HttpSession session, Model model) {
		logger.info("reservation get 호출 성공");
		loginvo = (LoginVO) session.getAttribute("login");
		return "user/reservation/reservation";
	}

	/* 초기 예약 페이지 호출시, 메뉴 전체 && 로그인 중이 아닐 경우 */
	@RequestMapping(value = "/menu", method = RequestMethod.POST)
	public String loadMenu(@ModelAttribute AdminMenuVO bvo, Model model) {
		List<AdminMenuVO> menulist = menuService.menuSelect();
		logger.info("/reservation/menu POST 호출 성공");
		model.addAttribute("menulist", menulist);
		logger.info("menulist 추가 성공");
		return "user/reservation/reservation";
	}

	/* 초기 예약 페이지 호출시, 메뉴 전체 && 로그인 중일 경우 */
	@RequestMapping(value = "/menus", method = RequestMethod.POST)
	public String loadMenuCoupon(@ModelAttribute AdminMenuVO bvo, Model model) {
		// menuService를 통해 menuSelect 쿼리를 진행, 리스트로 받아온다.
		List<AdminMenuVO> menulist = menuService.menuSelect();
		List<CouponHistoryVO> memberCouponInfo = null;
		MemberVO memberInfo = new MemberVO();
		logger.info("/reservation/menu POST 호출 성공");
		// 뷰에서 사용하기 위해 모델을 통해 menulist를 반환한다.
		model.addAttribute("menulist", menulist);
		// 로그인 상태임을 확인, 이 값이 null이 아닌 이유는 맨 위에 /register (GET)에서 값을 넘겨받았기 때문.
		if (loginvo != null) {
			// 존재하는 멤버인지 쿼리를 진행.
			memberInfo = memberService.memberSelect(loginvo.getId());
			// 조회된 멤버의 쿠폰 보유 내역을 확인한다.
			memberCouponInfo = memberService.memberCoupon(loginvo.getMember_no());
			for (int i = 0; i < memberCouponInfo.size(); i++) {
				if (memberCouponInfo.get(i).getCoupon_start() != null) {
					memberCouponInfo.get(i).setCoupon_start(memberCouponInfo.get(i).getCoupon_start().substring(0, 10));
					memberCouponInfo.get(i).setCoupon_end(memberCouponInfo.get(i).getCoupon_end().substring(0, 10));
				}
			}
			// 쿼리를 통해 받은 정보들을 모델을 통해 반환한다. 
			model.addAttribute("memberInfo", memberInfo);
			model.addAttribute("memberCouponInfo", memberCouponInfo);
			logger.info("memberCouponInfo Method 호출 성공, Attribute 저장 완료.");
		}
		return "user/reservation/reservation";
	}

	/* 예약에서 메뉴를 선택했을 때, 메뉴 번호를 받아서 정보 반환 */
	@ResponseBody
	@RequestMapping(value = "/checkmenu", method = RequestMethod.POST)
	public AdminMenuVO checkMenu(@ModelAttribute AdminMenuVO bvo, Model model) {
		AdminMenuVO selectedMenu = menuService.menuSelectByNum(bvo.getMenu_no());
		model.addAttribute("selectedmenu", selectedMenu);
		return selectedMenu;
	}

	/* 예약시 좌석 라디오 버튼을 눌렀을 때, 좌석 데이터 가져오기 */
	@ResponseBody
	@RequestMapping(value = "/date", method = RequestMethod.POST)
	public List<SeatVO> date(@RequestParam("seat_date") Date seat_date, Model model) throws ParseException {
		logger.info("reservation/date POST 호출 성공");
		// 빈 SeatVO를 생성하고, 받은 seat_date를 쿼리에 넣고 돌려 반환되는 값을 Model로 넘긴다. 
		List<SeatVO> seatvo = null;
		seatvo = seatService.selectSeat(seat_date);
		model.addAttribute("seatInfo", seatvo);
		return seatvo;
	}

	/* 예약 버튼을 눌렀을 때, 최종 예약 메소드 */
	@ResponseBody
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserve(@ModelAttribute ReservationVO rvo, Model model) {
		logger.info("/reservation/reserve POST 호출 성공");
		String result;
		MemberVO mvo = new MemberVO();
		// 데이터 베이스(booking 테이블)에 넘겨 받은 값을 추가 시도.
		int resultnumber = reservationService.reservationInsert(rvo);
		// insert 문이 성공할 경우, resultnumber은 1으로 반환받는다.
		if (resultnumber == 1) {
			// 좌석 데이터 값을 업데이트. (기존 값 - 예약 인원 수)=========================
			SeatVO svo = new SeatVO();
			svo.setSeat_no(rvo.getSeat_no());
			svo.setSeat_extra(rvo.getBook_people());
			boolean seatResult = seatService.updateSeat(svo);
			logger.info(seatResult + " seatService.updateSeat 결과, true or false");
			// ============================================================================
			// 쿠폰을 사용했을 경우, 쿠폰 사용 내역을 업데이트.
			if (rvo.getCoupon_no() != 9999) {
				// 쿠폰 -> coupon_status = '사용 완료'
				// 2개 이상의 값을 update로 넘겨야하기 때문에, 임시방편으로 MemberVO를 사용.
				// agreement1 = 쿠폰번호
				mvo.setAgreement1(rvo.getCoupon_no());
				// agreement2 = 할인 값 (discountprice)
				mvo.setAgreement2(rvo.getDiscount());
				memberService.memberCouponUpdate(mvo);
			}
			mvo = new MemberVO();
			// 구매 총액의 0.1% 만큼의 포인트를 적립한다.
			mvo.setMember_no(rvo.getMember_no());
			mvo.setPoint(rvo.getTotalpay() / 1000);
			int pointResult = memberService.memberPointUpdate(mvo);
			String pointResultToString;
			if (pointResult == 1)
				pointResultToString = "성공";
			else
				pointResultToString = "실패";
			logger.info("회원 번호 : " + mvo.getMember_no() + " 에 관련하여 포인트"+ mvo.getPoint() + "업데이트 성공 여부 : " + pointResultToString);
			// =============================================================================
			result = "성공";
		} else {
			result = "실패";
		}
		return result;
	}
}
