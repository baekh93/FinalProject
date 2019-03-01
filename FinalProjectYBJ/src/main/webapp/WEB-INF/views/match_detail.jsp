<%@page import="com.yaboja.dto.MatchingboardDto"%>
<%@page import="com.yaboja.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	UserDto userDto = null;
	if(session.getAttribute("dto") != null){
		userDto = (UserDto)session.getAttribute("dto");
	}
	MatchingboardDto matchingboardDto = (MatchingboardDto)request.getAttribute("matchingboarddto");
	MatchingboardDto mymatchingboardDto = (MatchingboardDto)request.getAttribute("mymatchingboarddto");
	
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- spring에서 date format을 설정하기위해 필요 -->
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

.font-test { font:bold 28pt 'HY나무M'; }

</style>
<script type="text/javascript">
	function matchingcheck(){
		//if coin>0
// 		var x =document.getElementById('mymatchingboard').value;
		
		if(confirm("매칭신청 하시겠습니까? . 상대방 수락시 1코인이 차감되며, 신청중에는 다른신청을 할 수 없습니다")){
			//매칭페이지로 ㄱㄱ
			var userseq = document.getElementById('userseq').value;
			var cinema = document.getElementById('cinema').innerHTML;
			var movietitle = document.getElementById('movietitle').innerHTML;
			location.href='matching_insert.do?userseq='+userseq+'&cinema='+cinema+'&movietitle='+movietitle;
			
		}else{
			alert('신청이 취소되었습니다.');
		}
		
		
		//coin=0
// 		alert('매칭에 필요한 코인이 부족합니다. 충전화면으로 이동합니다.' );
// 		location.href='mypage_coin.jsp'
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
	<input type="hidden" id="userseq" value="${ matchingboarddetail1.userseq}"/>
	<input type = "hidden" id ="mymatchingboard" value ="${mymatchingboarddto }"/>
	<div class ="container">
	<br><br>
	<h1 style="color:black; font-weight: bold;">작성자 프로필</h1>
	<div style="color:black; background-color:silver; padding:50px; margin:30px">
		
		<table border = "1" class= "table table-bordered" style="color:black; font-size: 1.2em;">
			<tr>
				<td rowspan ="4" width="150px;" height="170px;"> <img alt="${matchingboarddetail2.userprofile }" src="profile/${matchingboarddetail2.userprofile }" style="width: 150px; height: 170px;"></td>
			</tr>
			<tr align ="center" >
				<th width ="200px">이 름</th>
				<td width ="200px"><c:out value="${matchingboarddetail2.username }" /></td>
			</tr>
			<tr align ="center">
				<th>성 별</th>
				<td><c:out value="${matchingboarddetail2.usersex }" /></td>
			</tr>
			<tr align ="center">
				<th>연령대</th>
				<td><c:out value="${matchingboarddetail2.userage }" /></td>
			</tr>
		</table>	
	</div>
	<table border ="1" class= "table table-bordered" >
		<tr>
			<td bgcolor="skyblue">제목</td>
			<td><c:out value="${matchingboarddetail1.matchingboardtitle }" /></td>
			<td bgcolor="skyblue">등록일시</td>
			<td><fmt:formatDate pattern ="yyyy-MM-dd HH:mm:ss" value="${matchingboarddetail1.matchingboarddate }" /></td>
			
			
		</tr>
		<tr>
			<td bgcolor="skyblue">영화명</td>
			<td id="movietitle"><c:out value="${matchingboarddetail3.movietitle }" /></td>
			<td bgcolor="skyblue">영화관</td>
			<td id="cinema"><c:out value="${matchingboarddetail4.cinema }" /></td>
		</tr>
		<tr>
			<td bgcolor="skyblue">내용</td>
			<td colspan="3"><c:out value="${matchingboarddetail1.matchingboardcontent }" />
							<br>
<%

int boarduser = matchingboardDto.getUserseq();

	if(userDto != null){
		if(userDto.getUserseq() != boarduser){
							
%>									
							<div align ="right"><button onclick="matchingcheck()" class ="btn btn default">매칭신청하기</button></div>
<%
		}
	}
%>						
							</td>
							
		</tr>

	</table>	
		<div align ="center">
<%
	
	if(userDto != null){
		if(userDto.getUserseq() == boarduser || userDto.getUsergrade().equals("admin")){
%>		
		<button class ="btn btn default" onclick ="location.href='match_update.do?matchingboard=${matchingboarddetail1.matchingboard }'">수정</button><!-- 작성자만 -->
<%
		}
	}
%>		
		<button class ="btn btn default" onclick ="location.href='matchingboardlist.do'">목록</button></div>
	
		<br>
</div>
	

	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>
	

</body>

</html>
