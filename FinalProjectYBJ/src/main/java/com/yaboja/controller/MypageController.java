package com.yaboja.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yaboja.biz.CinemaBiz;
import com.yaboja.biz.MatchingBiz;
import com.yaboja.biz.MatchingboardBiz;
import com.yaboja.biz.MovieBiz;
import com.yaboja.biz.ReviewboardBiz;

import com.yaboja.biz.UserBiz;
import com.yaboja.dto.CinemaDto;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.CinemaDto;
import com.yaboja.dto.MatchingboardDto;
import com.yaboja.dto.MovieDto;

import com.yaboja.dto.UserDto;

@Controller
public class MypageController {


   
   @Autowired
   private UserBiz userBiz;
   @Autowired
   private MovieBiz movieBiz;
   @Autowired
   private CinemaBiz cinemaBiz;
   @Autowired
   private MatchingboardBiz matchingboardBiz;
   @Autowired
   private MatchingBiz matchingBiz;
 


   @Autowired
   private ReviewboardBiz reviewBiz;


   @RequestMapping("/mypage.do")
   public String mypage(Model model, HttpSession session, HttpServletResponse response) throws IOException {

      response.setContentType("text/html; charset=UTF-8");

      if (session.getAttribute("dto") == null) {
         PrintWriter out = response.getWriter();
         out.println("<script>alert('로그인 해주세요.');history.back();</script>");
         out.close();
         return null;
   
      } else {
         UserDto dto = (UserDto) session.getAttribute("dto");
         int userseq = dto.getUserseq();
         String userprofile = dto.getUserprofile();
//         System.out.println(">>>>>프로필사진_" + userprofile);
         List<ReviewboardDto> reviewdto = userBiz.myboardList(userseq);

         UserDto userdto = userBiz.selectOne(userseq);

         List<MovieDto> movielist = new ArrayList<MovieDto>();
         for (int i = 0; i < reviewdto.size(); i++) {
            movielist.add(reviewBiz.selectOne1(reviewdto.get(i).getMovietitle()));
            System.out.println(">>>>>내게시글영화제목test_" + movielist.get(i).getMovietitle());
         }
         // cinema 출력
         CinemaDto cinemadto1 = cinemaBiz.selectOne(dto.getUsercinema1());
         CinemaDto cinemadto2 = cinemaBiz.selectOne(dto.getUsercinema2());
         CinemaDto cinemadto3 = cinemaBiz.selectOne(dto.getUsercinema3());
         
          MatchingboardDto matchingboarddto = matchingboardBiz.userOne(userdto.getUserseq());
          if(matchingboarddto ==null) {
               
            }
            else {
            
               MovieDto moviedto = movieBiz.selectOne(matchingboarddto.getMovieseq());      
               CinemaDto cinemadto = cinemaBiz.selectOne(matchingboarddto.getCinemaseq());      
               model.addAttribute("moviedto",moviedto);
               model.addAttribute("cinemadto",cinemadto);
               model.addAttribute("matchingboarddto", matchingboarddto);
            }
         model.addAttribute("cinemadto1", cinemadto1);
         model.addAttribute("cinemadto2", cinemadto2);
         model.addAttribute("cinemadto3", cinemadto3);
         model.addAttribute("movielist", movielist);
         model.addAttribute("boardlist", reviewdto);
         model.addAttribute("dto", userBiz.selectOne(userseq));
         System.out.println("mypage : UserSeq_" + userseq);

      }

      
    
      return "mypage";
   }


   
   @RequestMapping(value = "/matchboarddelete.do")
   public void matchboarddelete(Model model, HttpSession session,MatchingboardDto matchingboarddto, HttpServletResponse response,HttpServletRequest request) throws IOException {
      
      response.setContentType("text/html; charset=utf-8"); 
      UserDto userdto=(UserDto)session.getAttribute("dto");
      String matchingboard = request.getParameter("matchingboard");
      int res = matchingboardBiz.deleteMatchingboard(Integer.parseInt(matchingboard));
     
           if(res>0) {
              //신청온 매칭신청 
              // 작성자가 나인 매칭이 여러개 ; P=>E
            matchingBiz.autoReject(userdto.getUserseq());
           
               PrintWriter out = response.getWriter();
               out.println("<script>alert('삭제 성공');location.href='mypage.do';</script>");
               out.close();
         }else {
            System.out.println("삭제실패");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('삭제 실패');location.href='mypage.do';</script>");
            out.close();
         }
      
   }
   
  

   // 회원정보 수정하러가기
   @RequestMapping("/mypage_updateform.do")
   public String updateform(Model model, HttpSession session) {
      UserDto dto = (UserDto) session.getAttribute("dto");

      int userseq = dto.getUserseq();

      List<CinemaDto> cinemaList = cinemaBiz.selectAll();
      model.addAttribute("cinemaList", cinemaList);
      model.addAttribute("dto", userBiz.selectOne(userseq));
      return "mypage_update";

   }

   // 수정하기
   @RequestMapping("/mypage_update.do")
   public void update(Model model, UserDto dto, HttpSession session, HttpServletResponse response, int userseq) throws IOException {
      response.setContentType("text/html; charset=utf-8"); 
      int res = userBiz.update(dto);
   

      if (res > 0) {
         dto = userBiz.selectOne(userseq);
         session.setAttribute("dto", dto);

         System.out.println("수정성공");

         response.sendRedirect("mypage.do");
      }else {
         System.out.println("수정실패");
         PrintWriter out = response.getWriter();
         out.println("<script>alert('수정실패');history.back();</script>");
         out.close();
      }
   }

   @RequestMapping("/userDelete.do")
   public String gradeUpdate(Model model, UserDto dto, HttpSession session) {
      dto = (UserDto) session.getAttribute("dto");
      int res = userBiz.gradeUpdate(dto); //삭제x , 탈퇴한 회원으로 등급변경
      if (res > 0) {
         session.invalidate();
         System.out.println("탈퇴처리");
      }
      return "main";

   }
}