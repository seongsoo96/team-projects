<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	var divImg = $("#img");
	
	
	$("#file").on("change", handleImgFileSelect);
	<c:forEach items="${newsFile}" var="info">
		divImg.append("<img src='/upload/${info.nfStoredName}' width='300px' height='300px'/>")
	</c:forEach>
		
	$("#btnUpdate").click(function(){
		$(location).attr("href","/admin/news/modify?nNo=${news.nNo }");
	});
	
	$("#btnDelete").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			$(location).attr("href","/admin/news/remove?nNo=${news.nNo }&pNo=${project.pNo }");
		}
	});
		
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
		
		<form role="role">
			<input type="hidden" name="pNo" value="${project.pNo }" />
			<input type="hidden" name="nNo" value="${news.nNo }" />
			<div class="background-white form-group alert" role="alert">
				<label for="nTitle">새소식 제목</label>
				<input type="text" id="nTitle" name="nTitle" class="form-control" value="${news.nTitle }" readonly/>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="nContext">새소식 내용</label>
				<textarea id="nContext" name="nContext" class="form-control" rows="3" readonly>${news.nContext }</textarea>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="nCategory">카테고리</label>
				<input type="text" id="nCategory" name="nCategory" value="${news.nCategory }" readonly>
			</div>
			
			<div class="background-white form-group alert" role="alert">
			    <label for="file">이미지 삽입</label>
			    <div id="img" class="background-white form-group alert" role="alert">
			    </div>
			</div>
			
			
			<div class="background-white form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button id="btnUpdate" type="button" class="btn" style="background-color:  #4EE2EC; color: white;">수정하기</button>
                        <button id="btnDelete" type="button" class="btn btn-danger">삭제하기</button>
                        <button type="button" class="btn" onclick="location.href='/admin/news/list?pNo=${project.pNo }'">목록으로</button>
                    </div>
            </div>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>