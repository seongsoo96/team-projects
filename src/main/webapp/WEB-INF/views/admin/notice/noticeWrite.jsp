<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css">

<div id="content">
<h1>공지사항 쓰기</h1>
<hr>

<div class="anbody">
<form action="/admin/notice/write" method="post" enctype="multipart/form-data">
<div class="nTitle"><input type="text" name="bTitle" class="bTitle" placeholder="제목을 입력해주세요." required /></div><br>
<div class="nContent"><textarea cols="140" rows="15" name="bContent" placeholder="내용을 입력해주세요." required></textarea></div><br><br>

<input multiple="multiple" type="file" name="file" />




<div class="buttonbox">
<button>완료</button>
<input type="button" onclick="history.go(-1)" value="취소" />
</div>
</form>
</div> <%-- anbody end --%>

</div> <%-- content end --%>


<c:import url="/WEB-INF/views/layout/footer.jsp" />