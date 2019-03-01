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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- <!-- Theme CSS -->
-->
<!-- <link href="css/clean-blog.min.css" rel="stylesheet"> -->

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


<style type="text/css">
body {
   font-family: 'HY나무M';
}

.font-test {
   font: bold 24pt 'HY나무M';
}
</style>



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



   <!-- 영화매칭관련 페이지들 소스는 여기부터 작성!! -->

   <div id="context" class="container">
      <br> <br>
      <h1 style="color: black; font-weight: bold;">Q&A 게시판</h1>
   </div>
   <br>

   <table border=1 class="table table-bordered">
      <tr align="center">
         <td align="center"><a href = "http://pf.kakao.com/_Crxhxaj">
         <img src ="img/kakaotalk.JPG" style="cursor: pointer;"></a><p>1:1 관리자 채팅</p></td>
         <td align="center">
         <a href = "https://playchat.ai/mobile/chatbot/blank_zlxl932_1547599475956">
         <img src ="img/chatBot.jpg" style="width: 500px; cursor: pointer;">
         </a><p>Chat Bot</p>
         </td>
      </tr>

   </table>
   <!-- Footer -->
   <%@ include file="inc/footer.jsp"%>
</body>

</html>