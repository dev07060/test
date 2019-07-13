<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>설문결과</title>
		<%@ include file="setting_survey.jsp" %>
	
		<link rel="stylesheet" href="bootstrap.css">
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<link
			href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap"
			rel="stylesheet">
		<!-- style_dotnet.csa -->
		<link rel="stylesheet" type="text/css" href="style_dotnet.css" />
		<script type="text/javascript" src="jquery-3.4.1.js"></script>
		<script type="text/javascript" src="bootstrap.bundle.js"></script>
		
		<style>
		.navbar-default {
			background-color: rgba(227, 179, 255, 0.938);
			height: 100px;
		}
		
		#logo {
			font-family: 'Sniglet', cursive;
			color: white;
			font-size: 80px;
			margin-top: 0px;
		}
		
		h2 #cardExp {
			font-family: 'Sniglet', cursive;
			color: #6fb936;
			font-size: 20px;
			align: right;
		}
		
		a.navbar-brand {
			margin-bottom: 50px;
		}
		
		h1 {
			margin: 30px;
			font-size: 50px;
		}
		/* .container  {
			width: 100%;
		 	height: 70%;
			margin: 40px auto;
	 		background: red;
		}
		.centered {
		  position: relative;
		  display: inline-block;
		 
		  width: 50%;
		  padding: 1em;
		  margin: 40px auto;
		  background: orange;
		} */
		</style>
	</head>
	
	
	<body>
	<!-- 상단 바 -->
	
	<nav class="navbar navbar-expand-md navbar-default">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->
	
		<h2>설문결과</h2>
		참여자 : ${sessionScope.memId} <br>
		point : ${point}포인트를 획득하셨습니다. <br>
		선택정보 : <br>
		<c:forEach var="cho" items="${choiceList}">
			${cho} <br>
		</c:forEach>
		<br>
	</body>
</html>