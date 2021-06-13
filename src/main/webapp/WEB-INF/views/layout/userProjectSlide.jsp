<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="requstUri" value="${requestScope['javax.servlet.forward.request_uri']}"></c:set> 
<c:set var="uri" value="${fn:split(requstUri,'/')}"></c:set>

<script type="text/javascript">
$(document).ready(function(){
	
	<c:forEach var="info" items="${uri }" varStatus="url">
		console.log("${info }");
		console.log("${url.count}");
		<c:if test="${url.count eq 3 }">
			<c:choose>
				<c:when test="${info eq 'news'}">$( '#news' ).addClass( 'background' )</c:when>
				<c:when test="${info eq 'open'}">$( '#open' ).addClass( 'background' )</c:when>
				<c:when test="${info eq 'supporter'}">$( '#supporter' ).addClass( 'background' )</c:when>
				<c:when test="${info eq 'funding'}">$( '#funding' ).addClass( 'background' )</c:when>
				<c:otherwise>$( '#project' ).addClass( 'background' )</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
	
})

</script>


<style type="text/css">
.side_list{
	position: absolute;
	top:180px;
	left:140px;
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
	
	
	<c:choose>
		<c:when test="${project.pState ne 'Y' }">
			<a href="/user/maker/project/view?pNo=${project.pNo}" id="project" class="side_link background">펀딩준비</a>
			<a href="#" id="news" class="side_link">새소식&nbsp;<i class="fas fa-lock"></i></a>
			<a href="#" id="open" class="side_link">오픈예정&nbsp;<i class="fas fa-lock"></i></a>
			<a href="#" id="supporter" class="side_link">서포터&nbsp;<i class="fas fa-lock"></i></a>
			<a href="#" id="funding" class="side_link">펀딩현황&nbsp;<i class="fas fa-lock"></i></a>
		</c:when>
		<c:otherwise>
			<a href="/user/maker/project/view?pNo=${project.pNo}" id="project" class="side_link">펀딩준비</a>
			<a href="/user/maker/news/list?pNo=${project.pNo}" id="news" class="side_link">새소식&nbsp;<i class="fas fa-lock-open"></i></a>
			<a href="/user/maker/open/requirement?pNo=${project.pNo}" id="open" class="side_link">오픈예정&nbsp;<i class="fas fa-lock-open"></i></a>
			<a href="/user/maker/supporter/list?pNo=${project.pNo}" id="supporter" class="side_link">서포터&nbsp;<i class="fas fa-lock-open"></i></a>
			<a href="/user/maker/funding/view?pNo=${project.pNo}" id="funding" class="side_link">펀딩현황&nbsp;<i class="fas fa-lock-open"></i></a>
		</c:otherwise>
	</c:choose>
	
</div>