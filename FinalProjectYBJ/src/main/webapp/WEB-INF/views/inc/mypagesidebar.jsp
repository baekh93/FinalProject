<%@page import="com.yaboja.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	int userseq = 0;
	if(session.getAttribute("dto")!=null){ 
		userseq = ((UserDto)session.getAttribute("dto")).getUserseq();
	}	
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


 <!-- mypagesidebar 마이페이지사이드바 -->
<link href="css/mypagesidebar.css" rel="stylesheet">


<script type="text/javascript">
function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-dark-gray";
  } else { 
    x.className = x.className.replace(" w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-dark-gray", "");
  }
  
}

function myAccFunc1() {
     var x = document.getElementById("demoAcc1");
     if (x.className.indexOf("w3-show") == -1) {
       x.className += " w3-show";
       x.previousElementSibling.className += " w3-dark-gray";
     } else { 
       x.className = x.className.replace(" w3-show", "");
       x.previousElementSibling.className = 
       x.previousElementSibling.className.replace(" w3-dark-gray", "");
     }
     
   }
   
	function getMatch_unread(){
	 	$.ajax({
	       	type: "POST",
	       	data:{
	        	  userseq: encodeURIComponent(<%= userseq %>)},
	      	url: "allUnreadMatching.do",
	       	success: function(result){
	          	if(result >= 1){
	             	$('#match_unread').html(result);
	          	}else{
	        	  	$('#match_unread').html("");
	          	}
	       	}
	    });
	}
	function getSuccess_unread(){
	 	$.ajax({
	       	type: "POST",
	       	data:{
	        	  userseq: encodeURIComponent(<%= userseq %>)},
	      	url: "unreadSuccess.do",
	       	success: function(result){
	          	if(result >= 1){
	             	$('#success_unread').html(result);
	          	}else{
	        	  	$('#success_unread').html("");
	          	}
	       	}
	    });
	}
	function getRequested_unread(){
	 	$.ajax({
	       	type: "POST",
	       	data:{
	        	  userseq: encodeURIComponent(<%= userseq %>)},
	      	url: "unreadRequested.do",
	       	success: function(result){
	          	if(result >= 1){
	             	$('#requested_unread').html(result);
	          	}else{
	        	  	$('#requested_unread').html("");
	          	}
	       	}
	    });
	}
	function getRejection_unread(){
	 	$.ajax({
	       	type: "POST",
	       	data:{
	        	  userseq: encodeURIComponent(<%= userseq %>)},
	      	url: "unreadRejection.do",
	       	success: function(result){
	          	if(result >= 1){
	             	$('#rejection_unread').html(result);
	          	}else{
	        	  	$('#rejection_unread').html("");
	          	}
	       	}
	    });
	}
</script>


</head>

<body>


   <div>


   

  <div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:160px; margin-top: 2%;">
  <a href="mypage.do" class="w3-bar-item w3-button">내 정보 관리</a>
  <button class="w3-button w3-block w3-left-align" onclick="myAccFunc()">
  코      인 <i class="fa fa-caret-down"></i>
  </button>
  <div id="demoAcc" class="w3-hide w3-white w3-card">
    <a href="coin_payment.do" class="w3-bar-item w3-button">결제내역</a>
    <a href="coin_charge.do" class="w3-bar-item w3-button">결제하기</a>
  </div>
  
  <button class="w3-button w3-block w3-left-align" onclick="myAccFunc1()">
  매칭관리<span class="badge" id="match_unread"></span> <i class="fa fa-caret-down"></i>
  </button>
  <div id="demoAcc1" class="w3-hide w3-white w3-card">
    <a href="mypage_match_success.do" class="w3-bar-item w3-button">진행중매칭<span class="badge" id="success_unread"></span></a>
    <a href="mypage_match_to.do" class="w3-bar-item w3-button">매칭관리<span class="badge" id="requested_unread"></span></a>
    <a href="match_history.do" class = "w3-bar-item w3-button">매칭기록<span class="badge" id="rejection_unread"></span></a>

  </div>
  

  

   </div>



</div>



</body>

<%
if(session.getAttribute("dto")!=null){ 
%>
<script type="text/javascript">

		$(document).ready(function() {
			getMatch_unread();
			getSuccess_unread();
			getRequested_unread();
			getRejection_unread();
			setInterval(function(){getMatch_unread();} , 4000);
			setInterval(function(){getSuccess_unread();} , 4000);
			setInterval(function(){getRequested_unread();} , 4000);
			setInterval(function(){getRejection_unread();} , 4000);
		});

</script>
<%
}
%>

</html>