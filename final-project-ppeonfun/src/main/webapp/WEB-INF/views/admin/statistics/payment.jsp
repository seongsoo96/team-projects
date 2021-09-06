<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
/* 테이블 디자인 */
.paytable {
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
		<h1 class="pull-left">결제 리스트</h1><br>
		<table class="paytable">
			<tr>
				<th class="text-center" style="width: 20%">프로젝트 번호</th>
				<th class="text-center" style="width: 20%">프로젝트 이름</th>
				<th class="text-center" style="width: 20%">카테고리</th>
				<th class="text-center" style="width: 20%">결제 금액</th>
				<th class="text-center" style="width: 20%">결제 이름</th>
			</tr>
			<c:forEach items="${list }" var="payment">
				<tr>
					<td>${payment.P_NO}</td>
					<td>${payment.I_TITLE}</td>
					<td>${payment.I_CATEGORY}</td>
					<td>${payment.PAYM_AMOUNT}</td>
					<td>${payment.PAYM_NAME}</td>
				</tr>
			</c:forEach>
		</table>
</div>