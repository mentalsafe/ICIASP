<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | MemberView</title>
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
table {
	margin: auto;
}

td, th {
	padding: 15px;
}
</style>
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
								<li><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li class="active"><a href="memberList">관리자 회원 목록</a></li>
								<li><a href="adminmovieList">관리자 영화 목록</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>


						<c:when test="${loginId2.momSubD > 0}">
							<h3>${sessionScope.loginId}님 환영합니다.
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구독중</h3>
							<ul class="nav" id="top-navigation">
								<li><a href="movieList">Home</a></li>
								<li class="active"><a
									href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li><a href="movieSaveList?mosId=${sessionScope.loginId}">내가
										찜한 목록 보기</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>


						<c:when test="${sessionScope.loginId != null}">

							<h3>${sessionScope.loginId}님 환영합니다.</h3>

							<ul class="nav" id="top-navigation">
								<li><a href="movieList">Home</a></li>
								<li class="active"><a
									href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li><a href="moneyC?momId=${sessionScope.loginId}">이용권
										구매</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>

					</c:choose>
				</div>
				<!-- End 상단 메뉴 -->

			</div>
		</div>
	</div>



	<!-- 회원 상세조회 -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container" style="text-align: center">
			<div class=" title">
				<h1>${member.momId}님회원정보</h1>
			</div>
			<br>
			<div class="span5 contact-form centered" id=box>

				<table class="table" id="maint"
					style="text-align: center; color: black">
					<tr>
						<td id="nametag">아 이 디</td>
						<td id="value1">${member.momId}</td>
					</tr>
					<tr>
						<td id="nametag">비밀번호</td>
						<td id="value1">${member.momPw}</td>
					</tr>
					<tr>
						<td id="nametag">이 름</td>
						<td id="value1">${member.momName}</td>
					</tr>
					<tr>
						<td id="nametag">생 일</td>
						<td id="value1">${member.momBirth}</td>
					</tr>
					<tr>
						<td id="nametag">성 별</td>
						<td id="value1">${member.momGender}</td>
					</tr>
					<tr>
						<td id="nametag">이 메 일</td>
						<td id="value1">${member.momEmail}</td>
					</tr>
					<tr>
						<td id="nametag">캐 시</td>
						<td id="value1">${member.momMoney}</td>
					</tr>
					<tr>
						<td id="nametag">구 독 권</td>

						<c:choose>
							
							<c:when test="${member.momSubD >0}">
								<td id="value1">${member.momSub}까지 ${member.momSubD}일 남음</td>
							</c:when>

							<c:otherwise>
								<td id="value1">구독권 없음</td>
							</c:otherwise>
						</c:choose>
					</tr>

				</table>
				<c:if test="${sessionScope.loginId eq 'admin'}">
					<button class="message-btn"
						onclick="location.href='memberList?page=${page}&limit=${limit}'">회원목록보기</button>
				</c:if>

				<c:if test="${sessionScope.loginId eq member.momId}">
					<button class="message-btn"
						onclick="location.href='memberDelete?momId=${member.momId}'">탈퇴하기</button>
					<button class="message-btn"
						onclick="location.href='memberModifyForm?momId=${member.momId}'">수정하기</button>
				</c:if>

			</div>

			<br> <br>



		</div>
	</div>
	<!-- 회원 상세조회 end -->




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
	function funSel() {
		var limit = document.getElementById("limit").value;
		location.href = "memberList?limit=" + limit;
	}
</script>

</html>