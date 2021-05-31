<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css">

<div id="content">
<h1>공지사항 상세보기</h1>
<hr>

<div class="anbody">

<div class="nview">
<label>${viewBoard.B_TITLE }</label><br>
<label>${viewBoard.M_NICK }</label><br>
<label><fmt:formatDate value="${viewBoard.B_CREATE_DATE }" type="both" pattern="yyyy.MM.dd. HH:mm" /></label><br>
<label>${viewBoard.B_HIT }</label><br>

<label>${viewBoard.B_CONTENT }</label><br><br>

<c:forEach var="f" items="${flist }">
<img src="/resources/upload/${f.bfStoredName }" style="height: 200px; width: 300px;">
</c:forEach>
<br><br>

<c:if test="${viewBoard.M_NO eq sessionScope.mNo}">
<button onclick="location.href='/admin/notice/update?bNo=${viewBoard.B_NO}'">수정</button>
<button onclick="location.href='/admin/notice/delete'">삭제</button>
</c:if>
<button onclick="location.href='/admin/notice/list'">목록</button>
</div>

</div> <%-- anbody end --%>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

