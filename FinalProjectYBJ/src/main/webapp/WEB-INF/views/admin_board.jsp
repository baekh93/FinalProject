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

	<!-- adminsidebar -->
	<%@ include file="inc/adminSidebar.jsp"%>

	<!-- 마이페이지 부분 소스는 여기부터 작성!! -->
	<br>
	<br>
	<form action="reviewInsert.jsp">
		<div class="container">
			<h2>게시물관리</h2>
			<div class="form-group">
				<label for="boardSelect">게시판 종류</label> <select
					class="form-control form-control-lg" name="boardSelect">
					<option>게시판선택</option>
					<option value="영화게시판">영화게시판</option>
					<option value="매칭게시판">매칭게시판</option>
					<option value="후기게시판">후기게시판</option>
				</select>
			</div>
			<br>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호
						<th>제목
						<th>작성자
						<th>날짜
						<th>처리
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>${boardDto.board_seq }123</td>
						<td>${boardDto.board_title }123</td>
						<td>${userDto.user_name }123</td>
						<td>${boardDto.board_regdate }123</td>
						<td><button class="btn btn-default" onclick="#">삭제</button></td>
					</tr>
					<tr>
						<td>${boardDto.board_seq }123</td>
						<td>${boardDto.board_title }123</td>
						<td>${userDto.user_name }123</td>
						<td>${boardDto.board_regdate }123</td>
						<td><button class="btn btn-default" onclick="#">삭제</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>




	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>
