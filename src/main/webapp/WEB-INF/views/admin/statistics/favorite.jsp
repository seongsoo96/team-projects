<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
/* 테이블 디자인 */
.favtable {
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
		<h1 class="pull-left">좋아요 리스트</h1><br>	
		<table class="favtable">
			<tr>
				<th class="text-center" style="width: 25%">프로젝트 번호</th>
				<th class="text-center" style="width: 25%">프로젝트 이름</th>
				<th class="text-center" style="width: 25%">카테고리</th>
				<th class="text-center" style="width: 25%">좋아요</th>
			</tr>
			<c:forEach items="${list }" var="favorite">
				<tr>
					<td>${favorite.P_NO}</td>
					<td>${favorite.I_TITLE}</td>
					<td>${favorite.I_CATEGORY}</td>
					<td>${favorite.P_LIKE}</td>
				</tr>
			</c:forEach>
		</table>
</div>