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
	function PwSameCheck(PW) {
		var pw1 = document.getElementById("pw1").value;
		var pw2 = document.getElementById("pw2").value;

		if (pw1 != pw2) {
			document.getElementById("notsame").innerHTML = "비밀번호가 일치하지 않습니다.";
			return false;
		} else if (pw1 = pw2) {
			location.href = "mypage.do";
			return true;
		}
	}
</script>
<!-- 파일업로드 -->
<script>
    function fileSubmit() {
//     	alert(document.getElementById("id").value);

        var formData = new FormData($("#fileUploadForm")[0]);
        $.ajax({
            type : 'post',
            url : 'fileUpload.do',
            data : formData,
            processData : false,
            contentType : false,
            success : function(msg) {
                alert("파일 업로드하였습니다.");
                document.getElementById("userprofile").value=msg;
                alert(document.getElementById("userprofile").value);
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }
</script>
</head>

<body>


	<!-- Navigation -->
	<%@ include file="inc/topbar.jsp"%>


	<!-- Menu Bar -->
	<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
		<!-- 메뉴바 -->
		<a href=""><strong>Movie Board</strong></a> <a href=""><strong>Matching
				Board</strong></a> <a href=""><strong>Review Board</strong></a> <a href=""><strong>Q&A
				Board</strong></a> <a href=""><strong>My Page</strong></a>
		<div class="nav-underline"></div>
	</nav>

	<!-- mypagesidebar -->
	<%@ include file="inc/mypagesidebar.jsp"%>

	<!-- 마이페이지 부분 소스는 여기부터 작성!! -->
	</br>
	</br>
	<div class="container">
		<h1>MY PAGE</h1>
		<form name="joinform" id="fileUploadForm" action="mypage_update.do" method="post"
			 enctype="multipart/form-data" onsubmit="return PwSameCheck()">
			<input type="hidden" name="userseq" value="${dto.userseq }">
			<div class="row control-group" >
						<div class="form-group col-xs-12 floating-label-form-group controls">
						<label>ID</label>
					<div>
						<input name="userid" value="${dto.userid }" readonly="readonly" />
					</div>
						<label>Password</label> 
					<div>
						<input type="password" name="userpw" id="pw1" value="${dto.userpw }" />
					</div>
						<label>Password Check</label> 
					<div>
						<input type="password" id="pw2" />
						<p id="notsame" style="color: red;">
					</div>
						<label>Name</label> 
					<div>
						<input name="username" value="${dto.username }" />
					</div>
						<label>Email</label> 
					<div>
						<input name="useremail" value="${dto.useremail }" readonly="readonly" />
					</div>
						<label>Profile</label>
					<div>
						<input type="file" class="form-control" id="fileUpload" name="fileUpload">
						<input type="text" id="userprofile" name="userprofile" hidden="">
						<p class="help-block text-danger"></p>
						<button type="button" class="btn btn-default" onclick="fileSubmit();" >선택</button>								
					</div>
						<label>Sex</label>
					<div>
						<input type="radio" id="man" name="usersex" value="남" /><label for="man">남</label> 
						<input type="radio" id="woman" name="usersex" value="여" /><label for="woman">여</label>
					</div>
						<label>Age</label>
					<div>
						<input type="radio" id="10" name="userage" value="10" /><label for="10">10</label> 
						<input type="radio" id="20" name="userage" value="20" /><label for="20">20</label> 
						<input type="radio" id="30" name="userage" value="30" /><label for="30">30</label> 
						<input type="radio" id="40" name="userage" value="40" /><label for="40">40</label>
						<input type="radio" id="50" name="userage" value="50" /><label for="50">50</label>
					</div>
						<label>Address</label>
					<div>
					<input type="text" name="useraddress" value="${dto.useraddress }" />
					</div>
				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>Teather 1</label> <select class="form-control" id="sel1"
							name="usercinema1">
							<c:choose>
								<c:when test="${empty cinemaList }">
									<option>영화관 목록이 없습니다.</option>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" items="${cinemaList}">
										<option value=${i.cinemaseq }>${i.cinema }</option>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</select>
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>Teather 2</label> <select class="form-control"
							name="usercinema2">
							<c:choose>
								<c:when test="${empty cinemaList }">
									<option>영화관 목록이 없습니다.</option>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" items="${cinemaList}">
										<option value=${i.cinemaseq }>${i.cinema }</option>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</select>
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<!-- teather 3-->
				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>Teather 3</label> <select class="form-control"
							name="usercinema3">
							<c:choose>
								<c:when test="${empty cinemaList }">
									<option>영화관 목록이 없습니다.</option>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" items="${cinemaList}">
										<option value=${i.cinemaseq }>${i.cinema }</option>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</select>
						<p class="help-block text-danger"></p>
					</div>
				</div>
			</div>
		</div>
				
			<input type="button" value="취소" class="btn btn-default pull-right" onclick="location.href='mypage.do'"/>
			<input type="submit" value="수정" class="btn btn-default pull-right" />
		</form>

	</div>


	<!-- Footer -->
	<%@ include file="inc/footer.jsp"%>



</body>

</html>
