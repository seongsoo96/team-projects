<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/adminHeader.css">
<script type="text/javascript">
$(document).ready(function(){
	$("#hamburger").click(function(){
		if($('#hamburger').prop("checked")){
			console.log('move');
			$("#content").addClass('move');
			$("#content").removeClass('back');
			$("footer").addClass('move');
			$("footer").removeClass('back');
		}else{
			console.log('back');
			$("#content").addClass('back');
			$("#content").removeClass('move');
			$("footer").addClass('back');
			$("footer").removeClass('move');
		}
	});
});
</script>

</head>
<body>
<header>
	<!-- 로고 -->
	<div id="navigation">
	<input id="hamburger" type="checkbox" /><label for="hamburger">&equiv;</label>
	  <nav>
	    <div>Core</div>
	    <ul>
	      <li><a href="/admin/main">Dashboard</a></li>
	    </ul>
	    <div>List</div>
	    <ul>
	      <li><a href="#">사용자 관리</a></li>
	      <li><a href="#">공지사항 관리</a></li>
	      <li><a href="#">게시판 관리</a></li>
	      <li><a href="/admin/project/list">프로젝트 관리</a></li>
	      <li><a href="#">신고 관리</a></li>
	    </ul>
	</nav>
	<div style="width:200px;">
	<a href = "/admin/main"><img src="/resources/img/test1.png" width="100" height="40" alt="PpeonFun"  title="PpeonFun"> </a>
	</div>
	<!--메인 검색창  -->
	<div>
	<form action="/search" method="get" id ="form" >
		<input type="text" id="keyword" name="keyword" placeholder="어떤 프로젝트를 찾고 계신가요"/>
		<button><i class="fas fa-search"></i></button>
	</form>
	</div>
	
	<!-- 로그인 -->
	<c:choose>
		<c:when test="${empty mNo }">
			<ul class="hdropdown right">
				<li>
					<a href="#" style="color:black;" class="fa fa-user fa-3x"></a>
					<ul>
						<li><a href="/user/member/loginForm">로그인</a></li>
						<li><a href="#">프로젝트 펀딩하기</a></li>
					</ul>
				</li>
			</ul>	
		</c:when>
		<c:otherwise>
			<ul class="hdropdown right">
				<li>
					<a href="#" class="fa fa-user fa-3x"></a>
					<ul>
						<li><a href="/user/member/logout">로그아웃</a></li>
						<li><a href="#">프로젝트 펀딩하기</a></li>
					</ul>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
	</div>
</header>