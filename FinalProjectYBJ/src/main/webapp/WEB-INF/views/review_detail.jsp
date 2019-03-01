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

	<!-- 영화매칭, 마이페이지말고는 여기부터 소스 넣으면 돼!!! -->
	<div class="container">
		<h2>후기게시판(상세)</h2>
		<div>조회수 [ ${reviewboarddto.reviewboardview } ]</div>
		<!-- 히든으로 reviewboardseq받기 -->
		<form action="review_updateform.do" method="post">
			<input type="hidden" name="userseq" value="${dto.userseq }"/>
         <table style="width: 1140px;">
	         <tr>
	            <td><input type="hidden" name="reviewboardseq" value="${reviewboarddto.reviewboardseq }"></td>
	         <tr>
	         <tr>
	         	<td rowspan="5" width="200px;" align="center">
	         	<img alt="후기영화사진" src="${movieDto.imgurl }"  width="200" height="250"></td>
	         </tr>
     		<tr>
     		<td rowspan="4"width="50px;">
     		</tr>
            <tr>
    	        <td><label>영화제목</label><input name="movietitle" class="form-control" value="${movieDto.movietitle }" readonly="readonly">
            </tr>
            <tr>
               <td><label>작성자</label><input type="text" value="${userdto.username }" readonly="readonly"class="form-control">
            </tr>
            <tr>
               <td><label>제목</label><input type="text" name="reviewboardtitle"value="${reviewboarddto.reviewboardtitle }" readonly="readonly"class="form-control">
            </tr>
            <tr>
               <td colspan="3"><label>내용</label> 
            </tr>
            <tr>
               <td colspan="3"><div class="form-control" style="overflow-y : scroll; width: 100%; height: 500px;">${reviewboarddto.reviewboardcontent }</div></td>
            </tr>
         </table>
         <c:choose>
            <c:when test="${dto.userseq eq reviewboarddto.userseq or dto.usergrade eq 'admin'}">
            <input type="button" class="btn btn-danger pull-right" value="삭제" onclick="location.href='reviewDelete.do?reviewboardseq=${reviewboarddto.reviewboardseq }'">
            <input type="submit" class="btn btn-default pull-right" value="수정">
            </c:when>
         </c:choose>
         	<input type="button" class="btn btn-default pull-left" value="뒤로가기" onclick="location.href='reviewboard.do'">
		</form>
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
				<input type="hidden" name="reviewboardseq"
					value="${reviewboarddto.reviewboardseq}" /> <input type="text"
					class="form-control" id="reviewboardcomentcontent"
					name="reviewboardcomentcontent" placeholder="내용을 입력하세요."> <span
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

	<%@ include file="review_comment.jsp"%>

	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>