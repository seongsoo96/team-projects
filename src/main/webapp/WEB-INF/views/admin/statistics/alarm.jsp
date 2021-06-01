<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="tableTarget">
		<h1 class="pull-left">알림 리스트</h1>	
		<table class="table table-hover table-striped table-condensed">
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