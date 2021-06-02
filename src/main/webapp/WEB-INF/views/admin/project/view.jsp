<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty project.pRequirements }">
	<c:choose>
		<c:when test="${project.pRequirements eq 'W' }"><c:set var="pRequirements" value="작성전" /></c:when>
		<c:when test="${project.pRequirements eq 'Y'}"><c:set var="pRequirements" value="작성완료" /></c:when>
		<c:when test="${project.pRequirements eq 'N' }"><c:set var="pRequirements" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:if test="${not empty project.pInformation }">
	<c:choose>
		<c:when test="${project.pInformation eq 'W' }"><c:set var="pInformation" value="작성전" /></c:when>
		<c:when test="${project.pInformation eq 'Y' }"><c:set var="pInformation" value="작성완료" /></c:when>
		<c:when test="${project.pInformation eq 'N' }"><c:set var="pInformation" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:if test="${not empty project.pStory }">
	<c:choose>
		<c:when test="${project.pStory eq 'W'}"><c:set var="pStory" value="작성전" /></c:when>
		<c:when test="${project.pStory eq 'Y'}"><c:set var="pStory" value="작성완료" /></c:when>
		<c:when test="${project.pStory eq 'N'}"><c:set var="pStory" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:if test="${not empty project.pReward }">
	<c:choose>
		<c:when test="${project.pReward eq 'W'}"><c:set var="pReward" value="작성전" /></c:when>
		<c:when test="${project.pReward eq 'Y'}"><c:set var="pReward" value="작성완료" /></c:when>
		<c:when test="${project.pReward eq 'N'}"><c:set var="pReward" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:if test="${not empty project.pMaker }">
	<c:choose>
		<c:when test="${project.pMaker eq 'W'}"><c:set var="pMaker" value="작성전" /></c:when>
		<c:when test="${project.pMaker eq 'Y'} "><c:set var="pMaker" value="작성완료" /></c:when>
		<c:when test="${project.pMaker eq 'N'} "><c:set var="pMaker" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
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
.alert{
	width: 900px;
	float: right;
}
.btn-group{
	margin-left:220px;

}
.background{
	background: #4EE2EC;
	color: #FFFFFF;
	
}
.background-white{
	background: #FFFFFF;
	color: #1E2227;
	border: 1px solid #4EE2EC;
	font-size: 35px;
}
.title{
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	height: 60px;
}
.title > h3{
	margin-top: 0px;
}
.fa-plus-square{
	margin-top:9px;
	color:#4EE2EC;
}
.state{
	color:#4EE2EC;
	font-size:12px;
}

</style>

<div id="content">
<div class="side_list">
	<div class="title">
		<h3>${name }의<br>프로젝트 번호:${project.pNo}</h3>
	</div>
	<a href="#" class="side_link background">펀딩준비</a>
	<a href="#" class="side_link">새소식</a>
	<a href="#" class="side_link">오픈예정</a>
	<a href="#" class="side_link">서포터</a>
	<a href="#" class="side_link">펀딩현황</a>
</div>
<div class="container">
	<div class="alert background-white" role="alert"><span class="pull-left">기본요건&nbsp;<span class="state">${pRequirements}</span></span><a href="#"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">기본정보&nbsp;<span class="state">${pInformation}</span></span><a href="#"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">스토리&nbsp;<span class="state">${pStory}</span></span><a href="#"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">리워드&nbsp;<span class="state">${pReward}</span></span><a href="#"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">메이커 정보&nbsp;<span class="state">${pMaker}</span></span><a href="#"><i class="far fa-plus-square pull-right"></i></a></div>

	<div class="btn-group btn-group-lg" role="group">
		<c:if test="${project.mNo eq mNo}">
			<button type="button" class="btn btn-default">제출</button>
		</c:if>
		<button type="button" class="btn btn-default">승인</button>
		<button type="button" class="btn btn-default">거부</button>
		<button type="button" class="btn btn-default">수정요청</button>
	</div>
</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
