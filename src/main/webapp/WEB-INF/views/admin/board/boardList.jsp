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
<h1>게시판 관리</h1>
<hr>

<div class="anbody1">

<div class="write">
	<button id="BtnWrite" class="BtnWrite" onclick="location.href='/admin/board/write'">글쓰기</button>
</div><br> <%-- write end --%>

<table class="antable">
<tr>
	<th style="width: 5%">글 번호</th>
	<th style="width: 65%">제목</th>
	<th style="width: 10%">닉네임</th>
	<th style="width: 10%">작성일</th>
	<th style="width: 5%">조회수</th>
	<th style="width: 5%"><label id="arrayRec" style="cursor: pointer;">추천수▼</label></th>
</tr>
<c:forEach var="n" items="${nlist }">
<fmt:formatDate value="${n.B_CREATE_DATE }" pattern="yyMMdd" var="brdStr" />
	<tr>
		<td>${n.B_NO }</td>
		<td style="text-align: left; padding-left: 25px;">
		<a class="titleLink" href="/admin/board/view?bNo=${n.B_NO }">${n.B_TITLE }</a></td>
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
	</tr>
</c:forEach>
</table>


</div> <%-- anbody end --%>

<c:import url="/WEB-INF/views/admin/board/boardPaging.jsp" />

<form action="/admin/board/list" method="post">
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
