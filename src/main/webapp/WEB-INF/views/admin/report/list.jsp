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
	$("#projectWrite").click(function(){
		$(location).attr('href', '/admin/report/write')
	});
})

</script>

<div id="content"> 
<h1 class="pull-left">신고 관리 &nbsp;<a id="projectWrite"><i class="fas fa-plus"></i></a></h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%; text-align:center;">신고 번호</th>
		<th style="width: 30%; text-align:center;">프로젝트 제목</th>
		<th style="width: 20%; text-align:center;">신고자</th>
		<th style="width: 20%; text-align:center;">신고날짜</th>
		<th style="width: 20%; text-align:center;">신고상태</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="report">
	<c:if test="${not empty report.REP_STATE }">
			<c:choose>
				<c:when test="${report.REP_STATE eq 'W'}"><c:set var="repState" value="신고 대기" /></c:when>
				<c:when test="${report.REP_STATE eq 'Y'}"><c:set var="repState" value="신고 승인" /></c:when>
				<c:when test="${report.REP_STATE eq 'N'}"><c:set var="repState" value="신고 거부" /></c:when>
			</c:choose>
		</c:if>
	<tr>
		<td>${report.REP_NO }</td>
		<td><a href="/admin/report/view?repNo=${report.REP_NO }">${report.P_NAME }</a></td>
		<td>${report.M_NICK }</td>
		<td><fmt:formatDate value="${report.REP_CREATE_DATE }" pattern="yy-MM-dd" /></td>
		<td>${repState }</td>		
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span><br>

<form action="/admin/report/list" method="get">
<div id="search">
	<select class="dropbox" name="category">
		<option value="title">제목</option>
		<option value="content">신고 내용</option>
		<option value="mix">제목+내용</option>
	</select>
	<input type="text" id="search" class="search" name="search" placeholder="검색어를 입력해주세요"  />
	<button class="searchBtn">검색</button>
</div>
</form>

<c:import url="/WEB-INF/views/admin/project/paging.jsp"></c:import>    
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>