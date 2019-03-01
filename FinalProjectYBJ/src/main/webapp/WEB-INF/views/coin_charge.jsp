<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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



<script type="text/javascript">
	function CheckForm(Join) {

		//체크박스 체크여부 확인 [하나]
		var chk1 = document.payment.paymentCheck;
		var select1 = document.payment.point_val;
		if (select1.value == "") {
			alert('결제하실 금액을 선택해주세요.');
			select1.focus();
			return false;
		}

		if (!chk1.checked) {
			alert('결제 동의를 체크해 주세요');
			chk1.focus();
			return false;
		}
	}
</script>


</head>

<body>

	<%System.out.println("결제하기"); %>
	<!-- Navigation -->
	<%@ include file="inc/topbar.jsp"%>


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
	<br>
	<br>
	
	
	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<div class="form">
				<div class="container container-fluid"></div>
				<div class="container container-fluid">
					<h2 style="">결제하기</h2>
					<div class="jumbotron jumbotron-fluid">
						<table>
							<tr>
								<th>ID : ${user_name }</th>
							</tr>
							<tr>
								<th>COIN : ${coin } (매칭 당 1코인이 차감됩니다.)</th>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	


	<!--  
	<div class="container container-fluid">

		<table border="1" class="table table-hover" style="background: white;">
			<thead align="center">
				<tr>
					<th>번호</th>
					<th>사용자</th>
					<th>충전날짜</th>
					<th>충전금액</th>
					<th>상태</th>
				</tr>
			</thead>
			
			
			<tbody>
				<c:choose>
					<c:when test="${empty coinlist }">
						<tr>
							<td colspan="5" align="center">===== 충전내역이 없습니다. =====</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${coinlist }" var="dto">
							<tr>
								<td>${dto.coinseq}</td>
								<td>${dto.userseq }</td>
								<td><fmt:formatDate value="${dto.coindate }"
										pattern="yy.MM.dd HH:mm" /></td>
								<td>${dto.coinlog }</td>
								<td>${dto.coinstate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>

			
		</table>
	</div>
	--> 

	<hr class="my-4">
	<div class="container">
		<div class="col-md-8 order-md-1">
			<form method="post" action="coin_imp.do" name="payment"
				onSubmit="return CheckForm(this)">
				<div class="form-group">
					<h1>충전 금액</h1> 
					<select
						class="form-control form-control-lg" name="point_val">
						<option value="" selected>충전할 금액을 선택해주세요.</option>
						<option value="5000">5000(10coin)</option>
						<option value="10000">10000(20coin)</option>
						<option value="15000">15000(30coin)</option>
						<option value="20000">20000(40coin)</option>
						<option value="25000">25000(50coin)</option>
					</select>
				</div>
				<div class="form-group form-check">
					<input type="checkbox" class="form-check-input" id="paymentCheck"
						name="paymentCheck"> <label class="form-check-label"
						for="paymentCheck">포인트 충전 결제 진행에 동의합니다.</label>
				</div>
				<img alt="" src="">
				<button type="submit" class="btn btn-default pull-">카카오결제하기</button>
			</form>
			</br> </br>

		</div>
	</div>

	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>
