<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css">

<div id="content">
<h1>공지사항 수정</h1>
<hr>

<div class="anbody">
<form action="/admin/notice/update" method="post" enctype="multipart/form-data">
<div class="nTitle"><input type="text" name="bTitle" class="bTitle" value="${board.bTitle }" required /></div><br>
<div class="nContent"><textarea cols="140" rows="15" name="bContent" required>${board.bContent }</textarea></div><br><br>

<div class="picture">
<c:forEach var="f" items="${flist }">
	<img src="/resources/upload/${f.bfStoredName }"  onclick="deleteFile(${f.bfFileno})" style="height: 200px; width: 300px;">
</c:forEach>
</div>
<input multiple="multiple" type="file" name="file" />


<input type="hidden" name="bNo" value="${board.bNo }" />
<div class="buttonbox">
<button>수정 완료</button>
<input type="button" onclick="history.go(-1)" value="취소" />
</div>
</form>
</div> <%-- anbody end --%>

</div> <%-- content end --%>


<c:import url="/WEB-INF/views/layout/footer.jsp" />