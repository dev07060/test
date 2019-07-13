<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNavbar">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
	</nav>
	<div class="navbar-collapse collapse w-100 order-1 order-md-0 "
		id="myNavbar">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="/DotNet/main.do">메인&nbsp;&nbsp;&nbsp;</a></li>
			<li class="nav-item"><a class="nav-link " href="#">보조</a></li>
		</ul>
	</div>

	<div class="mx-auto">
		<a class="navbar-brand" href="/DotNet/main.do"><h1 id="logo">.Net</h1> </a>
	</div>
	<div class="navbar-collapse collapse w-100 order-3 " id="myNavbar">
		<ul class="navbar-nav ml-auto navbar-right">
		
		<c:choose>
			<c:when test="${not empty sessionScope.memId }">
				<li>
				${sessionScope.memId} 님&nbsp;&nbsp;&nbsp;
				</li>
				<li><a href="/DotNet/mypage.do"><span class="glyphicon glyphicon-user"></span>
					My Page&nbsp;&nbsp;&nbsp;
				</a></li>
				<li><a href="main.do?logout=true"><span class="glyphicon glyphicon-log-out"></span>
					 Logout&nbsp;&nbsp;&nbsp;
				</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/DotNet/login.do"><span class="glyphicon glyphicon-log-in"></span>
					 Login&nbsp;&nbsp;&nbsp;
				</a></li>
				
				<li><a href="/DotNet/signup.do"><span class="glyphicon glyphicon-user"></span>
						 Sign Up&nbsp;&nbsp;&nbsp;
				</a></li>
			</c:otherwise>
		
		</c:choose>
			
			
			
		</ul>
	</div>