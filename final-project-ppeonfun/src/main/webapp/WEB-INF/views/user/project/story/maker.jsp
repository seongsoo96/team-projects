<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
var sel_file;
$(document).ready(function(){
	$("#file").on("change", handleImgFileSelect);
})
function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 파일만 가능");
			return;
		}
		sel_file=f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
	
}
</script>
<style type="text/css">
.alert{
	width: 100%;
	float: right;
}
.background-white{
	background: #FFFFFF;
	color: #1E2227;
	font-size: 20px;
	text-align: left;
}

</style>

	
		<h1>메이커 정보</h1>
		
		<form action="/user/maker/maker/modify" method="post" role="role" enctype="multipart/form-data">
			<input type="hidden" name="pNo" value="${project.pNo }" />
			<input type="hidden" name="storedName" value="${maker.maStoredName }" />
			<div class="background-white form-group alert" role="alert">
				<label for="maTitle">메이커명</label>
				<input type="text" id="maTitle" name="maTitle" class="form-control" value="${maker.maTitle }" readonly/>
			</div>
			
			<div class="background-white form-group alert" role="alert">
			    <label for="file">메이커 대표이미지</label>
			     <c:choose>
			    	<c:when test="${fn:length(maker.maStoredName) < 20}"> 
			    		<img id="img" class="imgclick" src="/resources/img/${maker.maStoredName} " width="100%" height="400px">
			    	</c:when>
			    	<c:otherwise> 
			    		<img id="img" class="imgclick" src="/upload/maker/${maker.maStoredName}" width="100%" height="400px">
			    	</c:otherwise>
			    </c:choose>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="maEmail">문의 이메일</label>
				<input type="email" id="maEmail" name="maEmail" class="form-control" value="${maker.maEmail }" readonly/>
			</div>
			
			
			<div class="background-white form-group alert" role="alert">
				<label for="maPhone">문의 번호</label>
				<input type="tel" id="maPhone" name="maPhone" class="form-control" value="${maker.maPhone }" readonly/>
			</div>
			
		</form>
		<c:import url="/WEB-INF/views/user/project/story/storyPaging.jsp"></c:import>
