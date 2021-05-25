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
    </head>
    <style>  
		table, th, tr, td {border: 3px #fece1a solid; border-collapse: collapse;}
		th, td {padding: 5px;}
		#box{width : 60%;margin-left: 235px;}
		#footer{width : 100%}
    </style>
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
                            <li><a href="MemberJoin.jsp">회원가입</a></li>
                            <li class="active"><a href="MemberLogin.jsp">로그인</a></li>
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
       				<h2>로&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;그&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인</h2>
            </div>
        </div>
        
       
       <!-- 회원가입/로그인 버튼 -->
        <div class="section secondary-section">
            <div class="triangle"></div>
            <div class="container centered" style="text-align: center">
               <div class="row-fluid">
                            <div class="span5 contact-form centered" id="box">
                                <h3>로 그 인</h3>
                                <form id="contact-form" action="memberLogin" method="POST" style="text-align: center">
                                    <div class="control-group">
                                    <div class="controls">
                                    <input class="span12" type="text" name="momId" placeholder="* 아이디를 입력 해주세요" />
                                    </div></div>
                                    <div class="control-group">
                                    <div class="controls">
                                    <input class="span12" type="password" name="momPw" placeholder="* 비밀번호를 입력해주세요" />
                                    </div>
                                    </div>
                                    <div class="control-group">
                                    <div class="controls">
                                    <input type="submit" class="message-btn" value="로그인">
                                    <input type="button" onclick="location.href='index.jsp'" class="message-btn" value="뒤 로">
                                  
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
       
    </body>
    
  
   
</html>