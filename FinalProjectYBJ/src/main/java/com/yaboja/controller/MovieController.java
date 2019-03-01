package com.yaboja.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yaboja.biz.MovieBiz;
import com.yaboja.bizImpl.MovieBizImpl;
import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.PageMaker;
import com.yaboja.util.Crawler;




@Controller

public class MovieController {

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MovieBizImpl biz;
	
	
	MovieDto dto;
		
	@RequestMapping(value = "/movieBoard.do", method = RequestMethod.GET)
	public String getPresentMovie(Model model, String movieSeq) {
		
		List<MovieDto> movies = biz.selectPresentMovies();
		
		if(movies!=null) {
			for(MovieDto movie : movies) {
				System.out.println(movie);
			}		
			
			model.addAttribute("list", movies);
			
		}
		
		
		
		
		return "movieBoard/presentMovie";
	}
	
	@RequestMapping(value = "/preMovie.do", method = RequestMethod.GET)
	public String getPreMovie(Model model) {
		
		List<MovieDto> movies = biz.selectPreMovies();
		
		for(MovieDto movie : movies) {
			System.out.println(movie);
		}		
		
		model.addAttribute("list", movies);
		
		return "movieBoard/preMovie";
	}
	
	@RequestMapping(value = "/endMovie.do", method = RequestMethod.GET)
	public String getEndMovie(@ModelAttribute("cri") Criteria cri,Model model) {
		 logger.info("get list page 페이징 1단계");
		List<MovieDto> movies = biz.listPage(cri);
		
		for(MovieDto movie : movies) {
			System.out.println(movie);
		}		
		
		model.addAttribute("list", movies);
		
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(biz.listCount());
		 model.addAttribute("pageMaker", pageMaker);
		return "movieBoard/endMovie";
	}
	
	@RequestMapping(value = "/loadMovie.do", method = RequestMethod.GET)//영화 크롤링 및 저장
	@ResponseBody
	public String savePresentMovie() throws UnsupportedEncodingException {
		System.out.println("------관리자 수동 크롤링------");
		int res[] = biz.insert();
		if (res[1] > 0) {
			
			System.out.println("새로운 상영작" + res[1] +"개 db에 삽입," + res[0] + "개 종영작으로 업데이트! ");
		}else {
			System.out.println("수동 크롤링 결과 네이버 영화 업데이트 없음");
		}	
		String ajax = res[1] +" New Movies insert into DB, " + res[0] + " Update to EndMovies! ";
		URLEncoder.encode(ajax , "UTF-8");
		
		return ajax;
	}
	//영화 상세페이지
	@RequestMapping(value = "/movieInfo.do", method = RequestMethod.GET)
	public String movieInfo(Model model,String movieSeq, MovieDto moviedto) {
		
		System.out.println("상세페이지 왔당! 클릭한 영화 번호 : " + movieSeq);
		
		MovieDto dto = biz.selectOneMovie(Integer.parseInt(movieSeq));
		System.out.println(dto);
		
		
		
		model.addAttribute("moviedto", biz.selectOneMovie(Integer.parseInt(movieSeq)));
		Crawler crawler = new Crawler();
		model.addAttribute("content", crawler.getContent(dto.getCode()));

		
		
		return "movieBoard/movie_info";
	}
	
}
