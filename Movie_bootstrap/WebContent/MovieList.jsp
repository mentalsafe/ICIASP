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


	<!-- Start 배너 -->
	<div id="home">
		<!-- Start cSlider -->
		<div id="da-slider" class="da-slider">
			<div class="triangle"></div>
			<!-- mask elemet use for masking background image -->
			<div class="mask"></div>
			<!-- All slides centred in container element -->
			<div class="container">
				<!-- Start 첫번째 슬라이드 -->
				<div class="da-slide">
					<h2 class="fittext2">새로나올 영화</h2>
					<h4>
						<b>소울</b>
					</h4>
					<p>뉴욕에서 음악 선생님으로 일하던 ‘조’는 꿈에 그리던 최고의 밴드와 재즈 클럽에서 연주하게 된 그 날,
						예기치 못한 사고로 영혼이 되어 ‘태어나기 전 세상’에 떨어진다.</p>

					<div class="da-img">
						<img src="img/소울.jpg" alt="소울" width="220" height="250">
					</div>
				</div>
				<!-- End 첫번째 슬라이드 -->
				
				<!-- Start 두번째 슬라이드 -->
				<div class="da-slide">
					<h2>새로나올 영화</h2>
					<h4>
						<b>미나리</b>
					</h4>
					<p>낯선 미국, 아칸소로 떠나온 한국 가족.<br>가족들에게 뭔가 해내는 걸 보여주고 싶은 아빠 '제이콥'(스티븐
						연)은 자신만의 농장을 가꾸기 시작하고 엄마 '모니카'(한예리)도 다시 일자리를 찾는다.</p>

					<div class="da-img">
						<img src="img/미나리.jpg" alt="미나리" width="220" height="250">
					</div>
				</div>
				<!-- End 두번째 슬라이드 -->
				
				<!-- Start 세번째 슬라이드 -->
				<div class="da-slide">
					<h2>영화 추천</h2>
					<h4><br><b>어떤 영화를 볼지 고민하는 <br><br>그대들을 위한 영화 추천리스트</b></h4>
					<button onclick="window.open('movieRandomList', 'MovieRandom', 'width=800,height=600');"
									class="da-link button">영화추천</button>
					
					<div class="da-img">
						<img src="images/Slider03.png" width="320" alt="image03">
					</div>
				</div>
				<!-- End 세번째 슬라이드 -->
				
				<!-- Start cSlide navigation arrows -->
				<div class="da-arrows">
					<span class="da-arrows-prev"></span> <span class="da-arrows-next"></span>
				</div>
				<!-- End cSlide navigation arrows -->
			</div>
		</div>
	</div>
	<!-- End 배너 -->


	<!-- 검색창 start -->
	<div class="section primary-section" id="service">
		<div class="container">
			<!-- Start title section -->
			<div class="title">
				<h1>검색하기</h1>
			</div>

			<div class="text-center">
				<form action="movieSearch" method="GET">
					<input type="text" name="search" class="span7"
						placeholder="영화제목으로 검색하기" style="height: 36px;">&nbsp;&nbsp;&nbsp;
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
					<c:forEach var="movie" items="${moList}" varStatus="status">
						
						<td><a href="movieView?moNum=${movie.moNum}"><img
								alt="업로드 사진" src="fileUpload/${movie.moPic}" class="pic"></a>
							<h3>
								<br> <strong>${movie.moTitle}</strong>
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
					<c:forEach var="movie" items="${moList}" varStatus="status">
						
						<td><a href="movieView?moNum=${movie.moNum}"><img
								alt="업로드 사진" src="fileUpload/${movie.moPic}" class="pic"></a>
							<h3>
								<br> <strong>${movie.moTitle}</strong>
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
					<c:forEach var="movie" items="${moList}" varStatus="status">
						
						<td><img alt="업로드 사진" src="fileUpload/${movie.moPic}" class="pic">
							<h3>
								<br> <strong>${movie.moTitle}</strong>
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