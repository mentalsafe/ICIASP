<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | ReviewModify</title>
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
								<li><a href="memberList">관리자 회원 목록</a></li>
								<li class="active"><a href="adminmovieList">관리자 영화 목록</a></li>
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
								<li class="active"><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li><a href="moneyC?momId=${sessionScope.loginId}">이용권 구매</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>

					</c:choose>
				</div>
				<!-- End 상단 메뉴 -->

			</div>
		</div>
	</div>



	<!-- 리뷰 수정 -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container" style="text-align: center">
			<div class=" title">
				<h1>리뷰 수정</h1>
			</div>
			<br>
			<div class="span9 contact-form centered" style="border-radius: 20px">

				<form action="reviewModify" method="POST">
					<table style="color: black">
						
						<tr>
							<th>작성자</th>
							<td>${review.morId}<input type="hidden" name="morNum" value="${review.morNum}">
												<input type="hidden" name="morMonum" value="${review.morMonum}"></td>
						</tr>

						


						<tr>
							<th>리뷰내용</th>
							<td><textarea rows="10" cols="20" name="morContents" placeholder="수정할 내용을 입력해주세요! (100자 이내)" class="span5"></textarea></td>
						</tr>

						

						<tr>
						      <th> 점수</th>
								<td><select name="morStar">
									<option>점수</option>
									<option value="5점">5점</option>
									<option value="4점">4점</option>
									<option value="3점">3점</option>
									<option value="2점">2점</option>
									<option value="1점">1점</option>
									<option value="0점">0점</option>
								</select></td>
						</tr>

						
						
						<tr>
							<td colspan="2"><input type="submit" value="등록" class="button button-sp">
							<input type="button" onclick="history.back()" value="뒤로" class="button button-sp"></td>
						</tr>
					</table>
					
				</form>


			<br> <br><br><br><br>


			</div>

			<br> <br>



		</div>
	</div>
	<!-- 리뷰 수정 end -->




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
	
	
	
	<script type="text/javascript" src="js/app.js"></script>
	
	
	
</body>
</html>