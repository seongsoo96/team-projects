<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
.view table {
  border-collapse: separate;
  border-spacing: 0 10px;
}
.view th {
}

.view td {
padding-left: 40px;
}
</style>

<div class="view">
<div style="width:100px; height:100px; margin: 0 auto;">
	<img src="/resources/img/member.png" alt="..." class="img-circle" style="width:100%;">
</div><!-- ${view.MY_STORED_NAME } -->

<table style="margin: 0 auto;">
	<tr>
		<th>번호</th>
		<td>${view.M_NO }</td>
		<td><input id="no" name="mNo" type="hidden" value="${view.M_NO }"></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${view.M_ID }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${view.M_NAME }</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input id="nick" name="mNick" type="text" value="${view.M_NICK }"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${view.M_PHONE }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${view.M_EMAIL }</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${view.M_GENDER }</td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><fmt:formatDate value="${view.M_SIGNUP_DATE }" pattern="yy-MM-dd"/></td>
	</tr>
	<tr>
		<th>은행</th>
		<td>${view.M_BANK }</td>
	</tr>
	<tr>
		<th>계좌번호</th>
		<td>${view.M_ACCOUNT }</td>
	</tr>
	<tr>
		<th>신고횟수</th>
		<td>${view.M_CAUTION }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${view.M_ADDRESS } // ${view.M_DETAIL_ADDRESS }</td>
	</tr>
</table>
</div>



