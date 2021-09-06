<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/><br>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 스마트에디터 2 -->
<script type="text/javascript"
 src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
 <!-- <form>태그의 submit을 수행하면 editor에 작성한 내용을 <textarea>에 반영 -->
<script type="text/javascript">
function submitContents( elClickedObj ) {
	//에디터의 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		// <form>태그의 submit 수행
		elClickedObj.form.submit();
	} catch(e) {}
}
</script>

<script type="text/javascript">
$(document).ready(function(){
	//취소
	$("#btnCancel").click(function(){
		history.go(-1)
	})
	//수정
	$("#btnUpdate").click(function(){
		//스마트 에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents( $("#btnUpdate") )
		$("#delFile").val(true)
	})
	$("#delFile").click(function(){
		$("#originFile").remove()
		$("#delFile").val(false)
		
	})
	
	
})

</script>

<div class="container">
<h1>게시판 수정</h1>
<hr>

<form action="/user/board/update" method="post" enctype="multipart/form-data">
<input type="hidden" value="${update.B_NO}" name="bNo" />

<table class="table table-bordered">
<tr><td class="info">닉네임</td><td>${update.M_NICK }</td></tr>
<tr><td class="info">제목</td><td><input type="text" name="bTitle" style="width:100%" value="${update.B_TITLE }"/></td></tr>
<tr><td class="info" colspan="2">본문</td></tr>
<tr><td colspan="2"><textarea id="content" name="bContent">${update.B_CONTENT }</textarea></td></tr>
</table>

<div id="fileBox">	
	<div id="originFile">
		<a href="/user/board/download?bfFileno=${bf.BF_FILENO }">${bf.BF_ORIGIN_NAME }</a>
		
		<button id="delFile" name="isfile">X</button>
	</div>
	<br>
		
<div id="newFile">
		<label for="file">새로운 첨부파일</label>
		<input type="file" name="fileupload" id="fileupload" /><br>
		<small>** 새로운 파일을 첨부하면 기존파일이 삭제됩니다</small>
</div>
</div><!-- end id="fileBox" -->

<div class="text-center">	
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
	<button  id="btnUpdate" class="btn btn-info">수정</button>
</div>

</form>
</div> <!-- END class="container"--><br>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id를 입력
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>