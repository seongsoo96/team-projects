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
.newstable {
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

</style>
<script type="text/javascript">
$(document).ready(function(){
	
	
})

</script>

<div id="content"> 
<h1 class="pull-left">새소식 관리 &nbsp;<a href="/admin/news/write?pNo=${project.pNo }"><i class="fas fa-plus"></i></a></h1>
<hr>

<div class="anbody1">
<table class="newstable">
<thead>
	<tr>
		<th style="width: 30%; text-align:center;">제목</th>
		<th style="width: 30%; text-align:center;">카테고리</th>
		<th style="width: 20%; text-align:center;">오픈예정</th>
		<th style="width: 20%; text-align:center;">생성날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="news">
	<tr>
		<td><a href="/admin/news/view?nNo=${news.nNo }">${news.nTitle }</a></td>
		<td>${news.nCategory }</td>
		<td><fmt:formatDate value="${news.nOpenDate }" pattern="yy-MM-dd" /></td>
		<td><fmt:formatDate value="${news.nCreateDate }" pattern="yy-MM-dd" /></td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
<span class="pull-left">total : ${paging.totalCount }</span><br>

<form action="/admin/news/list" method="get">
<div id="search">
	<input type="hidden" name="pNo" value="${project.pNo }">
	<select class="dropbox" name="category">
		<option value="mix">제목+내용</option>
		<option value="title">제목만</option>
		<option value="content">내용만</option>
	</select>
	<input type="text" id="search" class="search" name="search" placeholder="검색어를 입력해주세요"  />
	<button class="searchBtn">검색</button>
</div>
</form>

<c:import url="/WEB-INF/views/admin/project/paging.jsp"></c:import>    
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>