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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<!-- 별로 표시하기 -->
<script>
	window.onload = function() {

		var innerHtml = "";
		var x = $
		{
			dto.rating
		}
		;
		x = x / 2;

		for (var i = 0; i < 5; i++) {

			if (i < x - 1) {

				innerHtml += "<i class='glyphicon glyphicon-star'></i>";

			} else {

				innerHtml += "<i class='glyphicon glyphicon-star-empty'></i>";

			}

		}

		$('#myspan').html(innerHtml);
	}
</script>

<!-- 별로 표시하기 끝-->

<style>
.actorimage li {
	display: inline-block;
	width: 160px;
	height: 220px;
}

.actorimage li dl {
	width: 160px;
	height: 60px;
}

.actorimage li .tx_people {
	width: 160px;
	height: 20px;
}

.actorimage li img {
	width: 160px;
	height: 200px;
}

.actorimage li .staff_dir {
	height: 40px;
	margin-bottom: 60px;
}
</style>




</head>

<body>


	<!-- Navigation -->
	<%@ include file="../inc/topbar.jsp"%>


	<!-- Menu Bar -->


	<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
		<!-- 메뉴바 -->
		<a href="movieBoard.do"><strong>Movie Board</strong></a> <a
			href="matchingboardlist.do"><strong>Matching Board</strong></a> <a
			href="reviewboard.do"><strong>Review Board</strong></a> <a
			href="qnaboard.do"><strong>Q&A Board</strong></a> <a href="mypage.do"><strong>My
				Page</strong></a>
		<div class="nav-underline"></div>
	</nav>


	<!-- mypagesidebar -->
	<%@ include file="../inc/moviesidebar2.jsp"%>

	<!-- 마이페이지 부분 소스는 여기부터 작성!! -->
	</br>
	</br>
	<div class="container">

		<h1>${moviedto.movietitle }</h1>



		</br>

		<div align="left">
			<table border="1" class="table table-hover" style="font-size: 30px;">
				<tr>
					<td rowspan="5" style="width: 168px;"><img
						src="${moviedto.imgurl }" width="300" height="450"></td>
					<td>장르 : ${moviedto.genre } | 평점 : ${moviedto.rating } <span
						id="myspan"></span></td>
				</tr>

				<tr>
					<td>상영시간 : ${moviedto.time } | ${moviedto.pupdate } 개봉</td>
				</tr>

				<tr>
					<td>감독 : ${moviedto.director}</td>
				</tr>
				<tr>
					<td>출연 : ${moviedto.actor}</td>
				</tr>

			</table>

		</div>
		${content }

		<div align="right">
			<button class="btn btn default"
				onclick="location.href='movie_matching.do?movieseq=${moviedto.movieseq }'">매칭하러가기</button>
		</div>


		</br> </br>

		</div>

		<!--  댓글  -->
		<div class="container">
			<h1>
				<label for="moviecomentcontent">comment</label>
			</h1>


			<c:choose>
				<c:when test="${dto eq null}">
					<hr style="border-bottom:2px solid darkgray; margin-bottom: 5px;">
				</c:when>
				<c:otherwise>

					<form name="commentInsertForm">
						<div class="input-group">
							<input type="hidden" name="movieseq" value="${moviedto.movieseq}" />
							<input type="text" class="form-control" id="moviecomentcontent"
								name="moviecomentcontent" placeholder="내용을 입력하세요."> <span
								class="input-group-btn">
								<button class="btn btn-danger" type="button"
									name="commentInsertBtn">등록</button>
							</span>
						</div>
					</form>

				</c:otherwise>
			</c:choose>


		</div>
		<br />

		<div class="container">
			<div class="commentList"></div>
		</div>

		<%@ include file="movie_comment.jsp"%>



	

	<!-- Footer -->
	<%@ include file="../inc/footer.jsp"%>



</body>

</html>
