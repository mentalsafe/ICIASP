<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | MemberModify</title>
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
td {
	padding: 3px;
	color: black;
}

.momId {
	margin-left: 50px;
}

#box {
	width: 60%;
	margin-left: 235px;
}

#footer {
	width: 100%
}

#idAlign {
	text-align: left;
}

#idAlign2 {
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
								<li><a href="movieList">Home</a></li>
								<li class="active"><a href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
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
								<li><a href="movieList">Home</a></li>
								<li class="active"><a
									href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
								<li><a href="movieSaveList?mosId=${sessionScope.loginId}">내가 찜한 목록 보기</a></li>
								<li><a href="Logout">로그아웃</a></li>
							</ul>
						</c:when>


						<c:when test="${sessionScope.loginId != null}">

							<h3>${sessionScope.loginId}님 환영합니다.</h3>

							<ul class="nav" id="top-navigation">
								<li><a href="movieList">Home</a></li>
								<li class="active"><a
									href="memberView?momId=${sessionScope.loginId}">마이페이지</a></li>
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
	<!-- Start home section -->
	<div id="home"></div>
	<!-- End home section -->

	

	<!-- 회원가입/로그인 버튼 -->
	<div class="section secondary-section">
		<div class="triangle"></div>
		<div class="container centered">
			<div class="row-fluid">
				<div class="title">
				<h1>${modify.momId}님 회원정보 수정</h1>
				</div>
				<br>
				<div class="span5 contact-form centered" id="box">
					
					<form id="contact-form" action="memberModify" method="POST" style="text-align: center" name="modiForm">
						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									<span id=idAlign>아이디 : </span> <span id=idAlign2>${modify.momId}</span>
									<input type="hidden" name="momId" value="${modify.momId}">
								</h5>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									현재 비밀번호 : <input type="password" name="momPw" id="momPw"
										class="span12" placeholder="* 비밀번호를 입력 해주세요">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									변경할 비밀번호 : <input type="password" name="momPw" id="momPw"
										class="span12" placeholder="* 비밀번호를 입력 해주세요">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									이 름 : <input type="text" name="momName" id="momName"
										class="span12" placeholder="${modify.momName}">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									생년월일 : <input type="date" name="momBirth" id="momBirth"
										class="span12" placeholder="${modify.momBirth}">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									남자 : <input type="radio" name="momGender" value="남자">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여자:
									<input type="radio" name="momGender" value="여자">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									이메일 : <input type="email" name="momEmail" id="momEmail"
										class="span12" placeholder="${modify.momEmail}">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									전화번호 : <input type="text" name="momPhone" id="momPhone"
										class="span12">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<input type="button" value="정보수정" onclick="memberModify()" class="message-btn"> 
								<input type="reset" class="message-btn" value="다시작성">
							</div>
						</div>
					</form>
					
				</div>
				
				
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
			<i class="fa fa-love"></i>
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

<script>
		function memberModify() {
			var password = '${modify.momPw}';
			var passwordConfirm = document.getElementById("momPw").value;

			if (password == passwordConfirm) {
				modiForm.submit();
			} else {
				alert('비밀번호가 틀립니다.');
				location.href="memberModifyForm?momId=${modify.momId}";
			}
		}
</script>

</html>