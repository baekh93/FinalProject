<%@page import="com.yaboja.dto.MovieDto"%>
<%@page import="com.yaboja.dto.UserDto"%>
<%@page import="com.yaboja.dto.ReviewboardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<ReviewboardDto> boardlist = (List)request.getAttribute("boardlist");
UserDto userDto = (UserDto)session.getAttribute("dto");
List<MovieDto> movielist = (List)request.getAttribute("movielist");
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	function userDelete() {
		alert("탈퇴하시겠습니까?");
		
		
		document.location.href = "userDelete.do";
		
	}
</script>
</head>
<script type="text/javascript">
function matchingboardDelete() {
	if(confirm("매칭글을 삭제해도 차감된 코인은 환불되지 않습니다. 정말 삭제하시겠습니까??")){
		//매칭페이지로 ㄱㄱ
		var userseq = document.getElementById('userseq').value;
		var seq = document.getElementById('matchingboardseq').value;
		location.href='matchboarddelete.do?matchingboard='+seq;		
		}else{
			alert('취소되었습니다.')
		};
}

</script>
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
					<h2>내 정보</h2>
					<div class="jumbotron jumbotron-fluid">
						<form action="mypage_updateform.do" method="post">
							<input type="hidden" name="userseq" value="${dto.userseq }" />
							<table>
								<tr>
								<td rowspan="11" width="150px;" height="170px;" align="center">
									<label>PROFILE</label>
									<img alt="${dto.userprofile }" src="profile/${dto.userprofile }" style="width: 150px;height: 170px;">
								</td>
								</tr>
								<tr align="center">
									<td rowspan="10" width="100px"></td>
								</tr>
								<tr>
									<th><label>ID</label>
									<td><input readonly="readonly" name="userid"
										value="${dto.userid }" class="form-control"></td>
								</tr>
								<tr>
									<th><label>NAME</label>
									<td><input readonly="readonly" name="username"
										value="${dto.username }" class="form-control"></td>
								</tr>
								<tr>
									<th><label>EMAIL</label>
									<td><input readonly="readonly" name="useremail"
										value="${dto.useremail }" class="form-control"></td>
								</tr>
								<tr>
									<th><label>SEX</label>
									<td><input readonly="readonly" name="usersex"
										value="${dto.usersex }" class="form-control"></td>
								</tr>
								<tr>
									<th><label>AGE</label>
									<td><input readonly="readonly" name="userage"
										value="${dto.userage }" class="form-control"></td>
								</tr>
								<tr>
									<th><label>ADDRESS</label>
									<td><input readonly="readonly" name="useraddress"
										value="${dto.useraddress }" class="form-control"></td>
								</tr>
								<tr>
									<th><label>CINEMA1</label>
									<td><input readonly="readonly" name="usercinema1"
										value="${cinemadto1.cinema }" class="form-control"></td>
								</tr>
								<tr>
									<th><label>CINEMA2</label></th>
									<td><input readonly="readonly" name="usercinema2"
										value="${cinemadto2.cinema}" class="form-control"></td>
								</tr>
								<tr>
									<th><label>CINEMA3</label>
									<td><input readonly="readonly" name="usercinema3"
										value="${cinemadto3.cinema }" class="form-control"></td>
								</tr>
							</table>
							<input type="button" class="btn btn-danger pull-right" value="탈퇴"
								onclick="userDelete()"> <input type="submit"
								class="btn btn-default pull-right" value="내 정보 수정">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<hr class="my-4">
   	<input type="hidden" id="matchingboardseq" value="${matchingboarddto.matchingboard }"/>
   <div class="layout-container">
      <div id="main">
         <div class="form">
            <div class="container container-fluid">
               <h2>작성한 매칭</h2>
            </div>
            <div class="container container-fluid">
               <div class="jumbotron jumbotron-fluid">
               <table border="1" class="table table-hover" style="background: white;">
         <thead align="center">
            <tr align="center">
				<td width="80px">작성자</td>
				<td width="250px">제 목</td>
				<td width="60px">성 별</td>
				<td width="60px">연 령</td>
				<td width="150px">영화관</td>
				<td width="200px">영 화</td>
				<td width="120px">날 짜</td>
				
			</tr>
         </thead>
         
         
            <c:choose>
				<c:when test="${empty matchingboarddto }">
				 <tr>
				 	<td colspan ="7">
					<h3>----등록된 매칭글이 없습니다----</h3>
					</td>
				</tr>
				</c:when>
				<c:otherwise>
					

						<tr align="center">
							<td><c:out value="${dto.username }" /></td>
							<td><a href="matchingboardselectone.do?matchingboard=${matchingboarddto.matchingboard }"><c:out
										value="${matchingboarddto.matchingboardtitle }" /></a></td>
							<td><c:out value="${dto.usersex }" /></td>
							<td><c:out value="${dto.userage }" /></td>
							<td><c:out value="${cinemadto.cinema }" /></td>
							<td><c:out value="${moviedto.movietitle }" /></td>
							<td><fmt:formatDate pattern ="yyyy-MM-dd HH:mm" value="${matchingboarddto.matchingboarddate }" /></td>
							
					
						</tr>
					

				</c:otherwise>
			</c:choose>
       
      </table>
		<c:if test="${matchingboarddto.matchingboard!=null }">
     	 <div align ="center">
				<input type="button" class="btn btn-danger pull-right" value="삭제" onclick="location.href='matchboarddelete.do?matchingboard=${matchingboarddto.matchingboard }'">
		</div>		
		</c:if>
		
		<c:if test="${matchingboarddto.matchingboard==null }">
     	 <div align ="center">
				<input type="button" class="btn btn-danger pull-right" value="매칭게시판으로 가기" onclick="location.href='matchingboardlist.do'"/>
		</div>		
		</c:if>
   
   
               </div>
            </div>
         </div>
      </div>
   </div>
   
	<hr class="my-4">
	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<div class="form">
				<div class="container container-fluid">
					<h2>내 게시글</h2>
				</div>
				<div class="container container-fluid">
					<div class="jumbotron jumbotron-fluid">
						<table class="table table-hover">
							<thead align="center">
								<tr>
									<th>글번호
									<th>제목
									<th>작성자
									<th>날짜
									<th>조회수
								</tr>
							</thead>
<%
				if(boardlist.size() == 0){
%>
							<tr>
								<td colspan="5" align="center">----작성된 글이 존재하지 않습니다----</td>
							</tr>
<%
				} else{
					for(int i = 0 ; i < boardlist.size() ; i++){
%>
							<tr>
								<td><%= boardlist.get(i).getReviewboardseq()%></td>
								<td><a href="review_detail.do?reviewboardseq=<%= boardlist.get(i).getReviewboardseq()%>">[<%=movielist.get(i).getMovietitle() %>] <%=boardlist.get(i).getReviewboardtitle() %></a></td>
								<td><%= dto.getUsername() %></td>
								<td><%= boardlist.get(i).getReviewboarddate() %></td>
								<td><%= boardlist.get(i).getReviewboardview() %></td>
							</tr>
<%
					}
				}
%>							

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>

</body>

</html>
