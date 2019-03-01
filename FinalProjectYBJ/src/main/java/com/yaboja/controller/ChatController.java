package com.yaboja.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yaboja.biz.ChattingBiz;
import com.yaboja.dto.ChattingDto;

@Controller
public class ChatController {
	
	@Autowired
	private ChattingBiz chattingBiz;

	@RequestMapping(value="/chatSubmitServlet.do", method = RequestMethod.POST)
	@ResponseBody
	public void chatSubmitServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); //깨지지말라고 해줌
		String userseq1 = request.getParameter("userseq1");
		String userseq2 = request.getParameter("userseq2");
		String chatcontent = request.getParameter("chatcontent");
		System.out.println(userseq1+userseq2+chatcontent);
		if(userseq1 == null || userseq1.equals("") || userseq2 == null || userseq2.equals("")
				|| chatcontent == null || chatcontent.equals("")) {
			response.getWriter().write("0");
		}else if(userseq1.equals(userseq2)) {
			response.getWriter().write("-1");
		}else {
			userseq1 = URLDecoder.decode(userseq1, "UTF-8");
			userseq2 = URLDecoder.decode(userseq2,"UTF-8");
			chatcontent = URLDecoder.decode(chatcontent, "UTF-8");
			response.getWriter().write(chattingBiz.submit(userseq1, userseq2, chatcontent)+"");
		}
			
	}
	
	@RequestMapping(value="chatListServlet.do", method = RequestMethod.POST)
	@ResponseBody
	public void chatListServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userseq1 = request.getParameter("userseq1");
		String userseq2 = request.getParameter("userseq2");
		String listType = request.getParameter("listType");
		if(userseq1 == null || userseq1.equals("") || userseq2 == null || userseq2.equals("")
				|| listType == null || listType.equals("")) {
			response.getWriter().write("");
		}
		else if(listType.equals("ten")) 
			response.getWriter().write(getTen(URLDecoder.decode(userseq1,"UTF-8"),URLDecoder.decode(userseq2,"UTF-8")));
		else {
			try {
				response.getWriter().write(getID(URLDecoder.decode(userseq1,"UTF-8"),URLDecoder.decode(userseq2,"UTF-8"), listType));
			} catch(Exception e) {
				response.getWriter().write("");
			}
		}
	}
	public String getTen(String userseq1, String userseq2) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ArrayList<ChattingDto> chatList = chattingBiz.getChatListByRecent(userseq1, userseq2, 100);
		if(chatList.size() == 0) return "";
		for(int i = 0 ; i < chatList.size() ; i++) {
			result.append("[{\"value\": \""+chatList.get(i).getUserseq1()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getUserseq2()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getChatcontent()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getChattime().getYear()+"-"+chatList.get(i).getChattime().getMonth()+"-"+chatList.get(i).getChattime().getDate()+"\"}]");
			System.out.println(chatList.get(i).getChattime().getYear()+"-"+chatList.get(i).getChattime().getMonth()+"-"+chatList.get(i).getChattime().getDate());
			if(i != chatList.size() -1) 
				result.append(",");
		}
		result.append("], \"last\":\""+chatList.get(chatList.size() -1).getChatseq()+"\"}");
		chattingBiz.readChat(userseq1, userseq2);
		return result.toString();
		
	}
	public String getID(String userseq1, String userseq2,String chatseq) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ArrayList<ChattingDto> chatList = chattingBiz.getChatListByID(userseq1, userseq2, chatseq);
		if(chatList.size() == 0) return "";
		for(int i = 0 ; i < chatList.size() ; i++) {
			result.append("[{\"value\": \""+chatList.get(i).getUserseq1()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getUserseq2()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getChatcontent()+"\"},");
			result.append("{\"value\": \""+(chatList.get(i).getChattime().getYear()+1900)+"-"+(String.valueOf(chatList.get(i).getChattime().getMonth()).length()<2?"0"+(chatList.get(i).getChattime().getMonth()+1):(chatList.get(i).getChattime().getMonth()+1))+"-"+chatList.get(i).getChattime().getDate()+"\"}]");
			if(i != chatList.size() -1) 
				result.append(",");
		}
		result.append("], \"last\":\""+chatList.get(chatList.size() -1).getChatseq()+"\"}");
		chattingBiz.readChat(userseq1, userseq2);
		return result.toString();
		
	}

	@RequestMapping(value="/chatUnread.do", method=RequestMethod.POST)
	   @ResponseBody
	   public void chatUnread(HttpServletRequest request, HttpServletResponse response) throws IOException {
	      request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html;charset=UTF-8");
	      String userseq = request.getParameter("userseq");
	      if(userseq == null || userseq.equals("")) {
	         response.getWriter().write("0");
	      } else {
	         userseq = URLDecoder.decode(userseq, "UTF-8");
	         response.getWriter().write(chattingBiz.getAllUnreadChat(Integer.parseInt(userseq))+"");
	      }
	   }
}