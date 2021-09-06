<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
/* 테이블 디자인 */
.alarmtable {
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
</style>

<div id="tableTarget">
		<h1 class="pull-left">알림 리스트</h1><br>	
		<table class="alarmtable">
			<tr>
				<th class="text-center" style="width: 25%">프로젝트 번호</th>
				<th class="text-center" style="width: 25%">프로젝트 이름</th>
				<th class="text-center" style="width: 25%">카테고리</th>
				<th class="text-center" style="width: 25%">등록 날짜</th>
			</tr>
			<c:forEach items="${list }" var="alarm">
				<tr>
					<td>${alarm.P_NO}</td>
					<td>${alarm.I_TITLE}</td>
					<td>${alarm.I_CATEGORY}</td>
					<td><fmt:formatDate value="${alarm.A_CREATE_DATE }" pattern="yy-MM-dd hh:mm:ss" /></td>
				</tr>
			</c:forEach>
		</table>
</div>