<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<%
		System.out.println("결제내역");
	%>

	<!-- Navigation -->
	<%@ include file="inc/topbar.jsp"%>


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

	<!-- mypagesidebar -->
	<%@ include file="inc/mypagesidebar.jsp"%>

	<!-- 마이페이지 부분 소스는 여기부터 작성!! -->
	<br>
	<br>
	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<div class="form">
				<div class="container container-fluid"></div>
				<div class="container container-fluid">
					<h2>결제내역</h2>
					<div class="jumbotron jumbotron-fluid">

						<table>
							<tr>
								<th>ID ${user_name }</th>
							</tr>
							<tr>
								<th>COIN ${coin } (매칭 당 1코인이 차감됩니다.)</th>
							</tr>
						</table>
						<hr class="my-1">
						<div class="layout-container">
							<div id="main">
								<!-- sidebar를 include해준다. -->
								<div class="form">
									<div class="container container-fluid"></div>
									<div class="container container-fluid">
										<div class="jumbotron jumbotron-fluid">
											<table border="1" class="table table-hover"
												style="background: white;">
												<thead align="center">
													<tr>

														<th>유저이름</th>
														<th>충전날짜</th>
														<th>금액</th>
														<th>결제내역</th>
													</tr>
												</thead>

												<tbody>
													<c:choose>
														<c:when test="${empty coinlist }">
															<tr>
																<td colspan="4" align="center">===== 충전내역이 없습니다.
																	=====</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${coinlist }" var="dto">
																<tr>

																	<td>${user_name }</td>
																	<td><fmt:formatDate value="${dto.coindate }"
																			pattern="yy.MM.dd E요일 HH:mm" /></td>
																	<c:choose>
																		<c:when test="${dto.coinlog == 500}">

																			<td>-${dto.coinlog }</td>

																		</c:when>
																		<c:otherwise>
																			<td>+${dto.coinlog }</td>
																		</c:otherwise>
																	</c:choose>
																	<td>${dto.coinstate }</td>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>
