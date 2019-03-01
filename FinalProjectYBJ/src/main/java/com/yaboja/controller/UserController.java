package com.yaboja.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.yaboja.bizImpl.CinemaBizImpl;
import com.yaboja.bizImpl.UserBizImpl;
import com.yaboja.dto.CinemaDto;
import com.yaboja.dto.UserDto;
import com.yaboja.util.Gmail;
import com.yaboja.util.SHA256;

@Controller
public class UserController {

	@Autowired
	UserBizImpl userbiz;
	@Autowired
	CinemaBizImpl cinemabiz;

	//회원가입 이용약관 
	@RequestMapping(value = "joincheck.do", method = RequestMethod.GET)
	public String joincheck() {

		return "joincheck";
	}
	//회원가입폼
	@RequestMapping(value = "joinform.do", method = RequestMethod.GET)
	public String joinform(Model model) {
		List<CinemaDto> cinemaList=cinemabiz.selectAll();

		model.addAttribute("cinemaList",cinemaList);
		return "joinform";
	}
	//회원가입 처리
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public String join(UserDto userdto,HttpServletResponse response) throws IOException {
		int res=userbiz.insert(userdto);
		if(res>0) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('회원가입을 성공하였습니다.');</script>"); // history.go(-1);</script>
            out.flush();
			return "main";
		}else {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('회원가입을 실패하였습니다.');</script>"); // history.go(-1);</script>
            out.flush();
			return "joinform";
		}
		
	}
	//로그인 폼
	@RequestMapping(value="loginform.do",method = RequestMethod.GET)
	public String loginform() {
		
		return "loginform";
	}
	//로그아웃
	@RequestMapping(value="logout.do",method = RequestMethod.GET)
	public String logout(String userpw, HttpSession session,Model model,HttpServletRequest request) {
		
		//비밀번호가 "kakao"이면 카카오 로그아웃처리
		System.out.println(userpw);
		if(userpw.equals("kakao")) {
			//사용자정보 (사용자토큰)
			System.out.println("다시 코드체크 :"+request.getSession().getServletContext().getAttribute("code"));
			JsonNode jsonToken = (JsonNode) request.getSession().getServletContext().getAttribute("access_token");
//			System.out.println("//"+jsonToken);
			//			JsonNode jsonToken = getAccessToken(code);		
//			System.out.println("access_token : " + jsonToken.get("access_token"));
			System.out.println("엑세스 토큰 : "+jsonToken.get("access_token"));
			JsonNode userInfo = kakaoLogout(jsonToken.get("access_token"));
			System.out.println("사용자정보(카카오)"+userInfo);
			
			System.out.println();
		}
		session.invalidate();
		System.out.println("로그아웃!");
			
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("view","main");
		
		return "inc/msg";
	}
	//로그인 처리
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(String userid, String userpw, HttpSession session,HttpServletResponse response,Model model) throws IOException {

		UserDto dto=userbiz.login(userid,userpw);
		
		if(dto ==null) {
			System.out.println("로그인 실패!");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.');</script>"); // history.go(-1);</script>
            out.flush();
			return "main";
		}else if(dto.getUsergrade().equals("drop")) {
			System.out.println("로그인 실패!");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('탈퇴한 회원입니다.');</script>"); // history.go(-1);</script>
            out.flush();
			return "main";
		}
		
		else {
			session.setAttribute("dto", dto);
			
			System.out.println("로그인 성공!");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
//            out.println("<script>alert('로그인 성공하였습니다.');</script>"); // history.go(-1);</script>
            out.flush();
    		model.addAttribute("msg", "로그인 성공하였습니다.");
    		model.addAttribute("view","main");
			return "inc/msg";
		}
		
		
	}	
	@RequestMapping(value="kakaoLoginForm.do",method = { RequestMethod.GET, RequestMethod.POST } )
	public String kakaoLoginForm() {
		return "kakaoLoginForm";
	}
	
	//ID 중복체크
	@RequestMapping(value = "checkId.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(String id) {
		UserDto dto = userbiz.selectOne(id);
		
		if(dto == null) {
			return 0;
		}else {
			return 1;
		}

	}

	
	//파일 업로드 순서(ajax)
	//1.dependency 2개 추가 (주석 처리해놈) 2.servlet-context에서 multipartResolver 추가
    @RequestMapping(value = "fileUpload.do", method=RequestMethod.POST)
    @ResponseBody
    public String fileUp(String userid, MultipartHttpServletRequest multi, HttpServletRequest request) throws FileNotFoundException {

        // 저장 경로 설정	
    	String path="";
    	File file = new File("C:\\Users\\");
    	File[] fileList = file.listFiles(); 
    	String tmp=""; 

    	
    	if(fileList.length > 0){
    	    for(int i=0; i < fileList.length; i++){
//    	    	System.out.println(fileList[i]);
    	    	tmp=fileList[i]+"\\git\\yaboja\\FinalProject\\src\\main\\webapp\\profile";
    	    	File file_exe= new File(tmp);
    	    	if(file_exe.isDirectory()) {
    	    		path=tmp;
    	    	}
    	    	
    	    }
    	}
    	
    	
    	System.out.println("!!!!"+path);
        String newFileName = ""; // 업로드 되는 파일명
        File dir = new File(path); 
        //파일 경로 정한 것
        
        if(!dir.isDirectory()){
            dir.mkdir();
        }
         
        Iterator<String> files = multi.getFileNames();
     
        String fileName=null;
        while(files.hasNext()){  
            String uploadFile = files.next();         
            MultipartFile mFile = multi.getFile(uploadFile);
             fileName = mFile.getOriginalFilename();
             
            
            //파일이름 유저 주키로 지정
            int index=fileName.indexOf(".");
            fileName=userid+"."+fileName.substring(index+1);
            System.out.println("실제 파일 이름 : " +fileName);
            try {
                mFile.transferTo(new File(path+"/"+fileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return fileName;
    }
    

    
    //이메일 인증
    @RequestMapping(value="emailChk.do", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public String emailChk(String email) {
    	String emailHash=SHA256.getSHA256(email);
    	
    	//host확인!!!!!!!!!!!!!!
    	String host = "http://localhost:8787/controller/";
    	String from = "osh5656@gmail.com";
    	String to = email;
    	String subject = "회원가입을 위한 이메일 인증 메일입니다.";
    	String content ="인증 번호 : "+emailHash;
    		
    	Properties p = new Properties();
    	p.put("mail.smtp.user", from);
    	p.put("mail.smtp.host", "smtp.googlemail.com");
    	p.put("mail.smtp.port", "465");
    	p.put("mail.smtp.starttls.enable","true");
    	p.put("mail.smtp.auth","true");
    	p.put("mail.smtp.debug","true");
    	p.put("mail.smtp.socketFactory.port","465");
    	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    	p.put("mail.smtp.socketFactory.fallback","false");
        // 설정
    	
    	
    	try{
    		Authenticator auth = new Gmail();
    		Session ses = Session.getInstance(p, auth);
    		ses.setDebug(true);
    		MimeMessage msg = new MimeMessage(ses);
    		msg.setSubject(subject);
    		Address fromAddr = new InternetAddress(from);
    		msg.setFrom(fromAddr);
    		Address toAddr = new InternetAddress(to);
    		msg.addRecipient(Message.RecipientType.TO,toAddr);
    		msg.setContent(content,"text/html;charset=UTF8");
    		Transport.send(msg);
    	}catch(Exception e){
    		e.printStackTrace();
    
    		
    	}
    	
    	
    	return emailHash;
    }

    //카카오 로그인 시작
	@RequestMapping(value ="kakaologin.do",produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public String kakaologin(@RequestParam("code") String code,Model model, HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("!!!!");
		
		//로그인 후  코드 get		
		System.out.println("code : "+code);
		request.getSession().getServletContext().setAttribute("code", code);
		System.out.println("application scope : "+request.getSession().getServletContext().getAttribute("code"));
		System.out.println("---------");
		
		//엑세스토큰
		JsonNode jsonToken = getAccessToken(code);
		request.getSession().getServletContext().setAttribute("access_token", jsonToken);
		System.out.println("access_token : " + jsonToken.get("access_token"));
		System.out.println("----------");
			
		
		//사용자정보 (사용자토큰)
		JsonNode userInfo = getKakaoUserInfo1(jsonToken.get("access_token"));
		System.out.println("사용자정보(카카오)"+userInfo);
        // Get id
       

 
        // 유저정보 카카오에서 가져오기 Get properties
		String id = userInfo.path("id").asText();
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
 
        //id도잇움
        String name = properties.path("nickname").asText();
        String email = kakao_account.path("email").asText();
        String age="";
        if(kakao_account.path("has_age_range").asText()=="false") {
        	age="";
        }else {
        	age=kakao_account.path("age_range").asText();
        	age=age.substring(0, 2);
        }
        String sex="";
        if(kakao_account.path("has_gender").asText()=="false") {
        	sex="";
        }else {
        	sex=kakao_account.path("gender").asText();
        }
        
  
        
        System.out.println("id : " + id);
        System.out.println("name : " + name);
        System.out.println("email : " + email);
        System.out.println("age : "+age);
        System.out.println("sex : "+sex);
        //끝
        
        //카카오로그인으로 처음 로그인시 추가정보 입력받기
        UserDto dto=userbiz.selectOne(id);
       
        if(dto==null) {
        	//추가입력폼으로가기
        	Map<String,String> map=new HashMap<String,String>();
        	map.put("userid", id);
        	map.put("username", name);
        	map.put("useremail", email);
        	map.put("userage", age);
        	map.put("usersex", sex);
        	
        	model.addAttribute("map",map);
        	List<CinemaDto> cinemaList=cinemabiz.selectAll();

    		model.addAttribute("cinemaList",cinemaList);
        	return "kakaoLoginForm";
        }else {
        	//세션에 넣어주기
        	if(dto.getUsergrade().equals("drop")) {
    			response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('탈퇴한 회원입니다.');</script>"); // history.go(-1);</script>
                out.flush();
                return "main";
        	}else {
        		session.setAttribute("dto", dto);
        		return "main";
        	}
        }
       
              
        
			
		
	}
	//카카오회원가입 처리
	@RequestMapping(value=" kakaoJoin.do", method=RequestMethod.POST)
	public String kakaoJoin(UserDto userdto,HttpSession session,HttpServletResponse response) throws IOException {
		
		userdto.setUserpw("kakao");
		int res=userbiz.insert(userdto);
		String id=userdto.getUserid();
		userdto=userbiz.selectOne(id);
		
		if(res>=0) {
			//성공
			session.setAttribute("dto",userdto);
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 성공하였습니다.');</script>"); // history.go(-1);</script>
            out.flush();
			return "main";
		}else {
			//실패
			return "main";
		}
		
	} 
	
	//access token변환
	public static JsonNode getAccessToken(String autorize_code){ 

	    final String RequestUrl = "https://kauth.kakao.com/oauth/token";
	   
	    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

	    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	    postParams.add(new BasicNameValuePair("client_id", "f4bfa5f6b9448b69cd517b0762b28f21"));    // REST API KEY
	    postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8787/controller/kakaologin.do"));    // 리다이렉트 URI
	    postParams.add(new BasicNameValuePair("code", autorize_code));    // 로그인 과정중 얻은 code 값

	    final HttpClient client = HttpClientBuilder.create().build();
	    final HttpPost post = new HttpPost(RequestUrl);
	    JsonNode returnNode = null;

	    try {
	      post.setEntity(new UrlEncodedFormEntity(postParams));
	      final HttpResponse response = client.execute(post);
	      final int responseCode = response.getStatusLine().getStatusCode();

	      System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	      System.out.println("Post parameters : " + postParams);
	      System.out.println("Response Code : " + responseCode);
	     

	      //JSON 형태 반환값 처리
	      ObjectMapper mapper = new ObjectMapper();
	      returnNode = mapper.readTree(response.getEntity().getContent());
	    } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	    } catch (ClientProtocolException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    } finally {
	        // clear resources
	    }

	    

	    return returnNode;

	}
	//카카오 로그아웃
	 public static JsonNode kakaoLogout(JsonNode accessToken) {
		 
	        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
	        

	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpPost post = new HttpPost(RequestUrl);
	 
	        // add header
	        post.addHeader("Authorization", "Bearer " + accessToken);
//	        post.addHeader("Authorization", "KakaoAK " + "8c89186a433ca2d33527288541e96fef");
	        JsonNode returnNode = null;
	 
	        try {
	            final HttpResponse response = client.execute(post);
	            final int responseCode = response.getStatusLine().getStatusCode();
	 
	            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	            System.out.println("Response Code : " + responseCode);
	 
	            // JSON 형태 반환값 처리
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            // clear resources
	        }
	 
	        return returnNode;
	    }

	 //카카오 로그인 ->사용자정보가져오기
	 public static JsonNode getKakaoUserInfo1(JsonNode accessToken) {
		 
	        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
	        
	        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		    postParams.add(new BasicNameValuePair("property_keys", "8c89186a433ca2d33527288541e96fef"));
	        
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpPost post = new HttpPost(RequestUrl);
	 
	        // add header
	        post.addHeader("Authorization", "Bearer " + accessToken);
//	        post.addHeader("Authorization", "KakaoAK " + "8c89186a433ca2d33527288541e96fef");
	        JsonNode returnNode = null;
	 
	        try {
	            final HttpResponse response = client.execute(post);
	            final int responseCode = response.getStatusLine().getStatusCode();
	 
	            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	            System.out.println("Response Code : " + responseCode);
	 
	            // JSON 형태 반환값 처리
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            // clear resources
	        }
	 
	        return returnNode;
	    }

	

}
