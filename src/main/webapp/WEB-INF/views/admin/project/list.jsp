<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<style type="text/css">
.search {
	border-color: snow;
	height: 30px;
	width: 200px;
}

.searchBtn {
	background-color: #C4FFFF;
	border: none;
	height: 30.5px;
	margin-left: -4px;
	width: 50px;
}
.dropbox {
	border-color: ivory;
	height: 30px;
	margin: 0px 5px;
	width: 100px;
}
</style>
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
<style type="text/css">
hr{
	margin-top:80px;
}
.fa-plus{
	color:#4EE2EC;
}
#projectWrite{
	cursor: pointer;
}

/* 테이블 디자인 */
.protable {
	margin-bottom: 20px;
	max-width: 100%;
	width: 100%;
}

tr {
	border-radius: 10px;
	height: 35px;
}

th, td {
	border-bottom: 1px solid #f6f6f6;
	text-align: center;
}

th {
	background-color: #C4FFFF;
}

.anbody1 {
	margin: 0 auto;
	text-align: left !important;
	width: 1070px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#projectWrite").click(function(){
		var result = confirm('프로젝트를 생성 하시겠습니까?');
		if(result){
			$(location).attr("href", "/admin/project/write");
		}
	})	
})

</script>

<div id="content"> 
<h1 class="pull-left">프로젝트 관리 &nbsp;<a id="projectWrite"><i class="fas fa-plus"></i></a></h1>
<hr>

<div class="anbody1">

<table class="protable">
<thead>
	<tr>
		<th style="width: 20%; text-align:center;">프로젝트 이름</th>
		<th style="width: 5%; text-align:center;">요건</th>
		<th style="width: 5%; text-align:center;">정보</th>
		<th style="width: 10%; text-align:center;">스토리</th>
		<th style="width: 10%; text-align:center;">리워드</th>
		<th style="width: 10%; text-align:center;">메이커</th>
		<th style="width: 15%; text-align:center;">승인 상태</th>
		<th style="width: 15%; text-align:center;">진행 상태</th>
		<th style="width: 20%; text-align:center;">생성 날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="project">
	<tr>
		<td><a href="/admin/project/view?pNo=${project.pNo }">${project.pName }</a></td>
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
		<c:if test="${not empty project.pState }">
			<c:choose>
				<c:when test="${project.pState eq 'W'}"><c:set var="pState" value="승인전" /></c:when>
				<c:when test="${project.pState eq 'Y'}"><c:set var="pState" value="승인완료" /></c:when>
				<c:when test="${project.pState eq 'N'}"><c:set var="pState" value="승인거부" /></c:when>
				<c:when test="${project.pState eq 'S'}"><c:set var="pState" value="제출" /></c:when>
			</c:choose>
		</c:if>
		<c:if test="${not empty project.pProgressState }">
			<c:choose>
				<c:when test="${project.pProgressState eq 'W'}"><c:set var="pProgressState" value="오픈예정" /></c:when>
				<c:when test="${project.pProgressState eq 'Y'}"><c:set var="pProgressState" value="펀딩 진행중" /></c:when>
				<c:when test="${project.pProgressState eq 'N'}"><c:set var="pProgressState" value="펀딩 종료" /></c:when>
			</c:choose>
		</c:if>
		<td>${pRequirements }</td>
		<td>${pInformation }</td>
		<td>${pStory }</td>
		<td>${pReward }</td>
		<td>${pMaker }</td>
		<td>${pState}</td>
		<td>${pProgressState }</td>
		<td><fmt:formatDate value="${project.pCreateDate }" pattern="yy-MM-dd" /></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span><br>

</div>

<c:if test="${paging.totalPage > 1 }">
	<c:import url="/WEB-INF/views/admin/user/ppeonfunpaging.jsp" />   
</c:if> 

<form action="/admin/project/list" method="post">
<div id="search">
	<select class="dropbox" name="category">
		<option value="title">제목</option>
	</select>
	<input type="text" id="search" class="search" name="search" placeholder="검색어를 입력해주세요"  />
	<button class="searchBtn">검색</button>
</div>
</form>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>