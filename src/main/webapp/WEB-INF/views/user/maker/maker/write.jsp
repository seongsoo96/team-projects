<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"></c:import>
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
	width: 900px;
	float: right;
}
.background-white{
	background: #FFFFFF;
	color: #1E2227;
	font-size: 20px;
	text-align: left;
}

</style>
<div id="content">
	<c:import url="/WEB-INF/views/layout/userProjectSlide.jsp"></c:import>
	<div class="container">
		<h1>메이커 정보</h1>
		
		<form action="/user/maker/maker/write" method="post" role="role" enctype="multipart/form-data">
			<input type="hidden" name="pNo" value="${project.pNo }" />
			<div class="background-white form-group alert" role="alert">
				<label for="maTitle">메이커명</label>
				<input type="text" id="maTitle" name="maTitle" class="form-control" required/>
			</div>
			
			<div class="background-white form-group alert" role="alert">
			    <label for="file">메이커 대표이미지</label>
			    <p class="help-block">텍스트 로고 삽입 금지</p>
			    <img id="img" class="imgclick" width="900px" height="400px">
			    <input type="file" id="file" name="file" accept="image/*" required>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="maEmail">문의 이메일</label>
				<input type="email" id="maEmail" name="maEmail" class="form-control" required/>
			</div>
			
			
			<div class="background-white form-group alert" role="alert">
				<label for="maPhone">문의 번호</label>
				<input type="tel" id="maPhone" name="maPhone" class="form-control" required/>
			</div>
			
			
			<div class="background-white form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">저장하기</button>
                        <button type="button" class="btn btn-info" onclick="history.back()">돌아가기</button>
                    </div>
            </div>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>