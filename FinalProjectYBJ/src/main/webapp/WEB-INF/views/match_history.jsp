<%-- <%@page import="com.yaboja.dto.UserDto"%> --%>
<%-- <%@page import="com.yaboja.dto.ReviewboardDto"%> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.yaboja.dto.MatchingDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	UserDto userDto = (UserDto)session.getAttribute("dto");
	List<MatchingDto> matchingList = (List)request.getAttribute("matchingList");
	List<UserDto> userList = (List)request.getAttribute("userList");
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
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
	
	
	<hr class="my-4">
   <div class="layout-container">
      <div id="main">
         <div class="form">
            <div class="container container-fluid">
               <h2>매칭 기록</h2>
            </div>
            <div class="container container-fluid">
               <div class="jumbotron jumbotron-fluid">
 <%
 				if(matchingList.size() == 0){
 %>
 				<h4 style="color:blue;">매칭 기록이 없습니다. 매칭을 시작해보세요!</h4>
 <%
 				}else{
 %>
               <table border="1" class="table table-hover" style="background: white;">
         <thead align="center">
            <tr align="center">
				<td width="300px"><h4 style="color:black; font-weight: bold;">내     용</h4></td>
				<td width="100px"><h4 style="color:black; font-weight: bold;">일     시 </h4></td>
			</tr>
         </thead>
<%
					for(int i = 0 ; i < matchingList.size() ; i++){
%>
						<tr align="center">
							<td><%= userList.get(i).getUsername()%>님과 매칭이 <%= matchingList.get(i).getSelectedapplicant().equals("Y")?"완료되었습니다.":"거절되었습니다."%></td> 
							<td><%= date.format(matchingList.get(i).getMatchingdate())%></td>
						</tr>
<%
					}
%>
				</table>
<%
 				}
%>
               </div>
            </div>
         </div>
      </div>
   </div>
   
	
	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>

</body>

</html>