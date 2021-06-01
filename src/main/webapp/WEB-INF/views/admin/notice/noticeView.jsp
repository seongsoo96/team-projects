<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css">

<div id="content">

<div class="back">
<a href="/admin/notice/list"><label class="backlist"> 공지사항 > </label></a>
</div>

<div class="anbody">

<div class="nview">

<div><label class="viewTitle">${viewBoard.B_TITLE }</label></div>
<div><label>${viewBoard.M_NICK }</label></div>
<div class="CdAndHit"><label>
<fmt:formatDate value="${viewBoard.B_CREATE_DATE }" type="both" pattern="yyyy.MM.dd. HH:mm" />
</label>&nbsp;&nbsp;&nbsp;
<label class="HitLabel">조회 ${viewBoard.B_HIT }</label></div><br>

<div class="viewContent"><label>${viewBoard.B_CONTENT }</label></div>

</div>

<div class="imgbox">
<c:forEach var="f" items="${flist }">
<img class="imgclick" src="/resources/upload/${f.bfStoredName }">
</c:forEach>
</div>
<br>

<div class="btnbox">
<c:if test="${viewBoard.M_NO eq sessionScope.mNo}">
<button class="viewbtn" onclick="location.href='/admin/notice/update?bNo=${viewBoard.B_NO}'">수정</button>
<button class="viewbtn" onclick="location.href='/admin/notice/delete?bNo=${viewBoard.B_NO}'">삭제</button>
</c:if>
<button class="viewbtn" onclick="location.href='/admin/notice/list'">목록</button>
</div>

</div> <%-- anbody end --%>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
