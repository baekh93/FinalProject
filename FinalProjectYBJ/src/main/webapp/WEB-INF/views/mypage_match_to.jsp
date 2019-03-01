<%@page import="com.yaboja.dto.MatchingboardDto"%>
<%@page import="com.yaboja.dto.UserDto"%>
<%@page import="com.yaboja.dto.MatchingDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MatchingDto> matchingList = (List)request.getAttribute("matchingList");
	List<UserDto> userList = (List)request.getAttribute("userList");
	MatchingboardDto boarddto =  (MatchingboardDto)request.getAttribute("boarddto");
			
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

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/clean-blog.min.css" rel="stylesheet">

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

<script type="text/javascript">

function deletecheck() {
	if(confirm("신청한 매칭을 삭제하시겠습니까?")){
		var matchingseq = document.getElementById('matchingseq').value;
		location.href='matchingdelete.do?matchingseq='+matchingseq;

		alert('삭제되었습니다');
		
	}else{
		alert('잘해보세요');
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

	<!-- mypagesidebar -->
	<%@ include file="inc/mypagesidebar.jsp"%>

	<!-- 마이페이지 부분 소스는 여기부터 작성!! -->
	<br/>
	<br/>
	<input type="hidden" id="matchingseq" value="${ matchingdto.matchingseq}"/>
	<div class="container">
		<div>
			<h1>마이페이지_매칭관리</h1>
		</div>
		<br/> <br/>
		<div>
			<h3>신청한 매칭</h3>
		</div>
		<br/>
		<div class="jumbotron jumbotron-fluid">
		<c:choose>
			<c:when test="${empty matchingdto }">
			<h4 style="color:blue;">신청한 매칭이 없습니다. </h4>
			</c:when>
			<c:otherwise>
		
		<br/>
		<table border="1" class="table table-hover">
			<tr>
				<td style="width: 88px;" rowspan="2"><img alt="${writerUser.userprofile }" src="profile/${writerUser.userprofile }" style="width: 88px;height: 88px;"></td>
				<td><c:out value="${writerUser.username }" /></td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="취소" onclick="deletecheck()" class="btn btn-default"></td>
			</tr>
			<tr>
				<td><c:out value="${matchingboarddto.matchingboardtitle }" /></td>
			</tr>
		</table>
			</c:otherwise>
		</c:choose>
		</div>
		
		<br/>

		<div>
			<h3>신청받은 매칭</h3>
		</div>
		</br>
		<div class="jumbotron jumbotron-fluid">
<%
		if(matchingList.size() == 0){
%>			

		<h4 style="color:blue;">신청 받은 매칭이 없습니다.</h4>

<%		
		}else{
			for(int i = 0 ; i < matchingList.size() ; i++){
%>	
				<table border="1" class="table table-hover">
					<tr>
						<td style="width: 88px;" rowspan="2"><img alt="<%= userList.get(i).getUserprofile()%>" src="profile/<%= userList.get(i).getUserprofile()%>" style="width: 88px;height: 88px;"></td>
						<td style="font-weight: bold;">신청자</td>
						<td><%= userList.get(i).getUsername()%></td>
						<td style="font-weight: bold;">성별</td>
						<td><%= userList.get(i).getUsersex()%></td>
						<td style="font-weight: bold;">나이</td>
						<td><%= userList.get(i).getUserage()%></td>
						<td rowspan="2" style="width: 98px;" align="center"><input
							type="button" value="수락" onclick="location.href='acceptance.do?matchingapplicant=<%= userList.get(i).getUserseq()%>'" class="btn btn-default"></td>
						<td rowspan="2" style="width: 98px;" align="center"><input
							type="button" value="거절" onclick="location.href='rejectionOne.do?matchingapplicant=<%= userList.get(i).getUserseq()%>'" class="btn btn-default"></td>
					</tr>
					<tr>
						<td colspan ="6"><%= boarddto.getMatchingboardtitle()%></td>
					</tr>
			</table>
<%				
			}
		}
%>
		</div>
		<br/>
	
		
		<br/>

	</div>




	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>
