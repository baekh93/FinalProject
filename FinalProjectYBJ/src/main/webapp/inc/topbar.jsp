
<%@page import="com.yaboja.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>UTC</title>

<style type="text/css">
a, body {
	color: #333
}

.navbar-custom .nav li a, .navbar-custom .navbar-brand, h1, h2, h3, h4,
	h5, h6 {
	font-weight: 800
}

.caption, .intro-header .page-heading, .intro-header .site-heading,
	footer .copyright {
	text-align: center
}
body { 
   	font-family: Lora, 'Times New Roman', serif;     
/*   	font-size: 20px;   */
/*   	-webkit-tap-highlight-color: #0085A1   */
 } 


.intro-header .page-heading .subheading, .intro-header .post-heading .subheading,
	.intro-header .site-heading .subheading, .navbar-custom, h1, h2, h3, h4,
	h5, h6 {
	font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif
}

p {
	line-height: 1.5;
	margin: 30px 0
}

p a {
	text-decoration: underline
}

a:focus, a:hover {
	color: #0085A1
}

a img:focus, a img:hover {
	cursor: zoom-in
}

blockquote {
	color: #777;
	font-style: italic
}

hr.small {
	max-width: 100px;
	margin: 15px auto;
	border-width: 4px;
	border-color: #fff
}

.navbar-custom {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 3
}

.navbar-custom .navbar-header .navbar-toggle {
	color: #777;
	font-weight: 800;
	text-transform: uppercase;
	font-size: 12px
}

.navbar-custom .nav li a {
	text-transform: uppercase;
	font-size: 12px;
	letter-spacing: 1px
}

@media only screen and (min-width:768px) {
	.navbar-custom {
		background: 0 0;
		border-bottom: 1px solid transparent
	}
	.navbar-custom .navbar-brand {
		color: #fff;
		padding: 20px
	}
	.navbar-custom .navbar-brand:focus, .navbar-custom .navbar-brand:hover {
		color: rgba(255, 255, 255, .8)
	}
	.navbar-custom .nav li a {
		color: #fff;
		padding: 20px
	}
	.navbar-custom .nav li a:focus, .navbar-custom .nav li a:hover {
		color: rgba(255, 255, 255, .8)
	}
}

@media only screen and (min-width:1170px) {
	.navbar-custom {
		-webkit-transition: background-color .3s;
		-moz-transition: background-color .3s;
		transition: background-color .3s;
		-webkit-transform: translate3d(0, 0, 0);
		-moz-transform: translate3d(0, 0, 0);
		-ms-transform: translate3d(0, 0, 0);
		-o-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
		-webkit-backface-visibility: hidden;
		backface-visibility: hidden
	}
	.navbar-custom.is-fixed {
		position: fixed;
		top: -61px;
		background-color: rgba(255, 255, 255, .9);
		border-bottom: 1px solid #f2f2f2;
		-webkit-transition: -webkit-transform .3s;
		-moz-transition: -moz-transform .3s;
		transition: transform .3s
	}
	.navbar-custom.is-fixed .navbar-brand {
		color: #333
	}
	.navbar-custom.is-fixed .navbar-brand:focus, .navbar-custom.is-fixed .navbar-brand:hover
		{
		color: #0085A1
	}
	.navbar-custom.is-fixed .nav li a {
		color: #333
	}
	.navbar-custom.is-fixed .nav li a:focus, .navbar-custom.is-fixed .nav li a:hover
		{
		color: #0085A1
	}
	.navbar-custom.is-visible {
		-webkit-transform: translate3d(0, 100%, 0);
		-moz-transform: translate3d(0, 100%, 0);
		-ms-transform: translate3d(0, 100%, 0);
		-o-transform: translate3d(0, 100%, 0);
		transform: translate3d(0, 100%, 0)
	}
}

.intro-header {
	background: center center no-repeat;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
	margin-bottom: 50px
}

.intro-header .page-heading, .intro-header .post-heading, .intro-header .site-heading
	{
	padding: 100px 0 50px;
	color: #fff
}

.intro-header .page-heading h1, .intro-header .site-heading h1 {
	margin-top: 0;
	font-size: 50px
}

.intro-header .page-heading .subheading, .intro-header .site-heading .subheading
	{
	font-size: 24px;
	line-height: 1.1;
	display: block;
	font-weight: 300;
	margin: 10px 0 0
}

@media only screen and (min-width:768px) {
	.intro-header .page-heading, .intro-header .post-heading, .intro-header .site-heading
		{
		padding: 150px 0
	}
	.intro-header .page-heading h1, .intro-header .site-heading h1 {
		font-size: 80px
	}
}

.intro-header .post-heading h1 {
	font-size: 35px
}

.intro-header .post-heading .meta, .intro-header .post-heading .subheading
	{
	line-height: 1.1;
	display: block
}

.intro-header .post-heading .subheading {
	font-size: 24px;
	margin: 10px 0 30px;
	font-weight: 600
}

.intro-header .post-heading .meta {
	font-family: Lora, 'Times New Roman', serif;
	font-style: italic;
	font-weight: 300;
	font-size: 20px
}

.intro-header .post-heading .meta a {
	color: #fff
}

@media only screen and (min-width:768px) {
	.intro-header .post-heading h1 {
		font-size: 55px
	}
	.intro-header .post-heading .subheading {
		font-size: 30px
	}
}



</style>	

</head>
<!---------------------------------------바디 바디 바디----------------------------------->
<body>

	<nav class="navbar navbar-default navbar-custom navbar-fixed-top" style="text-align: center; background-color: rgba(0, 0, 0, .7); color: white; height: 6%;">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll" style="width: 100%;">
<!-- 				<button type="button" class="navbar-toggle" data-toggle="collapse" -->
<!-- 					data-target="#bs-example-navbar-collapse-1"> -->
<!-- 					<span class="sr-only">Toggle navigation</span> Menu <i -->
<!-- 						class="fa fa-bars"></i> -->
<!-- 				</button> -->
				<a class="navbar-brand" href="main.do">Movie Matching</a>
				

			
				
				<%
				UserDto dto=(UserDto)session.getAttribute("dto"); 
				if(dto==null){%>
					<a class="navbar-brand" href="loginform.do" data-toggle="modal" data-target="#myModal" style="float: right;">Login</a>
					<a class="navbar-brand" href="joincheck.do" style="float: right;">Join</a><%
				}else{%>
					<i class="glyphicon glyphicon-bell" style="float: right; margin: 20px; cursor: pointer;"><span class="badge">4</span></i>
					<i class="glyphicon glyphicon-comment" style="float: right; margin: 20px; cursor: pointer;"><span class="badge">0</span></i>
					<a class="navbar-brand" href="logout.do"  style="float: right;">Logout</a>
					<a class="navbar-brand" href="joincheck.do" style="float: right;"><%=dto.getUsername()%>님 </a>
				

					
				<%}%>
					
				
				
			</div>


		</div>
		<!-- /.container -->
	</nav>
	
	
		<!-- Modal 1 -->
	<div class="modal fade" id="myModal">
 	<div class="modal-dialog modal-md">		
			<div class="modal-content">
				<!-- loginform.jsp가 연결된다. -->
			</div>
		</div>
	</div>

	
	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>	
</body>
</html>