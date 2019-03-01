package com.yaboja.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yaboja.biz.CoinBiz;
import com.yaboja.biz.MovieBiz;
import com.yaboja.biz.ReviewboardBiz;
import com.yaboja.biz.ReviewboardcomentBiz;
import com.yaboja.biz.UserBiz;
import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.PageMaker;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.ReviewboardcomentDto;
import com.yaboja.dto.SearchCriteria;
import com.yaboja.dto.UserDto;

@Controller
public class ReviewboardController {

	@Autowired
	UserBiz userBiz;
	@Autowired
	private CoinBiz coinBiz;
	@Autowired
	ReviewboardcomentBiz reviewboardcomentBiz;
	@Autowired
	private ReviewboardBiz reviewBiz;
	@Autowired
	private MovieBiz movieBiz;
	
	///////////////// ////////////////// 후기 게시판
	///////////////// /////////////////////////////////////

	private static final Logger logger = LoggerFactory.getLogger(ReviewboardController.class);

	@RequestMapping(value = "/reviewboard.do", method = RequestMethod.GET)
	public String reviewboard(Criteria cri, Model model, HttpSession session) {
		logger.info("글목록 페이징 1번이다.");
		List<ReviewboardDto> reviewboardList = reviewBiz.listPage(cri);
		List<UserDto> userList = new ArrayList<UserDto>();
		List<MovieDto> movieList = new ArrayList<MovieDto>();

		for (int i = 0; i < reviewboardList.size(); i++) {
			userList.add(userBiz.selectOne1(String.valueOf(reviewboardList.get(i).getUserseq())));
			movieList.add(reviewBiz.selectOne1(reviewboardList.get(i).getMovietitle()));
		}
/*		System.out.println(movieList.get(0).getMovietitle());
		
		System.out.println("///글제목:" + reviewboardList.size());
		System.out.println("///유저시퀀스:" + userList.size());*/		
		model.addAttribute("reviewboardList", reviewboardList);
		model.addAttribute("movieList",movieList);
		model.addAttribute("userList", userList);

		// 페이징 추가3
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewBiz.listCount());
		model.addAttribute("pageMaker", pageMaker);
		//

		return "review_board";
	}

	@RequestMapping(value = "/review_Insertform.do")
	public String insertform(Model model, ReviewboardDto dto, HttpSession session) {
		UserDto userdto = (UserDto) session.getAttribute("dto");
		String a = userdto.getUsername();
		System.out.println(a + "글쓰기 진입");
		return "review_Insert";
	}

	// 다중파일업로드
	@RequestMapping(value = "/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		


			// 파일정보
			String sFileInfo = "";
			
			String sFileInfo1 = "";
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			// 파일 기본경로 _ 상세경로



			String filePath_photo = "";
			File file_path = new File("C:\\Users\\");
			File[] fileList = file_path.listFiles();
			String tmp = "";

			// String filePath1 =
			// "C:/Workspace_Spring/FinalProject/src/main/webapp/resource/photo_upload/";
			

			if (fileList.length > 0) {
				for (int i = 0; i < fileList.length; i++) {
					System.out.println(fileList[i]);
					tmp = fileList[i] + "\\git\\yaboja\\FinalProject\\src\\main\\webapp\\resource\\photo_upload";
					File file_exe = new File(tmp);
					if (file_exe.isDirectory()) {
						filePath_photo = tmp;
					}
				}
			}

					
			String filePath1 = filePath_photo+"\\";
			String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
	
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}

			
			

			File file1 = new File(filePath1);
			if (!file1.exists()) {
				file1.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			String rlFileNm1 = filePath1 + realFileNm;
			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			OutputStream os1 = new FileOutputStream(rlFileNm1);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];

			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
				os1.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();
			os1.flush();
			os1.close();
			///////////////// 서버에 파일쓰기 /////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL=" + "/controller/resource/photo_upload/" + realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
	
	}

	@RequestMapping(value = "/review_Insert.do")
	   public void insert(Model model, HttpSession session, HttpServletResponse response,String userseq, String movietitle,String reviewboardtitle, String reviewboardcontent) throws IOException {
	      response.setContentType("text/html; charset=UTF-8");
	      MovieDto movieDto = null;
	      movieDto = reviewBiz.getmovietitle(movietitle);
	      ReviewboardDto reviewboardDto = new ReviewboardDto();
	      reviewboardDto.setUserseq(Integer.parseInt(userseq));
	      reviewboardDto.setReviewboardcontent(reviewboardcontent);
	      reviewboardDto.setReviewboardtitle(reviewboardtitle);
	      reviewboardDto.setMovietitle(movieDto.getMovieseq());
	      
	      int res = reviewBiz.insert(reviewboardDto);
	      if(res > 0) {
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('글 작성 성공');location.href='reviewboard.do';</script>");
	         out.close();
	      }else {
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('데이터베이스 오류');history.back();</script>");
	         out.close();
	      }
	   }

	   @RequestMapping(value = "/review_detail.do")
	   public String detail(int reviewboardseq, Model model) {
	      ReviewboardDto reviewboarddto = reviewBiz.selectOne(reviewboardseq);

	      Map<String, String> map = new HashMap<String, String>();
	      map.put("movietitle", String.valueOf(reviewboarddto.getMovietitle()));
	      MovieDto movieDto = reviewBiz.getMovie(map);
	      System.out.println("detail_movieDto>>>>>>>>" + movieDto);
	      
	      
	      movieDto.setImgurl(movieDto.getImgurl().replace("?type=m99_141_2", ""));

	      model.addAttribute("reviewboarddto", reviewboarddto);
	      model.addAttribute("movieDto",movieDto);
	      model.addAttribute("userdto", userBiz.selectOne1(String.valueOf(reviewboarddto.getUserseq())));

		return "review_detail";
	}

	@RequestMapping(value = "/review_updateform.do", method = RequestMethod.POST)
	public String updateform(Model model, int reviewboardseq) {
		ReviewboardDto reviewboarddto = reviewBiz.selectOne(reviewboardseq);

		Map<String, String> map = new HashMap<String, String>();
		map.put("movietitle", String.valueOf(reviewboarddto.getMovietitle()));
		MovieDto movieDto = reviewBiz.getMovie(map);
		model.addAttribute("movieDto",movieDto);
		
		model.addAttribute("reviewboarddto", reviewboarddto); //작성글의 리뷰보드 dto
		model.addAttribute("userdto", userBiz.selectOne1(String.valueOf(reviewboarddto.getUserseq()))); //작성글의 작성자 userdto

		return "review_update";

	}

	@RequestMapping(value = "/review_update.do", method = RequestMethod.POST)
	public String update(Model model, HttpServletResponse response, HttpSession session, int reviewboardseq,
			String reviewboardtitle, String reviewboardcontent) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		ReviewboardDto reviewboardDto = new ReviewboardDto();
		ReviewboardDto reviewboarddto = reviewBiz.selectOne(reviewboardseq);
		reviewboardDto.setReviewboardseq(reviewboardseq);
		reviewboardDto.setReviewboardtitle(reviewboardtitle);
		reviewboardDto.setReviewboardcontent(reviewboardcontent);

		Map<String, String> map = new HashMap<String, String>();
		map.put("movietitle", String.valueOf(reviewboarddto.getMovietitle()));

		int res = reviewBiz.update(reviewboardDto);
		MovieDto movieDto = null;

		movieDto = reviewBiz.getMovie(map);
		System.out.println("MOVIEDTO확인>>>>>>>>>" + movieDto);

		if (res > 0) {
			System.out.println("수정성공");
			model.addAttribute("reviewboarddto", reviewBiz.selectOne(reviewboardseq));
			model.addAttribute("movieDto", movieDto);
			model.addAttribute("userdto", userBiz.selectOne1(String.valueOf(reviewboarddto.getUserseq())));
			return "review_detail";
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정실패');history.back();</script>");
			out.close();
			System.out.println("수정실패");
			return null;
		}

	}

	@RequestMapping(value = "/reviewDelete.do")
	public String delete(Model model, int reviewboardseq) {
		int res = reviewBiz.delete(reviewboardseq);

		if (res > 0) {
			System.out.println("삭제성공");
			model.addAttribute("list", reviewBiz.selectList());
			return "review_board";
		} else {
			System.out.println("삭제실패");
			model.addAttribute("reviewboarddto", reviewBiz.selectOne(reviewboardseq));
			return "review_detail";
		}
	}

	///////////////////////////////////////////////////////////////////////////////// 댓
	///////////////////////////////////////////////////////////////////////////////// 글
	///////////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////

	@RequestMapping("/coment_list.do") // 댓글 리스트
	@ResponseBody
	private List<ReviewboardcomentDto> mCommentServiceList(Model model, int reviewboardseq) throws Exception {

		return reviewboardcomentBiz.commentList(reviewboardseq);
	}

	@RequestMapping("/coment_insert.do") // 댓글 작성
	@ResponseBody
	private int mCommentServiceInsert(@RequestParam int reviewboardseq, @RequestParam String reviewboardcomentcontent,
			HttpSession session) throws Exception {
		UserDto userdto = (UserDto) session.getAttribute("dto");
		ReviewboardcomentDto comment = new ReviewboardcomentDto();

		comment.setReviewboardseq(reviewboardseq);
		comment.setReviewboardcomentcontent(reviewboardcomentcontent);
		// 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지
		// 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
		comment.setUsername(userdto.getUsername());
		comment.setUserseq(userdto.getUserseq());

		// userdto.getUsername();

		return reviewboardcomentBiz.commentInsert(comment);
	}

	@RequestMapping("/coment_update.do") // 댓글 수정
	@ResponseBody
	private int mCommentServiceUpdateProc(@RequestParam int reviewboardcomentseq,
			@RequestParam String reviewboardcomentcontent) throws Exception {

		ReviewboardcomentDto comment = new ReviewboardcomentDto();
		comment.setReviewboardcomentseq(reviewboardcomentseq);
		comment.setReviewboardcomentcontent(reviewboardcomentcontent);

		return reviewboardcomentBiz.commentUpdate(comment);
	}

	@RequestMapping("/coment_delete.do") // 댓글 삭제
	@ResponseBody
	private int mCommentServiceDelete(@RequestParam int reviewboardcomentseq) throws Exception {

		return reviewboardcomentBiz.commentDelete(reviewboardcomentseq);
	}

   // 팝업창으로 이동
	@RequestMapping(value = "/movieSearch.do", method = RequestMethod.GET)
	public String movieSearch(@ModelAttribute("scri") SearchCriteria scri, Model model) {
		logger.info("진선 페이징 1 + 검색");
		List<MovieDto> movieList = reviewBiz.listSearch(scri);
		model.addAttribute("movieList", movieList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(reviewBiz.listCount1());
		model.addAttribute("pageMaker", pageMaker);

		return "movieSearch";
	}

	@RequestMapping(value = "/movieSearch1.do", method = RequestMethod.GET)
	public String movieSearch1(@ModelAttribute("scri") SearchCriteria scri, Model model) {
		logger.info("진선 페이징 1 + 검색");
		List<MovieDto> movieList = reviewBiz.listSearch(scri);
		model.addAttribute("movieList", movieList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(reviewBiz.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);

		return "movieSearch";
	}

}