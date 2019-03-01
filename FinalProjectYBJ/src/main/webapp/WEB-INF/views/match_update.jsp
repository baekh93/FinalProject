<%@page import="java.util.List"%>
<%@page import="com.yaboja.dto.MovieDto"%>
<%@page import="com.yaboja.dto.CinemaDto"%>
<%@page import="com.yaboja.dto.UserDto"%>
<%@page import="com.yaboja.dto.MatchingboardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	MatchingboardDto matchingboarddto = (MatchingboardDto)request.getAttribute("matchingboarddto");
	UserDto userdto = (UserDto)request.getAttribute("userdto");
	CinemaDto cinemadto = (CinemaDto)request.getAttribute("cinemadto");
	MovieDto moviedto = (MovieDto)request.getAttribute("moviedto");
	List<CinemaDto> cinemaList = (List)request.getAttribute("cinemaList");
	List<MovieDto> movieList = (List)request.getAttribute("movieList");
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>야보자</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- <!-- Theme CSS --> -->
<!-- <link href="css/clean-blog.min.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>



<!-- Menu Bar -->
<link href="css/menubar.css" rel="stylesheet">
<!-- Content -->
<link href="css/index_content.css" rel="stylesheet">
<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>
	
<style type="text/css">

body { font-family:'HY나무M'; }

.font-test { font:bold 24pt 'HY나무M'; }

</style>

<script type="text/javascript">
function inputConfirm(){
	var x = document.getElementsByName("title")[0].value;
// 	alert(x);
	if(x=="" || x==" "){
		alert('제목을 입력해주세요');
	}
	//내용, 영화명, 영화관 유효성검사 (else if로 추가)
	else{
		//모든사항 누락 없을 시에
		document.forms['myForm'].submit();
	}
}
</script>	

</head>

<body>


	<!-- Navigation -->
	<%@ include file="inc/topbar.jsp"%>


	<c:choose>
		<c:when test="${dto.usergrade eq 'admin'}">
			<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
			<!-- 메뉴바 -->
			<a href="movieBoard.do"><strong>Movie Board</strong></a> 
			<a href="matchingboardlist.do"><strong>Matching Board</strong></a> 
			<a href="reviewBoard.do"><strong>Review Board</strong></a> 
			<a href="qnaboard.do"><strong>Q&A Board</strong></a> 
			<a href="adminPreferences.do"><strong>preferences</strong></a>
			<div class="nav-underline"></div>
			</nav>		
		</c:when>
		<c:otherwise>
			<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
			<!-- 메뉴바 -->
			<a href="movieBoard.do"><strong>Movie Board</strong></a> 
			<a href="matchingboardlist.do"><strong>Matching Board</strong></a> 
			<a href="reviewboard.do"><strong>Review Board</strong></a> 
			<a href="qnaboard.do"><strong>Q&A Board</strong></a> 
			<a href="mypage.do"><strong>My Page</strong></a>
			<div class="nav-underline"></div>
			</nav>		
		</c:otherwise>
	</c:choose>
	
	<!-- moviesidebar -->
	<%@ include file="inc/moviesidebar.jsp"%>
	
	<!-- 영화매칭관련 페이지들 소스는 여기부터 작성!! -->
	
	<br>
	<br>
	<div class = "container" >
	<h1 style="color:black; font-weight: bold;">매칭글 수정하기</h1>
	<br>
	<form id="" method ="post" action ="matchingboard_update.do" name ="myForm">
	<input type="hidden" name="matchingboard" value="<%= matchingboarddto.getMatchingboard()%>"/>
	<table border ="1" class= "table table-bordered">
		<tr align ="center">
			<th width ="70px">이름</th>
			<td width ="120px"><%=userdto.getUsername() %></td>
			<td rowspan ="2" width="120px"><div style="width=150px; height=200px;">사진</div></td>
			<td width ="100px">
			<label for= "theater" style="float:left">영화관 선택</label>
			</td>
			<th width ="100px">게시날짜</th>
		</tr>
		<tr align ="center">
			<th>연령대</th>
			<td><%=userdto.getUserage() %></td>
			<td>
				<select id = "theater" name ="cinema" size='1'>
					<option value="서울">--- 서울 ---</option>
<%
				for(int i = 0 ; i < cinemaList.size() ; i++){
%>
					<option value="<%= cinemaList.get(i).getCinema()%>" <%= cinemaList.get(i).getCinemaseq()==matchingboarddto.getCinemaseq()?"selected":""%>><%= cinemaList.get(i).getCinema()%></option>
<%
				}
%>
				</select>
			</td>
			<td><%= (matchingboarddto.getMatchingboarddate().getYear()+1900)+"-"+((String.valueOf((matchingboarddto.getMatchingboarddate().getMonth()+1)).length())<=1?("0"+(matchingboarddto.getMatchingboarddate().getMonth()+1)):(matchingboarddto.getMatchingboarddate().getMonth()+1)+"")+"-"+matchingboarddto.getMatchingboarddate().getDate()%></td>
			
		
		</tr>
		<tr align ="center">
			<th>제목</th>
			<td colspan = "2"><input name="title" type="text" class="form-control" value="<%= matchingboarddto.getMatchingboardtitle()%>" name="title" maxlength="50"></td>
			<td>
				<label for= "moviename" style="float:left">영화선택</label>
				
			</td>
			<td>
				<select id = "moviename" name ="moviename" size='1'>
<%
				for(int i = 0 ; i < movieList.size() ; i++){
%>
					<option value="<%= movieList.get(i).getMovietitle()%>" <%= movieList.get(i).getMovieseq()==matchingboarddto.getMovieseq()?"selected":""%>><%= movieList.get(i).getMovietitle()%></option>
<%
				}
%>
				</select>
			</td>
		</tr>
		<tr align ="center">
			<td colspan = "5" style="color:navy; font-weight: bold; font-size: 1.5em;">★ 어디서든 외롭지않게 야! 보자 ★</td>
			
		</tr>
		<tr align ="center">
			<td colspan = "5">
				<textarea rows="8" cols="90" style="resize: none;" name="matchingboardcontent"><%= matchingboarddto.getMatchingboardcontent()%></textarea>
			</td>
			
		</tr>
		<tr align = "right">
			
			<td colspan = "5">
				<input type ="button" value ="취소" class="btn btn default" onclick = "location.href='match_list.jsp'"/>
				<input type ="button" value ="글 수정" class="btn btn default" onclick = "inputConfirm()"/>
			</td>
			
		</tr>
	</table>
	
	
	</form>
</div>
	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>

	

</body>

</html>
