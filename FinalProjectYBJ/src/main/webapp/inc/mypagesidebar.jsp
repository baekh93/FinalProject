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

</script>


</head>

<body>


	<div>


	

  <div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:160px; margin-top: 2%;">
  <a href="#" class="w3-bar-item w3-button">내 정보 관리</a>
  <button class="w3-button w3-block w3-left-align" onclick="myAccFunc()">
  코      인 <i class="fa fa-caret-down"></i>
  </button>
  <div id="demoAcc" class="w3-hide w3-white w3-card">
    <a href="#" class="w3-bar-item w3-button">결제내역</a>
    <a href="#" class="w3-bar-item w3-button">결제하기</a>
  </div>
  
  <button class="w3-button w3-block w3-left-align" onclick="myAccFunc1()">
  매칭관리 <i class="fa fa-caret-down"></i>
  </button>
  <div id="demoAcc1" class="w3-hide w3-white w3-card">
    <a href="mypage_match_to.do" class="w3-bar-item w3-button">매칭 현황</a>
    <a href="#" class="w3-bar-item w3-button">진행중인 매칭</a>
  </div>
  

  
  <a href="#" class="w3-bar-item w3-button">Link 2</a>
  <a href="#" class="w3-bar-item w3-button">Link 3</a>
	</div>



</div>



</body>

</html>
