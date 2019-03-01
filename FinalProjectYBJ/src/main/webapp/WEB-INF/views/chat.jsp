<%@page import="com.yaboja.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%
	int userseq1 = 0;
	String userImg1 = null;
	String userImg2 = null;
	if(session.getAttribute("dto")!=null){
		userseq1 = ((UserDto)session.getAttribute("dto")).getUserseq();
		userImg1 = ((UserDto)session.getAttribute("dto")).getUserprofile();
	}
	int userseq2 = 0;
	if(request.getAttribute("userseq2") != null){
		userseq2 = Integer.parseInt((String)request.getAttribute("userseq2"));
	}
	if(request.getAttribute("userDto") != null){
		userImg2 = ((UserDto)request.getAttribute("userDto")).getUserprofile();
	}
	
	
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>야보자</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function autoClosingAlert(selector,delay){
		var alert = $(selector);
		alert.show();
		window.setTimeout(function(){ alert.hide() }, delay);
	}
	function submitFunction(){ //전송버튼 눌렀을때 1:나, 2:상대방
		var userseq1 = "<%= userseq1 %>"; 
		var userseq2 = "<%= userseq2 %>"; 
		var chatcontent = $('#chatContent').val();
		$.ajax({ //에이작스로 데이터보냄 : 리퀘스트로 받을 수 있음
			type: "POST",
			url: "chatSubmitServlet.do",
			data: {
				userseq1: encodeURIComponent(userseq1),
				userseq2: encodeURIComponent(userseq2),
				chatcontent: encodeURIComponent(chatcontent),
			},
			success: function(result){
				if(result == 1){
					autoClosingAlert('#successMessage', 2000);
					//alert("메시지 전송에 성공했습니다.");
				} else if(result == 0){
					autoClosingAlert('#dangerMessage',2000);
					//alert("이름과 내용을 모두 입력해주세요.");
				} else{
					autoClosingAlert('#warningMessage',2000);
					//alert("데이터베이스 오류가 발생했습니다.");
				}
			}
		});
		$('#chatContent').val('');
		
	}
	var lastID = 0;
	function chatListFunction(type){
		var userseq1 = '<%= userseq1%>';
		var userseq2 = '<%= userseq2%>';
		var img;
		$.ajax({
			type: "POST",
			url: "chatListServlet.do",
			data:{
				userseq1: encodeURIComponent(userseq1),
				userseq2: encodeURIComponent(userseq2),
				listType: type
			},
			success: function(data){
				if(data == "") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i = 0 ; i < result.length ; i++){
					if(result[i][0].value == userseq1){
						result[i][0].value = '나';
						img = 'profile/<%= userImg1%>';
					}else{
						result[i][0].value = '상대방';
						img = 'profile/<%= userImg2%>';
					}
					addChat(result[i][0].value,result[i][2].value,result[i][3].value,img);
				}
				lastID = Number(parsed.last);
			}
		});
		
	}
	function addChat(chatName,chatContent, chatTime,img){
		$('#chatList').append('<div calss="row">'+
				'<div>'+
				'<a calss="pull-left" href="#">'+
				'<img class="img-circle" style="width: 30px; height:30px;" src="'+img+'" alt="">'+
				'</a>'+
				'<h4><b>'+
				chatName+
				'</b><br>'+
				'<span class="small pull-right">'+
				chatTime+
				'</span>'+
				'</h4>'+
				'<p>'+
				chatContent+
				'</p>'+
				'</div>'+
				'</div>'+
				'<hr>');
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	function getInfiniteChat(){
		setInterval(function(){
			chatListFunction(lastID);
		},3000);
	}

</script>

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
	<br><br>
	<div class="container">
	<h3><b><%= ((UserDto)request.getAttribute("userDto")).getUsername()%></b><i>님과의 채팅</i></h3>
	<div id="chat" class="panel-collapse collapse in">
		<div id="chatList" class="porlet-body chat-widget" style="overflow: auto; width: auto; height: 600px;">
		</div>
		<br/><br/>
		<div style="height: 90px;">
			<textarea class="form-control" style="height: 80px; width: 1000px; resize: none;" id="chatContent" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
		</div>
		<button class ="btn btn-default" type="button" onclick="submitFunction();">전송</button>
		
	</div>
	<div id="successMessage" style="display: none;">
		<strong>메시지 전송에 성공했습니다.</strong>
	</div>
	<div id="dangerMessage" style="display: none;">
		<strong>이름과 내용을 모두 입력해주세요.</strong>
	</div>
	<div id="warningMessage" style="display: none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>
	</div>
	
	

	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>
<%
	if(userseq1 != 0){
%>
	<script type="text/javascript">
		$(document).ready(function(){
			chatListFunction('0');
			getInfiniteChat();
		});
	</script>
<%
	}
%>
</body>

</html>
