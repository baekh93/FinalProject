<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V9</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="img/favicon.ico"/>
<!--===============================================================================================-->
<!-- 	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	
	<div class="container-login" >
		<div class="wrap-login p-l-55 p-r-55 p-t-80 p-b-30" >
			<form class="login100-form validate-form" action="login.do" method="post">
				<span class="login100-form-title p-b-37">
					LogIn
				</span>

				<div class="wrap-input100 validate-input m-b-20" data-validate="Enter username or email">
					<input class="input100" type="text" name="userid" placeholder="Id">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25" data-validate = "Enter password">
					<input class="input100" type="password" name="userpw" placeholder="password">
					<span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">
					<button type="submit" class="login100-form-btn">
						Log In
					</button>
				</div>

				<div class="text-center p-t-57 p-b-20">
					<span class="txt1">
						
						카카오톡->전체설정->개인/보안->카카오계정->내정보관리 <br>사용자 정보 입력
						
					</span>
				</div>

				<div class="flex-c p-b-112">
<!-- 					<a href="#" class="login100-social-item"> -->
<!-- 						<i class="fa fa-facebook-f"></i> -->
							<!--  https://kauth.kakao.com/oauth/authorize?client_id=f4bfa5f6b9448b69cd517b0762b28f21&redirect_uri=http://localhost:8787/controller/kakaologin.do&response_type=code&scope=account_email,age_range,gender" class="login100-social-item-->
<!-- 					</a> -->

					<a href="https://kauth.kakao.com/oauth/authorize?client_id=f4bfa5f6b9448b69cd517b0762b28f21&redirect_uri=http://localhost:8787/controller/kakaologin.do&response_type=code&scope=account_email,age_range,gender" class="login100-social-item">
						<img src="img/kakao.png" alt="kakao" style="width: 45px; cursor: pointer;" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=f4bfa5f6b9448b69cd517b0762b28f21&redirect_uri=http://localhost:8787/controller/kakaologin.do&response_type=code&scope=account_email,age_range,gender'">
					</a>
					
				</div>
				
				<div class="text-center">
					<a href="joincheck.do" class="txt2 hov1">
						Sign Up
					</a>
				</div>
			</form>

			
		</div>
	</div>
	
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
<!-- 	<script src="vendor/jquery/jquery-3.2.1.min.js"></script> -->
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
<!-- 	<script src="vendor/bootstrap/js/bootstrap.min.js"></script> -->
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>