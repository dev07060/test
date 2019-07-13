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
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<!-- BootStrap cdn 인터넷에서 끌어 사용-->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>


설문번호 : ${two.s_num}
<br>

<br>

<c:set var ="cnt" value="0"/>
<c:set var ="c" value="${0}"/>
<c:forEach var="i" items="${qList}">
	<c:if test="${i ne null}">
		Q.${cnt+1} : ${i} <br>
		<img src="/DotNet/save/${iList[c]}" border="0" width="203"
			height="192" class="rounded">
		<img src="/DotNet/save/${iList[c+1]}" border="0" width="203"
					height="192" class="rounded">
		<br>
		<c:set var="c" value="${c+2}"/>
	</c:if>
</c:forEach>


<a href="main.do">메인으로</a>

<script>
	var cnt = 0;
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
		});
	});
</script>

