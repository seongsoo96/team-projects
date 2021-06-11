<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css" type="text/css">

<div id="content">

<div class="back">
<a href="/admin/board/list"><label class="backlist"> 게시판 > </label></a>
</div>

<div class="anbody">

<div>

<div style="text-align: left;"><label class="viewTitle">${viewBoard.B_TITLE }</label></div>
<div style="text-align: left;"><label>${viewBoard.M_NICK }</label></div>
<div class="CdAndHit" style="text-align: left;"><label>
<fmt:formatDate value="${viewBoard.B_CREATE_DATE }" type="both" pattern="yyyy.MM.dd. HH:mm" />
</label>&nbsp;&nbsp;&nbsp;
<label class="HitLabel">조회 ${viewBoard.B_HIT }</label>

</div><br>

<div class="viewContent" style="text-align: left;"><label>${viewBoard.B_CONTENT }</label></div>

</div>

<div class="imgbox" style="text-align: left;">
<c:forEach var="f" items="${flist }">
<a href="/admin/board/download?fileno=${f.bfFileno }">
<img class="imgclick" src="/resources/upload/${f.bfStoredName }">
</a>
</c:forEach>
</div>
<br>

<div class="btnbox">
<button class="viewbtn" onclick="location.href='/admin/board/update?bNo=${viewBoard.B_NO}'">수정</button>
<button class="viewbtn" onclick="location.href='/admin/board/delete?bNo=${viewBoard.B_NO}'">삭제</button>
<button class="viewbtn" onclick="history.go(-1)">목록</button>
</div>

</div> <%-- anbody end --%>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
