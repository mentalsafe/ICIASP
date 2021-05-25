<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | Subscribe</title>
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
</head>

<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a href="movieList"> <img src="img/로고.png"
					width="120" height="40" alt="Logo" /> <!-- This is website logo -->
				</a>
				
				
				<!-- 상단 메뉴 -->
				<!-- 1. 관리자 모드 일때 -->
				<!-- 2. 회원일 때 -->
				<!-- 3. 이용권이 없을 때  -->
				<div class="nav-collapse collapse pull-right">
					<c:choose>
						<c:when test="${sessionScope.loginId eq 'admin'}">
							<h3>관리자 모드로 접속중 입니다!</h3>
							<ul class="nav" id="top-navigation">
								<li class="active"><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li><a href="memberList">관리자 회원 목록</a></li>
								<li><a href="adminmovieList">관리자 영화 목록</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>


						<c:when test="${loginId2.momSubD > 0}">
							<h3>${sessionScope.loginId}님 환영합니다.
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구독중</h3>
							<ul class="nav" id="top-navigation">
								<li class="active"><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li><a href="movieSaveList?mosId=${sessionScope.loginId}">내가 찜한 목록 보기</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>


						<c:when test="${sessionScope.loginId != null}">

							<h3>${sessionScope.loginId}님 환영합니다.</h3>

							<ul class="nav" id="top-navigation">
								<li><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li class="active"><a href="moneyC?momId=${sessionScope.loginId}">이용권 구매</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>

					</c:choose>
				</div>
				<!-- End 상단 메뉴 -->
				
				
				
			</div>
		</div>
	</div>
	

	<!-- 구독권 구매 start -->
	<form action="momSub" method="POST" name="subForm">
		<input type="hidden" name="momId" value="${sessionScope.loginId}">
		<input type="hidden" name="momMoney" id="momMoney" value="${member.momMoney}">
		<div id="price" class="section secondary-section">
			<div class="container">

				<div class="title">

					<h1>구독권 구매</h1>
					<p>희망하는 구독일 수를 선택해 주세요.</p>
					<h3>${sessionScope.loginId}님의잔액 : ${member.momMoney} 원 입니다.</h3>
				</div>

				<div class="price-table row-fluid">
					<div class="span4 price-column">
						<label><h3>7일</h3>
							<ul class="list">
								<li class="price">4,900원</li>
								<li><strong>7일구독권</strong></li>

								<li>결제일로부터 7일간 와츄에서 제공하는 컨텐츠를 즐기실수 있습니다.</li>
							</ul> <input type="radio" name="subDay" value="7"></label>

					</div>



					<div class="span4 price-column">
						<label><h3>15일</h3>
							<ul class="list">
								<li class="price">8,900원</li>
								<li><strong>15일 구독권</strong></li>

								<li>결제일로부터 15일간 와츄에서 제공하는 컨텐츠를 즐기실수 있습니다.</li>
							</ul>
							<input type="radio" name="subDay" value="15"></label>
						<!--  <a href="#" class="button button-ps">구매</a> -->
					</div>



					<div class="span4 price-column">
						<label><h3>30일</h3>
							<ul class="list">
								<li class="price">15,000원</li>
								<li><strong>30일 구독권</strong></li>

								<li>결제일로부터 30일간 와츄에서 제공하는 컨텐츠를 즐기실수 있습니다.</li>
							</ul>
							<input type="radio" name="subDay" value="30"></label>

					</div>
				</div>
				<div class="centered">
					<p class="price-text">원하시는 상품을 선택해 주세요.</p>
					<input type=button class="button" value="결제하기" onclick="sub()">
					<input type=button class="button" value="뒤로가기"
						onclick="location.href='movieList"> <input type=button
						class="button" value="캐시충전" onclick="location.href='addMoney.jsp'">

				</div>

			</div>
			<br><br>
		</div>
		
	</form>
	


	<!-- Footer section start -->
	<div class="footer"></div>
	<!-- Footer section end -->
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

<script>
	function sub(){
		subForm.submit();
	}
    
</script>

</html>

