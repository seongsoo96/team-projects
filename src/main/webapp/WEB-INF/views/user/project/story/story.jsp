<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

$(document).ready(function(){
	var regUrl = /^((http(s?))\:\/\/)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/;
	var divUrl = $('#introductionUrlDiv');
	var divImg = $('#introductionImgDiv');
	
	<c:choose>
		<c:when test="${not empty story.sUrl}">
			console.log("url");
			console.log(divUrl);
			divUrl.css('display', 'block');
			divImg.css('display', 'none');
			$("#sUrl").attr('required', true);
			$("#file").attr('required', false);
			$("#introductionUrlField").attr('src', '${story.sUrl}');
 			$("#sUrl").attr('readonly', true);
 			$("#introductionUrl").attr('checked', true);
 			
		</c:when>
		<c:otherwise>
			console.log("img");
			divUrl.css('display', 'none');
			divImg.css('display', 'block');
			$("#sUrl").attr('required', false);
			$("#file").attr('required', true);
			$("#sUrl").val(''); //값 비우기
			$("#introductionImg").attr('checked', true);
			
			<c:forEach items="${storyFile}" var="info">
				divImg.append("<img src='/upload/${info.sfStoredName}' width='98%' height='300px' margin='10px auto'/>")
			</c:forEach>
			
		</c:otherwise>
	</c:choose>
	
	$("input[name='introduction']").change(function(){
		
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
		 		, url: "/user/maker/story/url"
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
			img.setAttribute("style", "width: 220px; height: 300px; text-align:center;");
			document.querySelector("div#img").appendChild(img); 
		}; 
		
		console.log(image); 
		reader.readAsDataURL(image); 
	}
	
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

		<h1>스토리</h1>

		<form role="role">
			<div class="radio background-white form-group alert">
			  <label>
			    <input type="radio" name="introduction" id="introductionUrl" value="url" onclick="return(false);"/>
			    소개영상
			  </label>
			</div>
			<div class="radio background-white form-group alert">
			  <label>
			    <input type="radio" name="introduction" id="introductionImg" value="img" onclick="return(false);"/>
			    소개사진
			  </label>
			</div>
			
			<div id="introductionUrlDiv" class="background-white form-group alert" role="alert" style="display: none;">
			    <label for="sUrl">소개 영상(유튜브 링크 등록)</label>
			    
			    <input type="text" id="sUrl" name="sUrl" class="form-control" value="${story.sUrl }" />
			    <iframe src="" width="870px" height="400px" id="introductionUrlField"></iframe>
			</div>
			
			<div id="introductionImgDiv" class="background-white form-group alert" role="alert" style="display: none;">
			    <label for="file">소개 사진</label>
			    <p class="help-block">여러장 등록 가능<br> 수정 시 기존에 있던 파일은 삭제됨</p>
			    <div id="img" class="background-white form-group alert" role="alert">
			    </div>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="sSummery">프로젝트 요약</label>
				<textarea id="sSummery" name="sSummery" class="form-control" rows="3" readonly>${story.sSummery }</textarea>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="sStory">프로젝트 스토리</label>
				<textarea id="sStory" name="sStory" class="form-control" rows="3" style="width:100%;" disabled>${story.sStory }</textarea>
			</div>
			
			
		</form>
		<c:import url="/WEB-INF/views/user/project/story/storyPaging.jsp"></c:import>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "sStory", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2",
	//readonly로 바꿔주는
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		var editor = oEditors.getById["sStory"];
		editor.exec("DISABLE_WYSIWYG");
		editor.exec("DISABLE_ALL_UI");
	}
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