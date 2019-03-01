<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>

<body>

	<!-- Navigation -->
	<%@ include file="inc/topbar.jsp"%>

	<!-- Menu Bar -->
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


	<!--adminsidebar -->
	<%@ include file="inc/adminSidebar.jsp"%>
	<!-- 내부jsp -->
	<br>
	<div class="container">
		<h2>회원관리</h2>
		<form action="#">
			<div align="right">
				<input type="text" class="control">
				<input type="submit"value="검색" class="btn btn-default"></input> 
			</div>
			<br>
			<table border="1" class="table" style="text-align: center;">
				<thead align="center">
					<tr>
						<th>ID
						<th>NAME
						<th style="width: 100px;">GENDER
						<th style="width: 100px;">AGE
						<th>ADDRESS
						<th>E-MAIL
						<th style="width: 100px;">탈퇴
						<th style="width: 100px;">관리자 권한
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty userList }">
							<tr>
								<td colspan="8">사용자가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" items="${userList }">
								<c:if test="${i.usergrade eq 'user' }">
								<tr>
									<td>${i.userid }</td>
									<td>${i.username }</td>
									<td>${i.usersex }</td>
									<td>${i.userage }대</td>
									<td>${i.useraddress }</td>
									<td>${i.useremail }</td>
									<td>
										<input type="button" class="btn btn-default"  onclick="location.href='dropUser.do?userseq=${i.userseq}'" value="탈퇴"></input>
									</td>
									<td>
										<button type="button" class="btn btn-default" onclick="location.href='advanceUser.do?userseq=${i.userseq }'">전환</button>
									</td>

								</tr>
								</c:if>
							</c:forEach>
							<c:forEach var="i" items="${userList }">
								<c:if test="${i.usergrade eq 'drop' }">
								<tr>
									<td>${i.userid }</td>
									<td>${i.username }</td>
									<td>${i.usersex }</td>
									<td>${i.userage }대</td>
									<td>${i.useraddress }</td>
									<td>${i.useremail }</td>									
									<td style="color : red;">탈퇴한 회원</td>
									<td style="color : red;">탈퇴한 회원</td>									


								</tr>
								</c:if>
							</c:forEach>
						</c:otherwise>	
					</c:choose>

				</tbody>
			</table>
		</form>
	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>
