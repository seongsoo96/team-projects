<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css">

<!-- 스마트에디터 2 -->
<script type="text/javascript"
 src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<!-- <form>태그의 submit을 수행하면 editor에 작성한 내용을 <textarea>에 반영 -->
<script type="text/javascript">
function submitContents( elClickedObj ) {
	
	//에디터의 내용을 #content에 반영한다
	oEditors.getById["bContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		// <form>태그의 submit 수행
		elClickedObj.form.submit();
	} catch(e) {}
	
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	//작성버튼 동작
	$("#btnUpdate").click(function() {
		
		//스마트 에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents( $("#btnUpdate") )
		
		//<form> submit
		$("form").submit();
	});
	
});
</script>

<div id="content">
<h1>공지사항 수정</h1>
<hr>

<div class="anbody">
<form action="/admin/notice/update" method="post" enctype="multipart/form-data">
<div class="nTitle"><input type="text" name="bTitle" class="bTitle" value="${board.bTitle }" required /></div><br>
<div class="nContent"><textarea cols="140" rows="15" id="bContent" name="bContent" required>${board.bContent }</textarea></div><br><br>

<div class="picture">
<c:forEach var="f" items="${flist }">
	<img src="/resources/upload/${f.bfStoredName }" <%--  onclick="deleteFile(${f.bfFileno})" --%> style="height: 200px; width: 300px;">
</c:forEach>
</div>
<input multiple="multiple" type="file" name="file" />


<input type="hidden" name="bNo" value="${board.bNo }" />
<div class="buttonbox">
<button id="btnUpdate">수정 완료</button>
<input type="button" onclick="history.go(-1)" value="취소" />
</div>
</form>
</div> <%-- anbody end --%>

</div> <%-- content end --%>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "bContent", //에디터가 적용될 <textarea>의 id를 입력
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />