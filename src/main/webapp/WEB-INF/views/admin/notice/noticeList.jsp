<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css">

<div id="content">
<h1>공지사항 관리</h1>
<hr>

<div class="anbody">
<table class="antable">
<tr>
	<th style="width: 15%">공지사항 번호</th>
	<th style="width: 45%">제목</th>
	<th style="width: 15%">닉네임</th>
	<th style="width: 15%">작성일</th>
	<th style="width: 10%">조회수</th>
</tr>
<c:forEach var="n" items="${nlist }">
	<tr>
		<td>${n.B_NO }</td>
		<td><a href="/admin/notice/view?bNo=${n.B_NO }">${n.B_TITLE }</a></td>
		<td>${n.M_NICK }</td>
		<td><fmt:formatDate value="${n.B_CREATE_DATE }" type="date" pattern="yyyy-MM-dd" /></td>
		<td>${n.B_HIT }</td>
	</tr>
</c:forEach>
</table>

<div class="write">
	<button id="BtnWrite" class="BtnWrite" onclick="location.href='/admin/notice/write'">새글 쓰기</button>
</div> <%-- write end --%>

</div> <%-- anbody end --%>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/admin/notice/noticePaging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />

