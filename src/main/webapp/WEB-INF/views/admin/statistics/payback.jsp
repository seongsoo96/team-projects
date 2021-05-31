<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="tableTarget">
		<h1 class="pull-left">환불 리스트</h1>	
		<table class="table table-hover table-striped table-condensed">
			<tr>
				<th class="text-center" style="width: 20%">프로젝트 번호</th>
				<th class="text-center" style="width: 20%">프로젝트 이름</th>
				<th class="text-center" style="width: 10%">카테고리</th>
				<th class="text-center" style="width: 20%">환불 금액</th>
				<th class="text-center" style="width: 20%">환불 사유</th>
				<th class="text-center" style="width: 10%">예금주</th>
			</tr>
			<c:forEach items="${list }" var="payback">
				<tr>
					<td>${payback.P_NO}</td>
					<td>${payback.I_TITLE}</td>
					<td>${payment.I_CATEGORY}</td>
					<td>${payback.PAYB_AMOUNT}</td>
					<td>${payback.PAYB_REASON}</td>
					<td>${payback.PAYB_REFUND_HOLDER}</td>
				</tr>
			</c:forEach>
		</table>
</div>