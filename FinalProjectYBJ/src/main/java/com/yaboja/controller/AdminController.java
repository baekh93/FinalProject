package com.yaboja.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yaboja.biz.CinemaBiz;
import com.yaboja.biz.MovieBiz;
import com.yaboja.biz.UserBiz;
import com.yaboja.dto.CinemaDto;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.UserDto;

@Controller
public class AdminController {

	
	@Autowired
	UserBiz userBiz;
	
	@Autowired
	CinemaBiz cinemaBiz;
	
	@Autowired
	MovieBiz movieBiz;
	
	

	@RequestMapping(value="adminPreferences.do", method = RequestMethod.GET)
	public String adminPreferences(Model model) {
		List<UserDto> userList=userBiz.selectAll();
		model.addAttribute("userList", userList);
		return "admin_user";
	}
	@RequestMapping(value="dropUser.do", method = RequestMethod.GET)
	public String dropUser(int userseq,Model model) {
		
		int res=userBiz.updateUser(userseq,"drop");
		if(res>0) {
		List<UserDto> userList=userBiz.selectAll();
		model.addAttribute("userList", userList);
		return "admin_user";
		}else {
			return "admin_user";
		}
	}
	@RequestMapping(value="advanceUser.do", method = RequestMethod.GET)
	public String advanceUser(int userseq,Model model) {
		
		int res=userBiz.updateUser(userseq,"admin");
		if(res>0) {
		List<UserDto> userList=userBiz.selectAll();
		model.addAttribute("userList", userList);
		return "admin_user";
		}else {
			return "admin_user";
		}
	}
	
	@RequestMapping(value="adminCinema.do", method = RequestMethod.GET)
	public String updateCinema(Model model) {
		
		List<CinemaDto> cinemaList = cinemaBiz.selectList();
		if(cinemaList.size()>0) {
		model.addAttribute("cinemaList", cinemaList);
		}
		
		return "admin/admin_cinema";
		
		
	}
	
	@RequestMapping(value="map1.do", method = RequestMethod.GET)
	public String goMap1(Model model) {
		
		
		
		return "admin/map1";	
	}
	
	@RequestMapping(value="insertCinema.do", method = RequestMethod.GET)
	@ResponseBody
	public String insertCinema(Model model,HttpServletResponse response,String cinema,String latitude, String longitude) throws IOException {
		
		System.out.println(cinema + "/" +latitude+"/"+longitude);
		
		CinemaDto cinemaDto = new CinemaDto(cinema,latitude,longitude);
		
		int res = cinemaBiz.insertCinema(cinemaDto);
		if (res > 0) {
			System.out.println(cinema + "/" +latitude+"/"+longitude +"삽입성공");
		}else {
			System.out.println("삽입 영화 없음");
		}	
		
		
		return "ok";
	}
	
	@RequestMapping(value="adminMovie.do", method = RequestMethod.GET)
	public String adminMovie(Model model) {
		
		List<MovieDto> list = movieBiz.selectPresentMovies();
		int size = list.size();
		
		model.addAttribute("presentMovieList", list);
		model.addAttribute("presentMovieSize", size);
		
		list = movieBiz.selectEndMovies();
		size = list.size();
		
		model.addAttribute("endMovieList", list);
		model.addAttribute("endMovieSize", size);
		
		
		return "admin/adminMovie";	
	}
	@RequestMapping(value="deleteCinema.do", method = RequestMethod.GET)
	@ResponseBody
	public String deleteCinema(Model model,String cinemaseq) {
		
		
		int res = cinemaBiz.deleteCinema(Integer.parseInt(cinemaseq));
		if(res>0) {
			System.out.println(cinemaseq+" cinema 삭제 성공!");
		}else {
			System.out.println(cinemaseq+" cinema 삭제 실패!");
		}
		
		return "<script> location.href=\"adminCinema.do\"</script>";
		
		
	}
}
