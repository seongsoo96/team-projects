<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 프로필 사진 */
.profile-img {position:relative; height:170px; text-align:center;}
.profile-img img {width:130px; height:130px; margin:15px 0; border-radius:50%;}

/* 요소 가운데 정렬 및 글씨 크기 지정 */
.edit-img-btns, .my-introduce, .submit-btns {text-align:center; font-size:16px;}

/* 프로필 사진 변경 버튼 */
.edit-img-btns button {margin:0 5px 25px; background:none; border:none; text-decoration:underline;}
.edit-img-btns button:hover {color:#4EE2EC;}

/* 소개란 */
.form-group {width:50%; margin:10px auto 30px auto;}
.form-group label {font-size:16px;}
.form-group textarea {resize:none; width:80%; margin:0 auto; height:110px; overflow-y:auto; overflow-x:hidden;}

/* 수정 완료 버튼 */
.submit-btns button {margin:0 10px; width:65px; height:35px; background:none; border: 1px solid rgba(0,0,0, 0.2); border-radius:5px;}
.submit-btns button:hover {border-color:#4EE2EC;}
</style>

<div class="container">
	<h3>프로필 수정</h3>
	<hr>
	
	<form action="/user/mypage/profile" method="post">
	<div class="profile-img">
		<c:choose>
			<c:when test="${fn:contains(profile.myStoredName, 'test') or ('member.png' eq profile.myStoredName) }">
				<img id="myimg" src="/resources/img/member.png">
			</c:when>
			<c:otherwise>
				<img id="myimg" class="profile-img" src="/upload/profile/${profile.myStoredName }">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="edit-img-btns">
		<input type="file" id="profileImgFile" accept="image/*" style="display:none;" />
		<button type="button" id="btnChangeImg">수정</button>
		<button type="button" id="btnDeleteImg" onclick="deleteImg()">삭제</button>
	</div>
	<div class="text-center">
		<div class="form-group">
			<label for="introduce">간단한 한 마디로 나를 소개 해주세요.</label>
			<c:if test="${not empty profile.myIntroduce }">
				<textarea id="introduce" class="form-control" name="introduce">${profile.myIntroduce }</textarea>
			</c:if>
			<c:if test="${empty profile.myIntroduce }">
				<textarea id="introduce" class="form-control" name="introduce"></textarea>
			</c:if>
		</div>
	</div>
	<div class="submit-btns">
		<button type="button" id="btnComplete">확인</button>
	</div>
	</form>
	
</div><!-- div.container -->

<script type="text/javascript">
$(document).ready(function() {
	
	// '수정' 클릭 시 파일 업로드
	$("#btnChangeImg").click(function() {
		$("#profileImgFile").click()
	})
	
	// 파일 첨부 시 changeImg() 함수 호출
	$("#profileImgFile").on('change', changeImg)
	
	// '확인' 클릭 시 introduce 전송
	$("#btnComplete").click(function() {
		$("form").submit()
	})
	
})
</script>
<script type="text/javascript">
function changeImg(e) {
	console.log("***changeImg START***")
	console.log(e)
	console.log(e.target.files[0])
	
	var imgFile = null
	
	if(e.target.files != null) {
		imgFile = e.target.files[0]
	}
	
	//확장자 검사
	if(!imgFile.type.match("image/*")) {
		alert('이미지 파일만 업로드 가능합니다.')
		return false
	}
	
	//파일 크기 검사
	var fileSize = imgFile.size
		
	//파일이 1KB 미만일 때
	if(fileSize < 1024) {
		alert('1KB 이상의 사진을 업로드 할 수 있습니다.')
		return false
	}
		
	//파일이 5MB 초과일 때
	if(fileSize > (5 * 1024 * 1024)) {
		alert('5MB 미만의 사진을 업로드 할 수 있습니다.')
		return false
	}
	
	var form = new FormData()
	form.append("file", imgFile)
	
	$.ajax({
		type: "post"
		, url: "/user/mypage/profile/ajax"
		, processData : false
	    , contentType : false
	    , data : form
		, dataType: "json" 
		, success: function(res) {
			console.log("ajax 성공")
			console.log("파일명", res.myStoredName)
			$("#myimg").attr( 'src', ('/upload/profile/' + res.myStoredName) )
		}
		, error: function(res) {
			console.log("ajax 실패")
		}
	})
	
}
</script>
<script type="text/javascript">
function deleteImg() {
	console.log("***deleteImg START***")
	
	$.ajax({
		type: "get"
		, url: "/user/mypage/profile/delajax"
		, dataType: "json"
		, success: function(res) {
			console.log("ajax 성공")
			$("#myimg").attr('src', ('/resources/img/' + res.myStoredName) )
		}
		, error: function(res) {
			console.log("ajax 실패")
		}
	})	
}
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>