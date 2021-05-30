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


</div>

</div> <%-- anbody end --%>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

