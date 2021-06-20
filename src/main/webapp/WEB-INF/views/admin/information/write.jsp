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
		<h1>기본정보</h1>
		
		<form action="/admin/information/write" method="post" role="role" enctype="multipart/form-data">
			<input type="hidden" name="pNo" value="${project.pNo }" />
			<div class="background-white form-group alert" role="alert">
				<label for="iTitle">프로젝트 제목</label>
				<input type="text" id="iTitle" name="iTitle" class="form-control" required/>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="iMoney">목표 금액(최소 50만원  ~ 최대 1억원)</label>
				<input type="number" id="iMoney" name="iMoney" class="form-control" min="500000" max="100000000" step="100000" required/>
			</div>
			
			<div class="background-white form-group alert" role="alert">
			    <label for="file">대표이미지</label>
			    <p class="help-block">텍스트 로고 삽입 금지</p>
			    <img id="img" class="imgclick" width="900px" height="400px">
			    <input type="file" id="file" name="file" accept="image/*" required>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="iCategory">카테고리</label>
				<select class="form-control" id="iCategory" name="iCategory">
						<option>테크/가전</option>	
						<option>반려동물</option>	
						<option>출판</option>	
						<option>기부/후원</option>	
						<option>푸드</option>	
						<option>운동</option>	
						<option>여행</option>	
						<option>뷰티</option>	
						<option>패션</option>	
						<option>디자인소품</option>		  
					</select>	
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="endDate">프로젝트 종료일</label>
				<input type="date" id="endDate" name="endDate" class="form-control" required/>
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