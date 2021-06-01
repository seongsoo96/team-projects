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

<div class="write">
	<button id="BtnWrite" class="BtnWrite" onclick="location.href='/admin/notice/write'">글쓰기</button>
</div><br> <%-- write end --%>

<table class="antable">
<tr>
	<th style="width: 15%">글 번호</th>
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


</div> <%-- anbody end --%>

<c:import url="/WEB-INF/views/admin/notice/noticePaging.jsp" />

<form action="/admin/notice/list" method="post">
<div id="search">
	<select class="dropbox" name="category">
		<option value="mix">제목+내용</option>
		<option value="title">제목만</option>
		<option value="content">내용만</option>
	</select>
	<input type="text" class="search" name="search" placeholder="검색어를 입력해주세요"  />
	<button class="searchBtn">검색</button>
</div>
</form>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

