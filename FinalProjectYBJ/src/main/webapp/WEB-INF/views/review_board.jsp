<%@page import="com.yaboja.dto.MovieDto"%>
<%@page import="com.yaboja.dto.UserDto"%>
<%@page import="com.yaboja.dto.ReviewboardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   List<ReviewboardDto> reviewboardList = (List)request.getAttribute("reviewboardList");
   List<UserDto> userList = (List)request.getAttribute("userList");
   List<MovieDto> movieList = (List)request.getAttribute("movieList");
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

   <div class="container">
      <h2>후기게시판</h2>
      <form action="#">
         <div align="right">
            <c:choose>
            <c:when test="${dto.userid ne null }">
               <input type="button" value="글쓰기"class="btn btn-default" onclick="location.href='review_Insertform.do'">
            </c:when>
            </c:choose>
         </div>
         <br>
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
            if(reviewboardList.size() == 0){
               
%>
               <tr>
                  <td colspan="5" align="center">----작성된 글이 존재하지 않습니다----</td>
               </tr>
<%
            } else{
               for(int i = 0 ; i < reviewboardList.size() ; i++){
%>
                  <tr>
                     <td><%= reviewboardList.get(i).getReviewboardseq()%></td>
                     <td> <a href="review_detail.do?reviewboardseq=<%= reviewboardList.get(i).getReviewboardseq()%>">[<%= movieList.get(i).getMovietitle()%>] <%= reviewboardList.get(i).getReviewboardtitle()%></a></td>
                     <td><%= userList.get(i).getUsername()%></td>
                     <td><%= reviewboardList.get(i).getReviewboarddate()%></td>
                     <td><%= reviewboardList.get(i).getReviewboardview()%></td>  
                  </tr>
<%
               }
            }
%>
         </table>
      </form>
   </div>
   
   
     	<div align="center">
		
			<c:if test="${pageMaker.prev}">
				<a href="reviewboard.do?page=${pageMaker.startPage - 1}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<a href="reviewboard.do?page=${idx}">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="reviewboard.do?page=${pageMaker.endPage + 1}">다음</a>
			</c:if>
		
	</div>


   <!-- Footer -->
   <%@ include file="inc/footer.jsp"%>



</body>

</html>