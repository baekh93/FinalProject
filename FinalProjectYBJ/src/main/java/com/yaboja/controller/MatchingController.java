package com.yaboja.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yaboja.biz.MatchingBiz;

@Controller
public class MatchingController {

	@Autowired
	private MatchingBiz matchingBiz;
	//작성자 : 다른사람이 신청했을때
	//신청자 : 수락/거절
	@RequestMapping(value = "/allUnreadMatching.do", method = RequestMethod.POST)//3개합치는것
	@ResponseBody
	public void allUnread(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userseq = request.getParameter("userseq");
		if (userseq == null || userseq.equals("")) {
			response.getWriter().write("0");
		} else {
			userseq = URLDecoder.decode(userseq, "UTF-8");
			response.getWriter().write(matchingBiz.getAllUnreadMatching(Integer.parseInt(userseq)) + "");
		}
	}
	@RequestMapping(value = "/unreadSuccess.do", method = RequestMethod.POST)
	@ResponseBody
	public void unreadSuccess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userseq = request.getParameter("userseq");
		if (userseq == null || userseq.equals("")) {
			response.getWriter().write("0");
		} else {
			userseq = URLDecoder.decode(userseq, "UTF-8");
			response.getWriter().write(matchingBiz.unreadSuccess(Integer.parseInt(userseq)) + "");
		}
	}
	@RequestMapping(value = "/unreadRequested.do", method = RequestMethod.POST)
	@ResponseBody
	public void unreadRequested(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userseq = request.getParameter("userseq");
		if (userseq == null || userseq.equals("")) {
			response.getWriter().write("0");
		} else {
			userseq = URLDecoder.decode(userseq, "UTF-8");
			response.getWriter().write(matchingBiz.unreadRequested(Integer.parseInt(userseq)) + "");
		}
	}
	@RequestMapping(value = "/unreadRejection.do", method = RequestMethod.POST)
	@ResponseBody
	public void unreadRejection(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userseq = request.getParameter("userseq");
		if (userseq == null || userseq.equals("")) {
			response.getWriter().write("0");
		} else {
			userseq = URLDecoder.decode(userseq, "UTF-8");
			response.getWriter().write(matchingBiz.unreadRejection(Integer.parseInt(userseq)) + "");
		}
	}
}
