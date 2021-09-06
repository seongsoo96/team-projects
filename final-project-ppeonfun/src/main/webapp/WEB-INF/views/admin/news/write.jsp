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
	var img = document.getElementById("img");
	while ( img.hasChildNodes() ) {
		img.removeChild( img.firstChild ); 
	}
	
	for (var image of event.target.files) { 
		var reader = new FileReader(); 
		
		reader.onload = function(event) {
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			img.setAttribute("style", "width: 300px; height: 300px;");
			document.querySelector("div#img").appendChild(img); 
		}; 
		
		console.log(image); 
		reader.readAsDataURL(image); 
	}
	
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
		<h1>새소식</h1>
		
		<form action="/admin/news/write" method="post" role="role" enctype="multipart/form-data">
			<input type="hidden" name="pNo" value="${project.pNo }" />
			<div class="background-white form-group alert" role="alert">
				<label for="nTitle">새소식 제목</label>
				<input type="text" id="nTitle" name="nTitle" class="form-control" required/>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="nContext">새소식 내용</label>
				<textarea id="nContext" name="nContext" class="form-control" rows="3" required="required"></textarea>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="nCategory">카테고리</label>
				<select class="form-control" id="nCategory" name="nCategory">
						<option>리워드안내</option>	
						<option>이벤트</option>	
						<option>기타</option>	
					</select>	
			</div>
			
			<div class="background-white form-group alert" role="alert">
			    <label for="file">이미지 삽입</label>
			    <p class="help-block">여러장 등록 가능</p>
			    <div id="img" class="background-white form-group alert" role="alert">
			    </div>
			    <input multiple="multiple" type="file" id="file" name="file" accept="image/*">
			</div>
			
			
			<div class="background-white form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn" style="background-color:  #4EE2EC; color: white;">저장하기</button>
                        <button type="button" class="btn" onclick="history.back()">돌아가기</button>
                    </div>
            </div>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>