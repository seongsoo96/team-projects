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
<h1 class="pull-left">알림신청 정보 &nbsp;</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 25%; text-align:center;">알림 번호</th>
		<th style="width: 25%; text-align:center;">아이디</th>
		<th style="width: 25%; text-align:center;">닉네임</th>
		<th style="width: 25%; text-align:center;">알림등록날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="alarm">
	<tr>
		<td>${alarm.A_NO }</td>
		<td>${alarm.M_ID }</td>
		<td>${alarm.M_NICK }</td>
		<td><fmt:formatDate value="${alarm.A_CREATE_DATE }" pattern="yy-MM-dd" /></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span><br>
<c:import url="/WEB-INF/views/admin/open/openPaging.jsp"></c:import>
<c:import url="/WEB-INF/views/admin/open/paging.jsp"></c:import>    
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>