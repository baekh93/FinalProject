<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	</br>
	</br>
	<div class="container">
		<div>
			<h1>마이페이지_매칭관리</h1>
		</div>
		</br> </br>
		<div>신청온 매칭</div>
		<div>
			<h3>-----------------------------------------------2019-01-11----------------------------------------------------------</h3>
		</div>
		</br>
		<table border="1" class="table table-hover">
			<tr>
				<td style="width: 88px;" rowspan="2">사진</td>
				<td>사용자명</td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="수락" onclick="" class="btn btn-default"></td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="거절" onclick="" class="btn btn-default"></td>
			</tr>
			<tr>
				<td>게시글 명</td>
			</tr>
		</table>
		</br>


		<table border="1" class="table table-hover">
			<tr>
				<td style="width: 88px;" rowspan="2">사진</td>
				<td>사용자명</td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="수락" onclick="" class="btn btn-default"></td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="거절" onclick="" class="btn btn-default"></td>
			</tr>
			<tr>
				<td>게시글 명</td>
			</tr>
		</table>
		</br>
		<table border="1" class="table table-hover">
			<tr>
				<td style="width: 88px;" rowspan="2">사진</td>
				<td>사용자명</td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="수락" onclick="" class="btn btn-default"></td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="거절" onclick="" class="btn btn-default"></td>
			</tr>
			<tr>
				<td>게시글 명</td>
			</tr>
		</table>
		<div>
			<h3>-----------------------------------------------2019-01-10----------------------------------------------------------</h3>
		</div>
		</br>
		<table border="1" class="table table-hover">
			<tr>
				<td style="width: 88px;" rowspan="2">사진</td>
				<td>사용자명</td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="수락" onclick="" class="btn btn-default"></td>
				<td rowspan="2" style="width: 98px;" align="center"><input
					type="button" value="거절" onclick="" class="btn btn-default"></td>
			</tr>
			<tr>
				<td>게시글 명</td>
			</tr>
		</table>

		<div align="center">< 1 2 3 4 5 6 7 8 9 10 ></div>
	</div>




	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>
