<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set> 

<style type="text/css">
.side_list{
	position: absolute;
	top:35px;
	left:0;
	bottom: 0;
	border-top: 1px solid #ccc;
	width: 200px;
	height: 500px;
	font-size: 20px;
	line-height:0px;
}
.side_link{
	display: block;
	text-decoration:none;
	text-align:center;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	padding: 40px 0;
	border-bottom: 1px solid #ccc;
	
}
.background{
	background: #4EE2EC;
	color: #FFFFFF;
	
}
.title{
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	height: 60px;
}
.title > h3{
	margin-top: 0px;
}
</style>
    
<div class="side_list">
	<div class="title">
		
		<h3>${name }의<br>프로젝트 번호:${project.pNo}</h3>
	</div>
	<a href="/admin/project/view?pNo=${project.pNo}" class="side_link background">펀딩준비</a>
	
	<c:choose>
		<c:when test="${project.pState ne 'Y' }">
			<a href="#" id="news" class="side_link">새소식&nbsp;<i class="fas fa-lock"></i></a>
			<a href="#" id="open" class="side_link">오픈예정&nbsp;<i class="fas fa-lock"></i></a>
			<a href="#" id="support" class="side_link">서포터&nbsp;<i class="fas fa-lock"></i></a>
			<a href="#" id="funding" class="side_link">펀딩현황&nbsp;<i class="fas fa-lock"></i></a>
		</c:when>
		<c:otherwise>
			<c:out value="${contextPath }"></c:out>
			<a href="/admin/news/list?pNo=${project.pNo}" id="news" class="side_link">새소식&nbsp;<i class="fas fa-lock-open"></i></a>
			<a href="#" id="open" class="side_link">오픈예정&nbsp;<i class="fas fa-lock-open"></i></a>
			<a href="#" id="support" class="side_link">서포터&nbsp;<i class="fas fa-lock-open"></i></a>
			<a href="#" id="funding" class="side_link">펀딩현황&nbsp;<i class="fas fa-lock-open"></i></a>
		</c:otherwise>
	</c:choose>
	
</div>