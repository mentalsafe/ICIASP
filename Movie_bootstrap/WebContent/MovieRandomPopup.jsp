<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovieRandom</title>
<style>
table tr, td {
	border: 1px black solid;
	border-collapse: collapse;
	width: 500px;
}
td {
	height: 400px;
	padding: 15px;
}
.list {
	text-align: center;
	margin: auto;
}
img {
	width : 100%;
	height : 80%;
}
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<br><h1 style="text-align:center">영화 추천</h1>
	<h4 style="text-align:center">어떤 영화를 볼지 고민하는 그대들을 위한 영화 추천리스트</h4>
	

			<!-- 영화 추천 목록 화면 -->
			<table class="list">

				<tr>
					<c:forEach var="random" items="${moRandomList}">
						
						<td><img alt="업로드 사진" src="fileUpload/${random.moPic}"><br><br>${random.moTitle}</td>
					
					</c:forEach>
				</tr>
				
			</table>
	 
</body>


</html>