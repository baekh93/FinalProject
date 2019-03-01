package com.yaboja.controller;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yaboja.biz.MatchingboardBiz;

import com.yaboja.biz.MovieBiz;

import com.yaboja.biz.UserBiz;
import com.yaboja.bizImpl.MovieBizImpl;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.UserDto;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	@Autowired
	UserBiz userBiz;
	@Autowired
	private MovieBizImpl biz;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)

	public String getMain(Model model) {

		System.out.println("main왔당");

		List<MovieDto> movies = biz.selectPresentMovies();
		if (movies != null) {
			if (movies.size() >= 10) {
				movies = movies.subList(0, 10);
				for (MovieDto movie : movies) {
					System.out.println(movie);
				}

				model.addAttribute("list", movies);

			}
		}

		return "main";

	}

}
