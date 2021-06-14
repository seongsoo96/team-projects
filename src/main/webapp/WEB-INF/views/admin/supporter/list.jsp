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

<div id="content"> 
<h1 class="pull-left">서포터 정보 &nbsp;</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%; text-align:center;">서포터 번호</th>
		<th style="width: 10%; text-align:center;">아이디</th>
		<th style="width: 10%; text-align:center;">닉네임</th>
		<th style="width: 20%; text-align:center;">서포터 등록날짜</th>
		<th style="width: 30%; text-align:center;">리워드 선택</th>
		<th style="width: 10%; text-align:center;">펀딩 금액</th>
		<th style="width: 10%; text-align:center;">추가 펀딩</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="supporter">
	<tr>
		<td>${supporter.SU_NO }</td>
		<td><a href="/admin/supporter/view?suNo=${supporter.SU_NO }">${supporter.M_ID }</a></td>
		<td>${supporter.M_NICK }</td>
		<td><fmt:formatDate value="${supporter.SU_CREATE_DATE }" pattern="yy-MM-dd" /></td>
		<td>${supporter.RE_TITLE }</td>
		<td>${supporter.RE_MONEY }</td>
		<td>${supporter.SU_ADD_MONEY }</td>
		
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span><br>
<c:import url="/WEB-INF/views/admin/open/paging.jsp"></c:import>    
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>