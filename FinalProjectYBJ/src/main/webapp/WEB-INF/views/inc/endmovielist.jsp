<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Hover Effect Style</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/movielist.css" rel="stylesheet">
</head>
<body>

	<br>
	<br>
	<!------------------ Hover Effect Style : Demo - 15 --------------->
	<div class="container mt-40">

		<br>
		<hr>
		<div class="row mt-30">

			<!--  -->
			<!-- style="width:30px;height:50px;" -->
			<c:choose>
				<c:when test="${empty list }">
					<h3>**영화 정보가 없습니다.**</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" items="${list }">

						<div class="col-md-3 col-sm-6"
							style="margin-bottom: 10px; width: 200px; height: 400px;">

							<div class="box15">
								<img src="${i.imgurl }" alt="">
								<div class="box-content">
									<h3 class="title">평점 : ${i.rating }</h3>
									<ul class="icon">
										<li><a href="#"><i class="fa fa-search"></i></a></li>

									</ul>
								</div>
							</div>
							<!-- href="https://movie.naver.com/movie/bi/mi/reserve.nhn?code=167651" -->
							<center>
								<div>
									<a href="movieInfo.do?movieSeq=${i.movieseq }"><span
										style="font-size: 15px;">${i.movietitle }</span></a>
								</div>
							</center>
							
						</div>

					</c:forEach>


				</c:otherwise>
			</c:choose>
			<!--  -->









		</div>
	</div>

	<div align="center">
		
			<c:if test="${pageMaker.prev}">
				<a href="endMovie.do?page=${pageMaker.startPage - 1}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<a href="endMovie.do?page=${idx}">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="endMovie.do?page=${pageMaker.endPage + 1}">다음</a>
			</c:if>
		
	</div>

	<!------------------ Hover Effect Style : Demo - 15 --------------->

	<br>
	<br>


	<!--         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<!--         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
</body>
</html>