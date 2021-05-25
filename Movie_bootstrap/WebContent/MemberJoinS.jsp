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
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <!-- Load css styles -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
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
		table, th, tr, td {border: 3px #fece1a solid; border-collapse: collapse;}
		th, td {padding: 5px;}
		#box{width : 60%;margin-left: 235px;}
		#footer{width : 100%}
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
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <i class="icon-menu"></i>
                    </button>
                    <!-- Main navigation -->
                    <div class="nav-collapse collapse pull-right">
                        <ul class="nav" id="top-navigation">
                            <li><a href="index.jsp">Home</a></li>
                            <li class="active"><a href="MemberJoin.jsp">회원가입</a></li>
                            <li><a href="MemberLogin.jsp">로그인</a></li>
                        </ul>
                    </div>
                    <!-- End main navigation -->
                </div>
            </div>
        </div>
        <!-- Start home section -->
        <div id="home">
         
           
        </div>
        <!-- End home section -->
        
       <!-- 로고 사진 -->
        <div class="section primary-section" id="service">
            <div class="container" style="text-align:center">
                <!-- Start title section -->
                <div class="title">
                    <h1>What do you want to watch 와츄</h1>
                </div>
       				<h2>회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입</h2>
            </div>
        </div>
        
       
       <!-- 회원가입/로그인 버튼 -->
        <div class="section secondary-section">
            <div class="triangle"></div>
            <div class="container centered">
            <div class="row-fluid">
			<div class="span5 contact-form centered" id="box">
			 <h3>회 원 가 입</h3>
			<form id="contact-form" action="memberJoin" name="joinForm" style="text-align: center">
			<div class="control-group">
			<div class="controls">
			<h5 style="color:black;">아이디<input type="text" name="momId" id="momId" class="span12" value="${momId}">
			<br><span id="idResult"></span></h5></div></div>
			
			<div class="control-group">
			<div class="controls">
			<h5 style="color:black;">비밀번호<input type="password" name="momPw" id="momPw" class="span12" placeholder="* 비밀번호를 입력 해주세요" onkeyup="PwCheck()"></h5></div></div>
			<div id="pwResult" style="color:black;"></div>
			
			<div class="control-group">
			<div class="controls">
			<h5 style="color:black;">이  름<input type="text" name="momName" id="momName" class="span12" placeholder="* 이름을 입력 해주세요"></h5></div></div>
			
			<div class="control-group">
			 <div class="controls">
			<h5 style="color:black;">생년월일 <input type="date" name="momBirth" id="momBirth" class="span12"></h5></div></div>
			
			<div class="control-group">
			<div class="controls">
			<h5 style="color:black;">남자: <input type="radio" name="momGender" value="남자">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여자: <input type="radio" name="momGender" value="여자"></h5></div></div>
			
			<div class="control-group">
			<div class="controls">
			<h5 style="color:black;">이메일<input type="email" name="momEmail" id="momEmail" class="span12"></h5></div></div>
			
			<div class="control-group">
			<div class="controls">
			<h5 style="color:black;">전화번호<input type="text" name="momPhone" id="momPhone" class="span12"></h5></div></div>
			
			<div class="control-group">
			<div class="controls">
			<input type="button" onclick="IdCheck()" class="message-btn" value="아이디 중복확인">
			<input type="button" onclick="submitForm()" class="message-btn" value="회원가입">
			<input type="reset"class="message-btn" value="다시작성">
			<input type="button" onclick="location.href='index.jsp'" class="message-btn" value="뒤 로" >
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
                    <div class="title">
                    </div>
                    <div class="row"> 
                    </div>
                </div>
            </div>

         <div class="footer">
            <p id="footer"><i class="fa fa-love"></i></p></div>
        <!-- ScrollUp button start -->
        <div class="scrollup">
            <a href="#">
                <i class="icon-up-open"></i>
            </a>
        </div>

        <!-- ScrollUp button start -->
        <div class="scrollup">
            <a href="#">
                <i class="icon-up-open"></i>
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
        <script async="" defer="" type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=initializeMap"></script>
        <!-- css3-mediaqueries.js for IE8 or older -->
        <!--[if lt IE 9]>
            <script src="js/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="js/app.js"></script>
	    </body>
	    <script>
		var checkId = true;
		
		var momId = document.getElementById("momId");
		var idResult = document.getElementById("idResult");
		idResult.style.color = "#0000ff";
		idResult.innerHTML="사용가능한 아이디 입니다!";
		
		console.log(checkId);
		
		function IdCheck() {
			var momId = document.getElementById("momId");
			var idResult = document.getElementById("idResult");

			if (momId.value <= "") {
				idResult.style.color = "#ff0000";
				idResult.innerHTML = "아이디를 입력해 주세요!";
			} else {
				location.href="idCheck?momId="+momId.value;
			}
		}

		function PwCheck() {
			var momPw = document.getElementById("momPw");
			var pwResult = document.getElementById("pwResult");

			var momPwVal = momPw.value;

			var num = momPwVal.search(/[0-9]/g);
			var eng = momPwVal.search(/[a-z]/ig);
			var spe = momPwVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			if (momPwVal.length <= 0) {
				pwResult.innerHTML = "";
				return false;
			} else if (momPwVal.length<8 || momPwVal.length>10) {
				pwResult.style.color = "#ff0000";
				pwResult.innerHTML = "8~10자리 이내로 입력해주세요!";
				return false;
			} else if (momPwVal.search(/\s/) != -1) {
				pwResult.style.color = "#ff0000";
				pwResult.innerHTML = "비밀번호는 공백 없이 입력해주세요!";
				return false;
			} else if (num < 0 || eng < 0 || spe < 0) {
				pwResult.style.color = "#ff0000";
				pwResult.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요!";
				return false;
			} else {
				pwResult.style.color = "#0000ff";
				pwResult.innerHTML = "적절한 비밀번호 입니다!";
				return true;
			}

		}
		

		var momGenderArray = document.getElementsByName("momGender");

		var momName = document.getElementById("momName");
		var momBirth = document.getElementById("momBirth");
		var momEmail = document.getElementById("momEmail");


		function submitForm() {
			
			var momGender = "";
			
			for(var i=0; i<momGenderArray.length; i++){
				if(momGenderArray[i].checked==true){
					momGender = momGenderArray[i].value;
				}
			}
			
			console.log(momGender);
			
			
			if (!checkId) {
				alert('아이디를 확인해주세요!');
			} else if (!PwCheck()) {
				alert('비밀번호를 확인해주세요!');
			} else if (momName.value == "") {
				alert('이름을 입력해주세요!');
			} else if (momBirth.value == "") {
				alert('생년월일을 입력해주세요!');
			} else if (momGender=="") {
				alert('성별을 입력해주세요!');
			} else if (momEmail.value == "") {
				alert('이메일을 입력해주세요!');			
			} else {
				var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				 
				if(!emailRule.test(momEmail.value)) {            
					alert('이메일을 확인해주세요!!');
				} else {
					joinForm.submit();	
				}			
			}

		}

		</script>
</html>