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
<script type="text/javascript">
   function searchclick() {
      var x = document.getElementsByName("keyword")[0].value;
      //    alert(x);
      if (x == "" || x == " ") {
         alert('검색어를 입력해주세요');
      } else {
         alert('확인');
      }

      function boardlist() {
         var x = document.getElementsByName("listsize").value;
         alert(x);
      }
   }
</script>

<body>


   <!-- Navigation -->
   <%@ include file="inc/topbar.jsp"%>


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
   <!-- moviesidebar -->
   <%@ include file="inc/moviesidebar.jsp"%>

   <!-- 영화매칭관련 페이지들 소스는 여기부터 작성!! -->



   <div id="context" class="container">
      <br> <br>
      <h1 style="color: black; font-weight: bold;">매칭 게시판</h1>

      <br/>
      <div class="layout-container">
         <div id="main">
            <!-- sidebar를 include해준다. -->
            <div class="form">
               <div class="container container-fluid"></div>
               <div class="container container-fluid">

                  <div class="jumbotron jumbotron-fluid">
                     <table>
                        <c:choose>
                           <c:when test="${user_name eq null}">
                              <tr>
                                 <th>ID : 로그인 해주세요</th>
                              </tr>

                           </c:when>
                           <c:otherwise>
                              <tr>
                                 <th>ID : ${user_name }</th>
                              </tr>
                              <tr>
                                 <th>COIN : ${coin } (매칭 당 1코인이 차감됩니다.)</th>
                              </tr>
                           </c:otherwise>
                        </c:choose>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div align="right">

         
         <c:choose>
            <c:when test="${user_name eq null}">


            </c:when>
            <c:otherwise>
               <input type="button" value="매칭만들기" class="btn btn default"
                  onclick="location.href='matchingForm.do'" />

            </c:otherwise>
         </c:choose>


      </div>
      <br>

      <table border=1 class="table table-bordered">
         <tr align="center">
            <td width="100px"><h5 style="color: navy; font-weight: bold;">작성자</h5></td>
            <td width="300px"><h5 style="color: navy; font-weight: bold;">제 목</h5></td>
            <td width="70px"><h5 style="color: navy; font-weight: bold;">성 별</h5></td>
            <td width="70px"><h5 style="color: navy; font-weight: bold;">연 령</h5></td>
            <td width="150px"><h5 style="color: navy; font-weight: bold;">영화관</h5></td>
            <td width="200px"><h5 style="color: navy; font-weight: bold;">영 화</h5></td>
            <td width="100px"><h5 style="color: navy; font-weight: bold;">날 짜</h5></td>


         </tr>

         <c:choose>
            <c:when test="${empty matchingboardlist1 }">
               <h3>----등록된 매칭글이 없습니다----</h3>
            </c:when>
            <c:otherwise>
               <c:forEach var="i" begin="0" end="${listsize }">

                  <tr align="center">
                     <td><c:out value="${matchingboardlist2[i].username }" /></td>
                     <td><a href="matchingboardselectone.do?matchingboard=${matchingboardlist1[i].matchingboard }">
                     <c:out value="${matchingboardlist1[i].matchingboardtitle }" /></a></td>
                     <td><c:out value="${matchingboardlist2[i].usersex }" /></td>
                     <td><c:out value="${matchingboardlist2[i].userage }" /></td>
                     <td><c:out value="${matchingboardlist4[i].cinema }" /></td>
                     <td><c:out value="${matchingboardlist3[i].movietitle }" /></td>
                     <td><fmt:formatDate pattern ="yyyy-MM-dd HH:mm:ss" value="${matchingboardlist1[i].matchingboarddate }" /></td>

                  </tr>
               </c:forEach>

            </c:otherwise>

         </c:choose>
         <%
            
         %>
      </table>
      <!-- 페이지 추가 -->
      <div>
         <ul style="margin-left: 50%;">
            <c:if test="${pageMaker.prev}">
               <a href="matchingboardlist.do?page=${pageMaker.startPage - 1}">이전</a>
            </c:if>

            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
               var="idx">
               <a href="matchingboardlist.do?page=${idx}">${idx}</a>
            </c:forEach>

            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
               <a href="matchingboardlist.do?page=${pageMaker.endPage + 1}">다음</a>
            </c:if>
         </ul>

      </div>
   </div>


   <!-- Footer -->
   <%@ include file="inc/footer.jsp"%>
</body>

</html>