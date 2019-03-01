package com.yaboja.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.yaboja.biz.MoviecomentBiz;
import com.yaboja.dto.MoviecomentDto;
import com.yaboja.dto.UserDto;

@Controller
public class MovieComentController {

	
	@Autowired
	MoviecomentBiz moviecomentBiz;
	
	

	 @RequestMapping(value = "/movie_coment_list.do", method = RequestMethod.GET) // 댓글 리스트
	   @ResponseBody
	   private List<MoviecomentDto> mCommentServiceList(Model model, int movieseq) throws Exception {

		 System.out.println("1");
	      return moviecomentBiz.commentList(movieseq);
	   }

	   @RequestMapping("/movie_coment_insert.do") // 댓글 작성
	   @ResponseBody
	   private int mCommentServiceInsert(@RequestParam int movieseq, @RequestParam String moviecomentcontent,
	         HttpSession session) throws Exception {
	      UserDto userdto = (UserDto) session.getAttribute("dto");
	      MoviecomentDto comment = new MoviecomentDto();
	   System.out.println("2");
	   
	      comment.setMovieseq(movieseq);
	      comment.setMoviecomentcontent(moviecomentcontent);
	      // 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지
	      // 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
	      comment.setUsername(userdto.getUsername());
	      comment.setUserseq(userdto.getUserseq());
	      
	      //userdto.getUsername();

	      return moviecomentBiz.commentInsert(comment);
	   }

	   @RequestMapping("/movie_coment_update.do") // 댓글 수정
	   @ResponseBody
	   private int mCommentServiceUpdateProc(@RequestParam int moviecomentseq,
	         @RequestParam String moviecomentcontent) throws Exception {

	      MoviecomentDto comment = new MoviecomentDto();
	      comment.setMoviecomentseq(moviecomentseq);
	      comment.setMoviecomentcontent(moviecomentcontent);

	      return moviecomentBiz.commentUpdate(comment);
	   }

	   @RequestMapping("/movie_coment_delete.do") // 댓글 삭제
	   @ResponseBody
	   private int mCommentServiceDelete(@RequestParam int moviecomentseq) throws Exception {

	      return moviecomentBiz.commentDelete(moviecomentseq);
	   }

}
