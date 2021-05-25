<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | MovieModify</title>
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



	<!-- 영화 정보 수정 -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container" style="text-align: center">
			<div class=" title">
				<h1>영화 수정하기</h1>
			</div>
			<br>
			<div class="span9 contact-form centered" style="border-radius: 20px">

				<form action="movieModify" method="POST"
					enctype="multipart/form-data">
					<table style="color: black">

						<tr>
							<th>영화제목</th>
							<td><input type="text" name="moTitle" class="span5" placeholder="${modify.moTitle}"> 
								<input type="hidden" name="moNum" value="${modify.moNum}"></td>
						</tr>


						<tr>
							<th>영화사진</th>
							<td><input type="file" name="moPic" class="span5"></td>
						</tr>

						<tr>
							<th>영상주소</th>
							<td><input type="text" name="moUrl" class="span4">&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" onclick="youtube()" value="검색하기"></td>
						</tr>

						<tr>
							<th>줄거리</th>
							<td><textarea rows="10" cols="20" name="moContents" class="span5"></textarea></td>
						</tr>

						<tr>
							<th>상영시간</th>
							<td><input type="text" name="moTime" class="span5"></td>
						</tr>

						<tr>
							<th>장르</th>
							<td><select name="moGenre" class="span5">
									<option>영화 장르</option>
									<option value="액션">액션</option>
									<option value="로맨스">로맨스</option>
									<option value="SF">SF</option>
									<option value="호러">호러</option>
									<option value="판타지">판타지</option>
									<option value="코미디">코미디</option>
									<option value="애니메이션">애니메이션</option>
							</select></td>
						</tr>

						<tr>
							<th>개봉일</th>
							<td><input type="date" name="moDate" class="span5"></td>
						</tr>

						<tr>
							<th>출연진</th>
							<td><input type="text" name="moAct" class="span5"></td>
						</tr>

						<tr>
							<td colspan="2"><input type="submit" value="등록" class="button button-sp">
									<input type="reset" value="다시 작성" class="button button-sp"></td>
						</tr>
					</table>
				</form>





			</div>

			<br> <br>



		</div>
	</div>
	<!-- 영화 정보 수정 end -->




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
	function youtube(){
		
		window.open('https://www.youtube.com','_blank','width=1500,height=700');
		
	}

</script>

</html>