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
		<c:when test="${project.pMaker eq 'Y'}"><c:set var="pMaker" value="작성완료" /></c:when>
		<c:when test="${project.pMaker eq 'N'}"><c:set var="pMaker" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<style type="text/css">

.alert{
	width: 900px;
	float: right;
}
.btn-group{
	margin-left:220px;

}

.background-white{
	background: #FFFFFF;
	color: #1E2227;
	border: 1px solid #4EE2EC;
	font-size: 35px;
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
<c:import url="/WEB-INF/views/layout/adminProjectSlide.jsp"></c:import>

<div class="container">
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">기본요건&nbsp;<span class="state">${pRequirements}</span></span><a href="/admin/requirement/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">기본정보&nbsp;<span class="state">${pInformation}</span></span><a href="/admin/information/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">스토리&nbsp;<span class="state">${pStory}</span></span><a href="/admin/story/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">리워드&nbsp;<span class="state">${pReward}</span></span><a href="/admin/reward/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">메이커 정보&nbsp;<span class="state">${pMaker}</span></span><a href="/admin/maker/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>

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
