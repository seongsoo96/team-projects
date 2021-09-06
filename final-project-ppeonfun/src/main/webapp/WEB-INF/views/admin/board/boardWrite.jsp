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
	$("#btnWrite").click(function() {
		
		//스마트 에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents( $("#btnWrite") )
		
		//<form> submit
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});
</script>

<div id="content">

<div class="anbody2">

<label class="headname">게시글 쓰기</label>
<div class="buttonbox">
<button id="btnCancel" class="viewbtn pull-right">취소</button>
<button id="btnWrite" class="viewbtn pull-right">완료</button>
</div>

<form action="/admin/board/write" method="post" enctype="multipart/form-data">
<div class="nTitle"><input type="text" name="bTitle" class="bTitle" placeholder="제목을 입력해주세요." required /></div><br>
<div class="nContent"><textarea cols="140" rows="15" id="bContent" name="bContent" placeholder="내용을 입력해주세요." required></textarea></div><br><br>

<!-- <input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);" multiple="multiple" /><br> -->
<script>
function setThumbnail(event) { 
	for (var image of event.target.files) { 
		var reader = new FileReader(); 
		
		reader.onload = function(event) {
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			img.setAttribute("style", "width: 300px; height: 200px; margin: 10px;");
			document.querySelector("div#image_container").appendChild(img); 
		}; 
		
		console.log(image); 
		reader.readAsDataURL(image); 
	}
}
</script>

<input multiple="multiple" type="file" name="file" onchange="setThumbnail(event);" />

<div id="image_container" ></div> 

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

