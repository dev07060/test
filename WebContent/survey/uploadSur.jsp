<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결과</title>
<!-- 자바스크립트 -->

<!-- JQuery -->
<!-- <script type="text/javascript" src="/DotNet/jquery-3.4.1.js"></script> -->
<!-- <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

BootStrap cdn 인터넷에서 끌어 사용
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script> -->

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

	<!-- 상단 바 -->
	
	<nav class="navbar navbar-expand-md navbar-default">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->

설문번호 : ${two.s_num}
<br>

<c:set var="c" value="${0}"/>
<c:set var="size" value="${0}"/>
<c:forEach var="i" items="${qList}" varStatus="ii">
	<c:if test="${i ne null}">
		<div class="${ii.count}">
			<c:set var="size" value="${ii.count}"/>
			Q1 : ${i} <br>
			<img src="/DotNet/save/${iList[c]}" border="0" width="203"
				height="192" class="rounded" name="1">
			<img src="/DotNet/save/${iList[c+1]}" border="0" width="203"
				height="192" class="rounded" name="2">
			<br>
			<c:set var="c" value="${c+2}"/>
		</div>
	</c:if>
</c:forEach>
<input type="submit" value="완료">

<form action="uploadResult.do" method="post" name="choiceInfo">
	<c:forEach var="ii" begin="${1}" end="${size}">
		<input type="hidden" name="q${ii}">
	</c:forEach>
	<input type="hidden" name="s_num" value="${two.s_num}">
	<input type="hidden" name="point" value="${boardDto.point}">
</form>

<a href="main.do" class="tomain">메인으로</a>

<script>
	var q_num = 0;
	$(document).ready(function() {
		$("img").mouseenter(function() {
			$(this).css("opacity", "0.7");
		});
		$("img").mouseleave(function() {
			$(this).css("opacity", "1");
		});
		$("img").click(function() {
			$(this).fadeOut(100).fadeIn(100).animate({
				opacity : '1'
			});
			q_num = $(this).parent().attr("class");
			// 선택정보 저장
			localStorage.setItem("q"+q_num, $(this).attr("name"));
		});
		$("input:submit").click(function() {
			var params = document.choiceInfo;
			var size = ${size}
			//alert("size = " + size);
			for(var i=1; i <= size; i++) {
				$("input[name=q"+i+"]").attr("value", localStorage.getItem("q"+i));
				//alert("q"+i+"="+localStorage.getItem("q"+i)); 
			}
		
			params.submit();
			localStorage.clear();
		});
		$(".tomain").on(
			"click",
			function(){
				localStorage.clear();
			}
		);
	});
</script>

