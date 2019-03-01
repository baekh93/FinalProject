package com.yaboja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnAboardController {

	//컨트롤러 추가
	@RequestMapping(value = "/qnaboard.do", method = RequestMethod.GET)
	public String getQna() {
		return "qna_board";
	}
	
}
