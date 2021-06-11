<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css">

<%-- 현재시간을 변환(yyyyMMdd)하여 변수에 저장 --%>
<fmt:formatDate value="<%=new Date() %>" pattern="yyMMdd" var="nowStr" />

<div id="content">
<h1>공지사항 관리</h1>
<hr>

<div class="anbody1">

<div class="write">
	<button id="BtnWrite" class="BtnWrite" onclick="location.href='/admin/notice/write'">글쓰기</button>
</div><br> <%-- write end --%>

<table class="antable">
<tr>
	<th style="width: 5%"></th>
	<th style="width: 60%">제목</th>
	<th style="width: 10%">닉네임</th>
	<th style="width: 10%">작성일</th>
	<th style="width: 5%">조회</th>
	<th style="width: 10%;" <%-- onclick="array(${orderby})" --%>>
	<a class="arrayLink" href="/admin/notice/list?curPage=${paging.curPage }&orderby=${orderby }">좋아요▼</a></th>
</tr>
<c:forEach var="n" items="${nlist }">
<fmt:formatDate value="${n.B_CREATE_DATE }" pattern="yyMMdd" var="brdStr" />
	<tr>
		<td>${n.B_NO }</td>
		<td style="text-align: left; padding-left: 25px;">
		<a class="titleLink" href="/admin/notice/view?bNo=${n.B_NO }">${n.B_TITLE }</a></td>
		<td>${n.M_NICK }</td>
		<td>
		<c:if test="${brdStr eq nowStr }">
			<fmt:formatDate value="${n.B_CREATE_DATE }" type="time" pattern="HH:mm" />
		</c:if>
		<c:if test="${brdStr lt nowStr }">
			<fmt:formatDate value="${n.B_CREATE_DATE }" type="date" pattern="yyyy.MM.dd" />
		</c:if>
		</td>
		<td>${n.B_HIT }</td>
		<td>${n.RECOMMEND }</td>
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

