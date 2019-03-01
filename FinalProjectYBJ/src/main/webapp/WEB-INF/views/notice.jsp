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


	<br />
	<br />
	<br />
	<br />
	<div style="font-size: 40px; margin-left: 200px;">알림</div>
	<hr />
	
	<div class="container">
		<h2>매칭 알림</h2>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th><i class="glyphicon glyphicon-bell" style="float: left;"></i> notice</th>
					<th>date</th>
					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> ~ 님과의 채팅방이 생성되었습니다. </td>
					<td>2019/1/10</td>
					
				</tr>
				<tr>
					<td> ~ 님과의 매칭 신청이 거절당했습니다.</td>
					<td>2019/1/9</td>
				</tr>
				<tr>
					<td> ~ 님과의 매칭 신청이 거절당했습니다. </td>
					<td>2019/1/7</td>
				</tr>
			</tbody>
		</table>
	</div>
	<hr />
	<div class="container">
		<h2>채팅방 알림</h2>
		<p>매칭된 상태일 경우 이렇게 뜨고 매칭안된상태일 경우 "현재 매칭된 채팅이 없습니다." 출력</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th></th>
					<th>~ 님께 새로운 메시지가 왔습니다.</th>
					<th>채팅방</th>					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><i class="glyphicon glyphicon-comment" style="float: left;"></i></td>
					<td>빨리 당신과 영화를 보고싶어요 ~~~~</td>
					
					<td><button class="btn btn-default">입장하기</button></td>
					
				</tr>
				
				
			</tbody>
		</table>
	</div>
	



	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>
