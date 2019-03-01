<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<!-- <link href="css/clean-blog.min.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>



<!-- Menu Bar -->
<link href="css/menubar.css" rel="stylesheet">
<!-- Content -->
<link href="css/index_content.css" rel="stylesheet">


<!-- 카카오 로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- id 중복확인 -->
<script>
 

    //아이디 중복확인.
    function checkId() {
        var inputed = $('#id').val();
        $.ajax({
        	type:"post",
        	url : "checkId.do",
            data : "id="+inputed,
            
            success : function(data) {
                if(inputed=="" && data=='0') {
                    $(".hiddenLabel1").prop("hidden", false);
                    $(".hiddenLabel2").prop("hidden", true);
                    $(".hiddenLabel3").prop("hidden", true);
                    $('.id').focus();
                } else if (data == '0') {
                    $(".hiddenLabel1").prop("hidden", true);
                    $(".hiddenLabel2").prop("hidden", false);
                    $(".hiddenLabel3").prop("hidden", true);
//                     $("#id").prop("readonly", "readonly");
					$('#password').focus();
                } else if (data == '1') {
                    $(".hiddenLabel1").prop("hidden", true);
                    $(".hiddenLabel2").prop("hidden", true);
                    $(".hiddenLabel3").prop("hidden", false);
                    $('.id').focus();
                } 
            }
        });
    }
    
    //비밀번호,이메일 등등 제출 버튼전  확인
    function lastCheck(){
    	var pw = document.getElementById("password").value;
        var pwck = document.getElementById("passwordcheck").value;
 
        var hash=document.getElementById("hashCheck").value;
             	
        
        if (pw != pwck) {
        	$('#pwsame').prop("hidden", false);
        	$('#password').focus();
            return false;
        }else{
        	$('#pwsame').prop("hidden", true);
        }
        
        
    }
    
    //이메일 인증
    function sendMail() {
        var inputed = $('#email').val();
//         alert(inputed);
        $.ajax({
        	type:"post",
        	url : "emailChk.do",
            data : "email="+inputed,
//             var hash=document.getElementById("emailchk_input").value;
            success : function(data) {
                if( null!= data) {
                	document.getElementById("emailHash").value=data;
//                 	alert(document.getElementById("emailHash").value);
                    $("#emailmsg1").prop("hidden", false);
                    $('#emailchk_input').focus();
                }  
            }
        });
    }    
  	//해쉬값 인증
    function hashChk(){
    	if(document.getElementById("emailHash").value==document.getElementById("emailchk_input").value){
    		 $("#emailmsg1").prop("hidden", true);
    		 $("#emailmsg2").prop("hidden", false);
    		 $('#sel1').focus();
    	}
    }
</script>

<!-- 	주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function exeDaumPstcode(){
		new daum.Postcode({
			oncomplete:function(data){
				
		
		var fullRoadAddr=data.roadAddress;	//도로명 주소 변수
		var extraRoadAddr="";	//도로명 조합형 주소 변수
		
		if(data.bname!==''&& /[동|로|가]$/g.test(data.bname)){
			extraRoadAddr+=data.bname;
		}
		//건물명이 있고, 공동주택일 경우 추가
		if(data.buildingName !=''&& data.apartment==='Y'){
			extraRoadAddr+=(extraRoadAddr!=='' ? ', '+data.buildngName : data.build)
		}
		//도로명,지번 조합형 주소가 있을경우
		if(extraRoadAddr !==''){
			extraRoadAddr=' ('+extraRoadAddr+')';
		}
		//도로명,지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		if(fullRoadAddr !== ''){
			fullRoadAddr +=extraRoadAddr;
		}
		document.getElementById('useraddress').value=fullRoadAddr;
		document.getElementById('useraddress').fucus();
		return;
		}
	}).open();
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
//                 alert(document.getElementById("userprofile").value);
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }
</script>

<script type="text/javascript">
	function check(){
		alert("중복 검사를 해주세요.");
	}
</script>

</head>

<body>



	<!-- Navigation -->
	<%@ include file="inc/topbar.jsp"%>


	<!-- joinCheck -->
	<br>
	<br>
	<br>
	<br>
	<h1 align="center">회원가입</h1>
	<br>
	<br>

	<!-- Main Join Form -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<hr>
				
				
				
				
				<form name="joinform" id="fileUploadForm" action="join.do" method="post" enctype="multipart/form-data" >
<!-- id -->
					<div class="row control-group" >
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>ID</label>
							<div style="display: -webkit-box;">
								<input type="text" class="form-control" placeholder="ID" name="userid" id="id" required="required"  onblur ="checkId();" >
	
								<!-- id체크 했는지 -->
<!-- 								<button type="button" class="btn btn-default" id="idCheckButton" onclick="checkId(); " >중복확인</button> -->
								<p class="help-block text-danger"></p>
							</div>
							<!-- 중복체크 표시글 -->
							<br class="hiddenLabel1" hidden="">
							<label style="color: red;" class="hiddenLabel1" hidden="">ID를 입력해주세요.</label>
							<br class="hiddenLabel2" hidden="">
							<label style="color: blue;" class="hiddenLabel2" hidden="">사용 가능한 ID입니다.</label>
							<br class="hiddenLabel3" hidden="">
							<label style="color: red;" class="hiddenLabel3" hidden="">이미 존재하는 ID입니다.</label>							
							
						</div>
					</div>
<!-- password -->
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>Password</label> 
							<input type="password" class="form-control" placeholder="Password" id="password"  name="userpw" required="required">
							<p class="help-block text-danger"></p>
						</div>
					</div>
<!-- passwordchk -->
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>Password Check</label> 
							<input type="password" class="form-control" placeholder="Password Check" id="passwordcheck" required="required">
							<p class="help-block text-danger"></p>
						<label id="pwsame" hidden="" style="color:red;">비밀번호가 틀렸습니다. 다시 입력해 주세요</label>
						
						</div>
						
					</div>
<!-- name -->
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>Name</label> 
							<input type="text" class="form-control" placeholder="Name" name="username" required="required">
							<p class="help-block text-danger"></p>
						</div>
					</div>
 <!-- profile -->
					
 <!-- profile -->
					<div class="row control-group">
						<div class="form-group col-xs-11 floating-label-form-group controls">
							<label>Profile</label> 
							<div style="display: -webkit-box;">
								<input type="file" class="form-control" id="fileUpload" name="fileUpload" required="required">
								<input type="text" id="userprofile" name="userprofile" hidden="">
								<p class="help-block text-danger"></p>
								<button type="button" class="btn btn-default" onclick="fileSubmit();" >선택</button>								
							</div>
						</div>
						
					</div>
						
 <!-- sex -->
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>Sex</label>
							<p class="help-block text-danger"></p>
							<label class="radio-inline"><input type="radio" name="usersex" checked="checked" value="male">Male</label> 
							<label class="radio-inline"><input type="radio" name="usersex" value="femail">Femail</label>
						</div>
					</div>
 <!-- age -->
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>Age</label>
							<p class="help-block text-danger"></p>
							<label class="radio-inline"><input type="radio" name="userage" checked="checked" value="10">10</label> 
							<label class="radio-inline"><input type="radio" name="userage" value="20">20</label> 
							<label class="radio-inline"><input type="radio" name="userage" value="30">30</label> 
							<label class="radio-inline"><input type="radio" name="userage" value="40">40</label> 
							<label class="radio-inline"><input type="radio" name="userage" value="50">50</label>
						</div>
					</div>
<!-- address -->
					<div class="row control-group">
						<div class="form-group col-xs-11 floating-label-form-group controls">
							<label>Address</label>
							<div style="display: -webkit-box;">
								<input type="text" class="form-control" placeholder="Address" id="useraddress" name="useraddress" required="required">
								<button type="button" class="btn btn-default" onclick="exeDaumPstcode();">주소 찾기</button>
								<p class="help-block text-danger"></p>
							</div>
						</div>
					</div>
<!-- email -->
					<div class="row control-group">
						<div class="form-group col-xs-11 floating-label-form-group controls">
							<label>Email</label> 
							<div style="display: -webkit-box;">
								<input type="email" class="form-control" placeholder="Email Address" id="email" name="useremail" required="required">
								<button type="button" class="btn btn-default" onclick="sendMail();">이메일 인증</button>
								<p class="help-block text-danger"></p>
								
							</div>
								<input type="text" id="emailHash" hidden="" value="">
							<div id="emailchk" style="display: -webkit-box;">
								<input type="text" id="emailchk_input" class="form-control" placeholder="인증번호" required="required">
								<input type="text" id="hashCheck" hidden="" value="false">
								<button type="button" id="emailchk_buttton" class="btn btn-default" onclick="hashChk();">확인</button>
							</div>	
							<label id="emailmsg1" hidden="" style="color:blue;">인증번호가 전송되었습니다.</label>
							<label id="emailmsg2" hidden="" style="color:blue;">인증이 완료되었습니다.</label>
						</div>
						
					</div>
<!-- cinema 1-->
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>Teather 1</label> 
							<select class="form-control" id="sel1" name="usercinema1">
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
<!-- teather 2-->
					<div class="row control-group">
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>Teather 2</label> 
							<select class="form-control" name="usercinema2">
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
						<div class="form-group col-xs-12 floating-label-form-group controls">
							<label>Teather 3</label> 
							<select class="form-control" name="usercinema3" >
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
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<button type="submit" class="btn btn-default" class="signupbtn"  style="margin-left: 40%;" onclick="lastCheck();">제출</button>
							<button type="reset" class="btn btn-default" style="">초기화</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer -->


<hr>
	<br>
	<%@ include file="inc/footer.jsp"%>

</body>
</html>