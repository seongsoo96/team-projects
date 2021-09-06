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
		<c:if test="${url.count eq 2 }">
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
	top:20px;
	left:-80px;
	bottom: 0;
/* 	border-top: 1px solid #ccc; */
	width: 200px;
	height: 500px;
	font-size: 20px;
	line-height:0px;
}
.side_link{
	display: block;
	text-decoration:none;
/*  	text-align:center;  */
/* 	border-left: 1px solid #ccc; */
/* 	border-right: 1px solid #ccc; */
	padding: 10px 0;
/* 	border-bottom: 1px solid #ccc; */
	
}
.title{
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	height: 60px;
}
.title > h3{
	margin-top: 0px;
}
.menuContainer > ul {
	list-style-type: none;
	padding-left: 0;
}
.menuContainer > ul > li {
	list-style: none;
	line-height: 60px;
}

.menuContainer > ul > li > a {
	display: block;
	position: relative;
	cursor: pointer;
	padding: 16px 24px;
	font-size: 17px;
	font-weight: 700;
	text-decoration: none;
 	color: rgba(0,0,0,.54);
}
.menuContainer > ul > li > a > svg {
	position: absolute;
	right: 0;
	margin-right: 30px;
	top: 30px;
}

.menuContainer > ul > li > .background{
	background: #4EE2EC;
	color: #FFFFFF;
	
}

h4 {
	padding-bottom: 40px;
}

</style>
    
<div class="side_list">
	<%-- <div class="title">
		
		<h3>${name }의<br>프로젝트 번호:${project.pNo}</h3>
	</div> --%>
	
	
	<c:choose>
		<c:when test="${project.pState ne 'Y' }">
			<nav class="menuContainer">
				<ul>
					<li><h4>${name }의<br>프로젝트 번호:${project.pNo}</h4></li>
					<li><a href="/admin/project/view?pNo=${project.pNo}" id="project" class="side_link background">펀딩준비</a></li>
					<li><a href="#" id="news" class="side_link">새소식&nbsp;<i class="fas fa-lock"></i></a></li>
					<li><a href="#" id="open" class="side_link">오픈예정&nbsp;<i class="fas fa-lock"></i></a></li>
					<li><a href="#" id="supporter" class="side_link">서포터&nbsp;<i class="fas fa-lock"></i></a></li>
					<li><a href="#" id="funding" class="side_link">펀딩현황&nbsp;<i class="fas fa-lock"></i></a></li>
				</ul>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="menuContainer">
				<ul>
					<li><a href="/admin/project/view?pNo=${project.pNo}" id="project" class="side_link">펀딩준비</a></li>
					<li><a href="/admin/news/list?pNo=${project.pNo}" id="news" class="side_link">새소식&nbsp;<i class="fas fa-lock-open"></i></a></li>
					<li><a href="/admin/open/requirement?pNo=${project.pNo}" id="open" class="side_link">오픈예정&nbsp;<i class="fas fa-lock-open"></i></a></li>
					<li><a href="/admin/supporter/list?pNo=${project.pNo}" id="supporter" class="side_link">서포터&nbsp;<i class="fas fa-lock-open"></i></a></li>
					<li><a href="/admin/funding/view?pNo=${project.pNo}" id="funding" class="side_link">펀딩현황&nbsp;<i class="fas fa-lock-open"></i></a></li>
				</ul>
			</nav>
		</c:otherwise>
	</c:choose>
	
</div>