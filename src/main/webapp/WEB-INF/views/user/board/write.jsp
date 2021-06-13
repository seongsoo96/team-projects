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
	$("#btnWrite").click(function(){
		
		console.log("확인용 ")
		//스마트 에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents( $("#btnWrite") )
		
	})
	
	$("#btnCancel").click(function(){
		history.go(-1);
	})
})
</script>



<div id="container">
<h1>게시글 등록</h1>
<hr>

<form id="write" action="/user/board/write" method="post" enctype="multipart/form-data">

<table class="table table-bordered">
<tr>
 <td class="info">닉네임</td>
 <td>${mNick}</td>
</tr>
<tr><td class="info">제목</td><td><input type="text" name="bTitle" style="width:100%" /></td></tr>
<tr><td class="info" colspan="4">내용</td></tr>
<tr><td colspan="2"><input type="text" name="bContent" id="content"  /></td></tr>
</table>

<label>첨부파일 <input type="file" name="file" /></label>


<div class="text-center">
  <button  id="btnCancel" class="btn btn-danger">취소</button>
  <button  id="btnWrite" class="btn btn-info">작성</button>
</div>
</form>

</div><!-- end.container -->

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