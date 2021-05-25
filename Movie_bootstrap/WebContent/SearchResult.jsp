<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | MovieSearch</title>
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
.pic {
	width: 100%;
	height: 80%;
}
table tr, td {
	background-color: #181A1C;
	border: 5px #FECE1A solid;
	border-collapse: collapse;
	width: 400px;
}
td {
	height: 500px;
	padding: 15px;
}
.div1, .list {
	margin: auto;
	text-align: center;
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
								<li class="active"><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li><a href="memberList">관리자 회원 목록</a></li>
								<li><a href="adminmovieList">관리자 영화 목록</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>


						<c:when test="${loginId2.momSubD > 0}">
							<h3>${sessionScope.loginId}님 환영합니다. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구독중</h3> 
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
	
	
	
	
	<!-- 검색창 start -->
	<div class="section primary-section">
		<div class="container">
			<!-- Start title section -->
			<div class="title">
				<h1>검색하기</h1>
			</div>

			<div class="text-center">
				<form action="movieSearch" method="GET"> 
					<input type="text" name="search" class="span7"
						placeholder="영화제목으로 검색하기" style="height:36px;">&nbsp;&nbsp;&nbsp;
					<input type="submit" value="검색" class="button button-sp">
				</form>
				
			</div>

		</div>
	</div>
	<!-- 검색창 end -->


	<c:choose>
	
	<c:when test="${sessionScope.loginId eq 'admin'}">
	
	<!-- 관리자 접속 메인 영화 목록 -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container">
			<div class=" title">
				<h1>Movie</h1>
			</div>
			<ul class="nav nav-pills">
				<li><a href="movieList">전체</a></li>
				<li><a href="movieGenreList?moGenre=액션">액션</a></li>
				<li><a href="movieGenreList?moGenre=로맨스">로맨스</a></li>
				<li><a href="movieGenreList?moGenre=SF">SF</a></li>
				<li><a href="movieGenreList?moGenre=호러">호러</a></li>
				<li><a href="movieGenreList?moGenre=판타지">판타지</a></li>
				<li><a href="movieGenreList?moGenre=코미디">코미디</a></li>
				<li><a href="movieGenreList?moGenre=애니메이션">애니메이션</a></li>
			</ul>


			<!-- 관리자 접속 영화 목록화면 -->
			<table class="list">

				<tr>
					<c:forEach var="search" items="${movieSearch}" varStatus="status">
						
						<td><a href="movieView?moNum=${search.moNum}"><img
								alt="업로드 사진" src="fileUpload/${search.moPic}" class="pic"></a>
							<h3>
								<br> <strong>${search.moTitle}</strong>
							</h3></td>


						<c:if test="${status.count%3==0}">
							<tr></tr>
						</c:if>

					</c:forEach>
				</tr>

			</table>


		</div>
	</div>
	<!-- 메인 영화목록 end -->
	</c:when>
	
	
	
	
	<c:when test="${loginId2.momSubD > 0}">
	
	<!-- 구독중 메인 영화 목록 -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container">
			<div class=" title">
				<h1>Movie</h1>
			</div>
			<ul class="nav nav-pills">
				<li><a href="movieList">전체</a></li>
				<li><a href="movieGenreList?moGenre=액션">액션</a></li>
				<li><a href="movieGenreList?moGenre=로맨스">로맨스</a></li>
				<li><a href="movieGenreList?moGenre=SF">SF</a></li>
				<li><a href="movieGenreList?moGenre=호러">호러</a></li>
				<li><a href="movieGenreList?moGenre=판타지">판타지</a></li>
				<li><a href="movieGenreList?moGenre=코미디">코미디</a></li>
				<li><a href="movieGenreList?moGenre=애니메이션">애니메이션</a></li>
			</ul>


			<!-- 구독중 영화 목록화면 -->
			<table class="list">

				<tr>
					<c:forEach var="search" items="${movieSearch}" varStatus="status">
						
						<td><a href="movieView?moNum=${search.moNum}"><img
								alt="업로드 사진" src="fileUpload/${search.moPic}" class="pic"></a>
							<h3>
								<br> <strong>${search.moTitle}</strong>
							</h3></td>


						<c:if test="${status.count%3==0}">
							<tr></tr>
						</c:if>

					</c:forEach>
				</tr>

			</table>


		</div>
	</div>
	<!-- 메인 영화목록 end -->
	</c:when>
	
	
	<c:otherwise>
	
	<!-- 메인 영화 목록 -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container">
			<div class=" title">
				<h1>Movie</h1>
			</div>
			<ul class="nav nav-pills">
				<li><a href="movieList">전체</a></li>
				<li><a href="movieGenreList?moGenre=액션">액션</a></li>
				<li><a href="movieGenreList?moGenre=로맨스">로맨스</a></li>
				<li><a href="movieGenreList?moGenre=SF">SF</a></li>
				<li><a href="movieGenreList?moGenre=호러">호러</a></li>
				<li><a href="movieGenreList?moGenre=판타지">판타지</a></li>
				<li><a href="movieGenreList?moGenre=코미디">코미디</a></li>
				<li><a href="movieGenreList?moGenre=애니메이션">애니메이션</a></li>
			</ul>



			<!-- 영화 목록화면 -->
			<table class="list">

				<tr>
					<c:forEach var="search" items="${movieSearch}" varStatus="status">
						
						<td><img alt="업로드 사진" src="fileUpload/${search.moPic}" class="pic">
							<h3>
								<br> <strong>${search.moTitle}</strong>
							</h3></td>


						<c:if test="${status.count%3==0}">
							<tr></tr>
						</c:if>

					</c:forEach>
				</tr>

			</table>


		</div>
	</div>
	<!-- 메인 영화목록 end -->
	
	</c:otherwise>
	
	</c:choose>






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
</html>