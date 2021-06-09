<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

$(document).ready(function(){
	var regUrl = /^((http(s?))\:\/\/)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/;
	$("input[name='introduction']").change(function(){
		var divUrl = $('#introductionUrlDiv');
		var divImg = $('#introductionImgDiv');
		
		if($("input[name='introduction']:checked").val()=="url"){
			console.log("url");
			console.log(divUrl);
			divUrl.css('display', 'block');
			divImg.css('display', 'none');
			$("#sUrl").attr('required', true);
			$("#file").attr('required', false);
			
		}else{
			console.log("img");
			divUrl.css('display', 'none');
			divImg.css('display', 'block');
			$("#sUrl").attr('required', false);
			$("#file").attr('required', true);
			$("#sUrl").val(''); //값 비우기
			
		}
	})
	
	$("#btnWrite").click(function() {
		//스마트에디터의 내용을 <textare>에 적용하기
		submitContents( $("#btnWrite") );
		
		//form submit 수행하기
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
	$("#btnUrl").click(function(){
   		var url = $("#sUrl").val();

		if(regUrl.test(url)){
			$.ajax({
		 		type: "post"
		 		, url: "/admin/story/url"
		 		, dataType: "json"
		 		, data: {
		 			sUrl: url
		 		}
		 		, success: function(res){
		 			console.log(res.url)
		 			$("#introductionUrlField").attr('src', res.url);
		 			$("#sUrl").attr('readonly', true);

		 		}
		 		, error: function() {
		 			console.log("error");
		 		}
		 	});	
		}else{
			console.log("url 형식에 맞게 입력해주세요")
			
		}   		
   		
	})
	$("#btnUrlRemove").click(function(){
		$("#introductionUrlField").attr('src', '');
		$("#sUrl").val('');
		$("#sUrl").attr('readonly', false);
	})
	
	
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
		<h1>스토리작성</h1>
		
		<form action="/admin/story/write" method="post" role="role" enctype="multipart/form-data">
			<input type="hidden" name="pNo" value="${project.pNo }" />
			<div class="radio background-white form-group alert">
			  <label>
			    <input type="radio" name="introduction" id="introductionUrl" value="url">
			    소개영상
			  </label>
			</div>
			<div class="radio background-white form-group alert">
			  <label>
			    <input type="radio" name="introduction" id="introductionImg" value="img">
			    소개사진
			  </label>
			</div>
			
			<div id="introductionUrlDiv" class="background-white form-group alert" role="alert" style="display: none;">
			    <label for="sUrl">소개 영상(유튜브 링크 등록)</label>
			    
			    <input type="text" id="sUrl" name="sUrl" class="form-control" style="display:inline-block; width:80%;" />
			    <button type="button" id="btnUrl" class="btn btn-primary">저장하기</button>
			    <button type="button" id="btnUrlRemove" class="btn btn-danger">삭제하기</button>
			    <iframe src="" width="870px" height="400px" id="introductionUrlField"></iframe>
			</div>
			
			<div id="introductionImgDiv" class="background-white form-group alert" role="alert" style="display: none;">
			    <label for="file">소개 사진</label>
			    <p class="help-block">여러장 등록 가능</p>
			    <div id="img" class="background-white form-group alert" role="alert">
			    </div>
			    <input multiple="multiple" type="file" id="file" name="file" accept="image/*" onchange="handleImgFileSelect(event);">
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="sSummery">프로젝트 요약</label>
				<textarea id="sSummery" name="sSummery" class="form-control" rows="3" required="required"></textarea>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="sStory">프로젝트 스토리</label>
				<textarea id="sStory" name="sStory" class="form-control" rows="3" required="required"></textarea>
			</div>
			
			<div class="background-white form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="button" id="btnWrite" class="btn btn-primary">저장하기</button>
                        <button type="button" class="btn btn-info" onclick="history.back()">돌아가기</button>
                        <button id="btnReset" type="reset" class="btn btn-danger">다시 입력하기</button>
                    </div>
            </div>
		</form>
	</div>
</div>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "sStory", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

// <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["sStory"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>