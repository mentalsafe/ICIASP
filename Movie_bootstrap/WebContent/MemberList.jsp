<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | MemberList</title>
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



	<!-- 회원 목록 -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container" style="text-align: center">
			<div class=" title">
				<h1>관리자 회원 목록</h1>
			</div>
			<br>
			<div class="span9 contact-form centered" style="border-radius: 20px">

				<table style="text-align: center; color: black">

					<thead>

						<tr>
							<th style="width: 10%">순서</th>
							<th style="width: 20%">이름</th>
							<th style="width: 30%">아이디</th>
							<th style="width: 20%">생년월일</th>
							<th style="width: 20%">회원탈퇴</th>
						</tr>

					</thead>

					<tbody>

						<c:forEach var="member" items="${momList}" varStatus="num">
							<tr>
								<td>${num.count}</td>
								<td>${member.momName}</td>
								<td><a
									href="memberView?momId=${member.momId}&page=${paging.page}&limit=${paging.limit}">${member.momId}</a></td>
								<td>${member.momBirth}</td>
								<td><button onclick="location.href='memberDeleteAdmin?momId=${member.momId}'">탈퇴</button></td>
							</tr>

						</c:forEach>

						<tr>
							<td colspan="5" style="text-align: right"><select
								name="limit" id="limit" onchange="funSel()">
									<option>회원목록 갯수</option>
									<option value="3">3개씩</option>
									<option value="5">5개씩</option>
									<option value="10">10개씩</option>
							</select></td>
						</tr>

					</tbody>

				</table>

			</div>

			<br> <br>

			<!-- 페이징 처리 -->
			<div>

				<!-- [이전] 에 대한 페이징 처리 -->
				<c:if test="${paging.page<=1}">
					<button class="button" style="line-height: 5px; height: 35px">이전</button>&nbsp;&nbsp;&nbsp;</c:if>

				<c:if test="${paging.page>1}">
					<a href="memberList?page=${paging.page-1}&limit=${paging.limit}">
						<button class="button" style="line-height: 5px; height: 35px">이전</button>
					</a>&nbsp;&nbsp;&nbsp;
				</c:if>


				<!-- 페이징 숫자에 대한 페이징 처리 -->
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="i" step="1">
					<c:choose>

						<c:when test="${i eq paging.page}">
							&nbsp;&nbsp;${i}&nbsp;&nbsp;
						</c:when>

						<c:otherwise>
							<a href="memberList?page=${i}&limit=${paging.limit}"><b>&nbsp;&nbsp;${i}&nbsp;&nbsp;</b></a>
						</c:otherwise>

					</c:choose>
				</c:forEach>


				<!-- [다음] 에 대한 페이징 처리 -->
				<c:if test="${paging.page>=paging.maxPage}">&nbsp;&nbsp;&nbsp;<button
						class="button" style="line-height: 5px; height: 35px">다음</button>
				</c:if>

				<c:if test="${paging.page<paging.maxPage}">
					<a href="memberList?page=${paging.page+1}&limit=${paging.limit}">&nbsp;&nbsp;&nbsp;
						<button class="button" style="line-height: 5px; height: 35px">다음</button>
					</a>
				</c:if>

			</div>
			<!-- 페이징처리 끝 -->
			<br> <br> <br> <br> <br> <br> <br>

		</div>
	</div>
	<!-- 회원 목록 end -->




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