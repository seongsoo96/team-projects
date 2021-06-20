<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"></c:import>
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

.sutable {
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

<div class="container"> 
<h1 class="pull-left">서포터 정보 &nbsp;</h1>
<hr>

<div class="anbody1">

<table class="sutable">
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
		<td style="text-align:center;">${supporter.SU_NO }</td>
		<td style="text-align:center;"><a href="/user/maker/supporter/view?suNo=${supporter.SU_NO }">${supporter.M_ID }</a></td>
		<td style="text-align:center;">${supporter.M_NICK }</td>
		<td style="text-align:center;"><fmt:formatDate value="${supporter.SU_CREATE_DATE }" pattern="yy-MM-dd" /></td>
		<td style="text-align:center;">${supporter.RE_TITLE }</td>
		<td style="text-align:center;">${supporter.RE_MONEY }</td>
		<td style="text-align:center;">${supporter.SU_ADD_MONEY }</td>
		
	</tr>
</c:forEach>
</tbody>
</table>
</div>

<span class="pull-left">total : ${paging.totalCount }</span><br>
<c:import url="/WEB-INF/views/admin/project/paging.jsp"></c:import>    
</div>
<br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>