package com.yaboja.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yaboja.biz.CoinBiz;
import com.yaboja.biz.ReviewboardBiz;
import com.yaboja.biz.ReviewboardcomentBiz;
import com.yaboja.biz.UserBiz;
import com.yaboja.dto.CoinDto;
import com.yaboja.dto.UserDto;

@Controller
public class CoinController {

	@Autowired
	UserBiz userBiz;
	@Autowired
	private CoinBiz coinBiz;
	@Autowired
	ReviewboardcomentBiz reviewboardcomentBiz;
	@Autowired
	private ReviewboardBiz reviewBiz;

///////////////////////////////////////////////   코인 //////////////////////////////////////////////

	@RequestMapping(value = "/coin_imp.do", method = RequestMethod.POST)
	public String getCharge(@RequestParam int point_val, Model model) {

		model.addAttribute("point_val", point_val);

		return "coin_imp";
	}

	@RequestMapping(value = "/coin_charge.do", method = RequestMethod.GET)
	public String getCoin_Charge(HttpSession session, HttpServletRequest request, Model model) {

		UserDto userdto = (UserDto) session.getAttribute("dto");

		int coin_charge = 0;
		int coin_use = 0;
		int coin_use1 = 0;
		int coin_val = 0;

		coin_charge = coinBiz.coin(userdto.getUserseq(), "충전");

		coin_use = coinBiz.coin(userdto.getUserseq(), "매칭 게시글 작성");
		coin_use1 = coinBiz.coin(userdto.getUserseq(), "상대방에게 매칭 신청");

		coin_val = ((coin_charge - (coin_use+coin_use1)) / 500);


		
		model.addAttribute("user_name", userdto.getUsername());
		model.addAttribute("coin", coin_val);

		return "coin_charge";
	}

///// 충전하는 페이지( ///////////////////////
	@RequestMapping(value = "/coin_payment_01.do", method = RequestMethod.GET)
	public String getCoin_Payment_01(HttpSession session, HttpServletRequest request, Model model) {

		UserDto userdto = (UserDto) session.getAttribute("dto");

		int point_val = 0;

// 포인트 충전 성공시
		if (request.getParameter("point_val") != null) {
			point_val = Integer.parseInt(request.getParameter("point_val"));
			coinBiz.coin_insert(userdto.getUserseq(), point_val, "충전");
			System.out.println("충전완료");
		}

		model.addAttribute("point_val", point_val);

		return "redirect:coin_payment.do";
	}

	////////// 리스트 가져오기 ///////////
	@RequestMapping(value = "/coin_payment.do", method = RequestMethod.GET)
	public String getCoin_Payment(HttpSession session, HttpServletRequest request, Model model) {

		UserDto userdto = (UserDto) session.getAttribute("dto");

		List<CoinDto> list = coinBiz.coin_selectAll(userdto.getUserseq());

		int coin_charge = 0;
		int coin_use = 0;
		int coin_use1 = 0;
		int coin_val = 0;

		coin_charge = coinBiz.coin(userdto.getUserseq(), "충전");

		coin_use = coinBiz.coin(userdto.getUserseq(), "매칭 게시글 작성");
		coin_use1 = coinBiz.coin(userdto.getUserseq(), "상대방에게 매칭 신청");

		coin_val = ((coin_charge - (coin_use+coin_use1)) / 500);


		model.addAttribute("coinlist", list);
		model.addAttribute("coin", coin_val);
		model.addAttribute("user_name", userdto.getUsername());

		return "coin_payment";
	}

////////// 사용//////////
	/*
	@RequestMapping(value = "/coin_payment_use_01.do", method = RequestMethod.GET)
	public String getCoin_payment_use_01(Model model, HttpServletRequest request, @RequestParam int point_val_01) {

		model.addAttribute("point_val_01", point_val_01);

		return "coin_pass";
	}
	*/

	/*
	@RequestMapping(value = "/coin_payment_use_01.do", method = RequestMethod.GET)
	public String getCoin_Payment_use(HttpSession session, HttpServletRequest request, Model model) {

		UserDto userdto = (UserDto) session.getAttribute("dto");

		int point_val_01 = 500;

		if (request.getParameter("point_val_01") != null) {
			point_val_01 = Integer.parseInt(request.getParameter("point_val_01"));
			coinBiz.coin_insert(userdto.getUserseq(), point_val_01, "사용");
			System.out.println("사용완료");
		}

		model.addAttribute("point_val_01", point_val_01);

		return "redirect:coin_payment.do";
	}

	@RequestMapping(value = "/example.do", method = RequestMethod.GET)
	public String getExample() {
		return "example";
	}
	*/

}
