<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | MovieView</title>
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
.button1234 {
	float: center;
	line-height: 20px;
	background-color: #FECE1A;
}

.buttonbox1 {left
	
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
	
	
	
	<!-- 영화 상세조회 start -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container">
			<div class=" title">
				<h1>영화 상세 보기</h1>
				<p>
					영화 다시보기 사이트를 찾고 계신가요?<br> 고된 업무와 지친 하루 뒤에 보는 영화와 드라마 만큼 편안하게
					충전할 수 있는 방법은 흔하지 않을 듯 합니다
				</p>
			</div>




			<div id="slidingDiv1" class="toggleDiv row-fluid single-project">
				<div class="span6" style="margin-left: 300px; margin-top: 50px;">
					${movie.moUrl}</div>
				<div class="span6" style="margin-left: 300px;">
					<div class="project-description">
						<div class="project-title clearfix">
							<h3>${movie.moTitle}</h3>

						</div>
						<div class="project-info">

							<div>
								<span>상영시간</span>${movie.moTime}</div>
							<div>
								<span>장&nbsp;&nbsp;&nbsp;&nbsp;르</span>${movie.moGenre}</div>
							<div>
								<span>개봉일</span>${movie.moDate}</div>
							<div>
								<span>출연진</span>${movie.moAct}</div><br>
						
								<span>줄거리</span>
								<p>${movie.moContents}</p>
						</div>


					</div>
				</div>
				<!-- 영화정보 설명 -->
				<div class="span6" style="margin-left: 300px;">
					<!--여기에 버튼  -->

					<c:choose>
						<c:when test="${sessionScope.loginId eq 'admin'}">
							<a href="movieModifyForm?moNum=${movie.moNum}"
								class="button button-sp">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="adminmovieList?page=${page}&limit=${limit}"
								class="button button-sp">관리자용영화목록보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="movieDelete?moNum=${movie.moNum}"
								class="button button-sp">삭제</a>
								
								<hr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
                        				<a href="reviewList?moNum=${movie.moNum}"
                           		class="button button-sp">리뷰</a>
						</c:when>

						<c:when test="${sessionScope.loginId != null}">

							<form action="movieSave" method="POST" name="movieSave"
								style="text-align: center;">
								<input type="hidden" name="mosId"
									value="${sessionScope.loginId}"> <input type="hidden"
									name="moNum" value="${movie.moNum}"> <input
									type="hidden" name="moTitle" value="${movie.moTitle}">
								<input type="hidden" name="moPic" value="${movie.moPic}">
								<input type="submit" value="♡" class="button button-sp">
								<input type="button"
									onclick="location.href='reviewList?moNum=${movie.moNum}'"
									class="button button-sp" value="리뷰">


							</form>


						</c:when>




					</c:choose>

					<br>
					<br>



				</div>
			</div>

		</div>
	</div>



	<!-- About us section end -->
	<div class="section secondary-section">
		<div class="container centered">
			<input type="button" value="목록보기" onclick="location.href='movieList'" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="뒤로가기" onclick="history.back(-1);" class="button">
		</div>
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
