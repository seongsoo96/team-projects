<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
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
	<c:import url="/WEB-INF/views/layout/adminProjectSlide.jsp"></c:import>
	<div class="container">
		<h1>기본요건</h1>
		
		<form action="/admin/requirement/write" method="post" role="role" enctype="multipart/form-data">
			<input type="hidden" name="pNo" value="${project.pNo }" />
			<div class="background-white form-group alert" role="alert">
				<label for="rContext">Q1. 현재까지 진행된 리워드의 준비 상태 및 앞으로의 계획을 구체적으로 설명해주세요.</label>
				<textarea id="rContext" name="rContext" class="form-control" rows="3" required="required"></textarea>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="rRewardPlan">Q2. 리워드 전달 계획을 알려주세요</label>
				<textarea id="rRewardPlan" name="rRewardPlan" class="form-control" rows="3" required="required"></textarea>
			</div>
			<div class="background-white form-group alert" role="alert">
			    <label for="file">리워드 종류 및 제작 형태</label>
			    <p class="help-block">리워드 종류 및 제작 형태를 선택한 후, 그에 따른 필수 서류를 업로드하세요. 제공할 모든 리워드의 종류를 반드시 추가하세요.</p>
			    <img id="img" class="imgclick" width="900px" height="400px">
			    <input type="file" id="file" name="file" accept="image/*" required>
			</div>
			<div class="background-white form-group" style="margin-left: 40px;">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn" style="background-color:  #4EE2EC; color: white;">저장하기</button>
                        <button type="button" class="btn" onclick="history.back()">돌아가기</button>
                    </div>
            </div>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>