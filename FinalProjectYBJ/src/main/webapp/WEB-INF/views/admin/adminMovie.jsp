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

<script type="text/javascript">

function loadMovie(){
	
$.ajax({
		
		url: "loadMovie.do",
		cache: false,
		success: function(text){
			
			 var ajaxName = decodeURIComponent(text);
			 alert(ajaxName);
			 window.location.reload();
			
			
		},
		error:function(){
			document.getElementById("ok").innerHTML="ajax 통신 실패";
		}
    });
	
}

String.prototype.trim = function () { //trim
	
    return this.replace(/^\s+|\s+$/g, "");

}

</script>

</head>

<body>

	<!-- Navigation -->
	<%@ include file="../inc/topbar.jsp"%>

	<!-- Menu Bar -->
	<c:choose>
		<c:when test="${dto.usergrade eq 'admin'}">
			<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
				<!-- 메뉴바 -->
				<a href="movieBoard.do"><strong>Movie Board</strong></a> <a
					href="matchingboardlist.do"><strong>Matching Board</strong></a> <a
					href="reviewBoard.do"><strong>Review Board</strong></a> <a
					href="qnaboard.do"><strong>Q&A Board</strong></a> <a
					href="adminPreferences.do"><strong>preferences</strong></a>
				<div class="nav-underline"></div>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
				<!-- 메뉴바 -->
				<a href="movieBoard.do"><strong>Movie Board</strong></a> <a
					href="matchingboardlist.do"><strong>Matching Board</strong></a> <a
					href="reviewboard.do"><strong>Review Board</strong></a> <a
					href="qnaboard.do"><strong>Q&A Board</strong></a> <a
					href="mypage.do"><strong>My Page</strong></a>
				<div class="nav-underline"></div>
			</nav>
		</c:otherwise>
	</c:choose>


	<!--adminsidebar -->
	<%@ include file="../inc/adminSidebar.jsp"%>
	<!-- 내부jsp -->
	<br>
	<div class="container">
		<h1>영화 관리</h1>

		<div align="center">
			<center>
				<input type="button" value="수동으로 네이버영화에서 상영작 크롤링/종영작 업데이트" onClick="loadMovie();" />
				<p> 현재 크롤링 스케줄러 1분마다 실행 중 입니다. </p>
				<p id="ok"></p>
			</center>
		</div>
		<h3>상영작</h3>
		<p>${presentMovieSize }개상영중</p>
		<table border="1" class="table" style="text-align: center;">
			<thead align="center">
				<tr>
					<th style="width: 100px;">영화 번호
					<th style="width: 200px;">제목
					<th>장르
					<th>감독
					<th>평점
					<th style="width: 100px;">개봉 날짜
					<th style="width: 100px;">상영시간
					<th>배우
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty presentMovieList }">
						<tr>
							<td colspan="8">상영작이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" items="${presentMovieList }">

							<tr>
								<td>${i.movieseq }</td>
								<td>${i.movietitle }</td>
								<td>${i.genre }</td>
								<td>${i.director }대</td>
								<td>${i.rating }</td>
								<td>${i.pupdate }</td>
								<td>${i.time }</td>
								<td>${i.actor }</td>


							</tr>

						</c:forEach>

					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
		<h3>종영작</h3>
		<p>${endMovieSize }개</p>
		<table border="1" class="table" style="text-align: center;">
			<thead align="center">
				<tr>
					<th style="width: 100px;">영화 번호 <th style="width: 200px;">제목
						
					<th>장르
						
					<th>감독
						
					<th>평점
						
					<th style="width: 100px;">개봉 날짜
						
					<th style="width: 100px;">상영시간
						
					<th>배우
					
				</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty endMovieList }">
							<tr>
								<td colspan="8">종영작이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" items="${endMovieList }">
								
								<tr>
									<td>${i.movieseq }</td>
									<td>${i.movietitle }</td>
									<td>${i.genre }</td>
									<td>${i.director }대</td>
									<td>${i.rating }</td>
									<td>${i.pupdate }</td>
									<td>${i.time }</td>
									<td>${i.actor }</td>
									

								</tr>
								
							</c:forEach>
							
						</c:otherwise>	
					</c:choose>

				</tbody>
			</table>
		
	
<!-- Footer --> <%@ include
							file="../inc/footer.jsp"%>




					</body>

</html>
