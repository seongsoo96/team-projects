<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
.alert{
	width: 100%;
	float: right;
}
.background-white{
	background: #FFFFFF;
	color: #1E2227;
	font-size: 20px;
	text-align: left;
}


</style>

		<h1>기본요건</h1>
		<form action="#" role="role">
			<div class="background-white form-group alert" role="alert">
				<label for="rContext">1. 현재까지 진행된 리워드의 준비 상태 및 앞으로의 계획을 구체적으로 설명해주세요.</label>
				<textarea id="rContext" name="rContext" class="form-control" rows="3" readonly>${requirement.rContext }</textarea>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="rRewardPlan">2. 리워드 전달 계획을 알려주세요</label>
				<textarea id="rRewardPlan" name="rRewardPlan" class="form-control" rows="3" readonly>${requirement.rRewardPlan }</textarea>
			</div>
			<div class="background-white form-group alert" role="alert">
			    <label for="file">3.리워드 종류 및 제작 형태</label>
			     <c:choose>
			    	<c:when test="${fn:length(requirementFile.rfStoredName) < 20}"> <img id="img" class="imgclick" src="/resources/img/${requirementFile.rfStoredName} " width="100%" height="400px"></c:when>
			    	<c:otherwise>  <img id="img" class="imgclick" src="/upload/${requirementFile.rfStoredName }" width="100%" height="400px"></c:otherwise>
			    </c:choose>
			   
			</div>
			
		</form>
		<c:import url="/WEB-INF/views/user/project/story/storyPaging.jsp"></c:import>
