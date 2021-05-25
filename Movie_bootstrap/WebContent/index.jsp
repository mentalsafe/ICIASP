<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What do you want to watch 와츄</title>
<!-- Load Roboto font -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<!-- Load css styles -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/pluton.css" />
<!--[if IE 7]>
            <link rel="stylesheet" type="text/css" href="css/pluton-ie7.css" />
        <![endif]-->
<link rel="stylesheet" type="text/css" href="css/jquery.cslider.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css" href="css/animate.css" />
<!-- Fav and touch icons -->

<link rel="shortcut icon" href="img/favicon.ico">
<style>
#footer {
	width: 100%
}
</style>
</head>

<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a href="index.jsp"> <img src="img/로고.png"
					width="120" height="80" alt="Logo" /> <!-- This is website logo -->
				</a>
				<!-- Navigation button, visible on small resolution -->
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<i class="icon-menu"></i>
				</button>
				<!-- Main navigation -->
				<div class="nav-collapse collapse pull-right">
					<ul class="nav" id="top-navigation">
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="MemberJoin.jsp">회원가입</a></li>
						<li><a href="MemberLogin.jsp">로그인</a></li>
					</ul>
				</div>
				<!-- End main navigation -->
			</div>
		</div>
	</div>
	<!-- Start home section -->
	<div id="home"></div>
	<!-- End home section -->

	<!-- 로고 사진 -->
	<div class="section primary-section" id="service">
		<div class="container" style="text-align: center">
			<!-- Start title section -->
			<div class="title">
				<h1>What do you want to watch 와츄</h1>
			</div>
			<img art="로고" src="img/메인로고.png">
		</div>
	</div>


	<!-- 회원가입/로그인 버튼 -->
	<div class="section secondary-section">
		<div class="triangle"></div>
		<div class="container centered">
			<p class="large-text">언제, 어디서나 와츄와 함께!</p>
			<div class="row-fluid">

				<a href="MemberJoin.jsp" class="button">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="MemberLogin.jsp" class="button">로그인</a>

			</div>
		</div>
		<br>&nbsp;
	</div>


	<div class="section primary-section">
		<div class="triangle"></div>
		<div class="container">
			<div class="title"></div>
			<div class="row"></div>
		</div>
	</div>

	<div class="footer">
		<p id="footer">
		
		</p>
	</div>
	<!-- ScrollUp button start -->
	<div class="scrollup">
		<a href="#"> <i class="icon-up-open"></i>
		</a>
	</div>
	<!-- ScrollUp button end -->
	<!-- Include javascript -->
	<script src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.mixitup.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="js/jquery.cslider.js"></script>
	<script type="text/javascript" src="js/jquery.placeholder.js"></script>
	<script type="text/javascript" src="js/jquery.inview.js"></script>
	<!-- Load google maps api and call initializeMap function defined in app.js -->
	<script async="" defer="" type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=initializeMap"></script>
	<!-- css3-mediaqueries.js for IE8 or older -->
	<!--[if lt IE 9]>
            <script src="js/respond.min.js"></script>
        <![endif]-->
	<script type="text/javascript" src="js/app.js"></script>
</body>
</html>