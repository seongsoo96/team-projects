<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 프로필 사진 */
.profile-img {position:relative; height:170px; text-align:center;}
.profile-img img {width:130px; height:130px; border:2px solid tomato; margin:15px 0;}

/* 요소 가운데 정렬 및 글씨 크기 지정 */
.edit-img-btns, .my-introduce, .submit-btns {text-align:center; font-size:16px;}

/* 프로필 사진 변경 버튼 */
.edit-img-btns button {margin:0 5px 25px; background:none; border:none;}
.edit-img-btns button:hover {color:#4EE2EC;}

/* 소개란 */
.my-introduce textarea{margin:5px 0 25px; width:277px; height:90px; resize:none; border-radius:5px;}

/* 수정 완료, 취소 버튼 */
.submit-btns button {margin:0 10px; width:100px; background:none; border: 1px solid rgba(0,0,0, 0.2); border-radius:5px;}
.submit-btns button:hover {border-color:#4EE2EC;}
</style>

<div class="container">
	<h3>프로필 수정</h3>
	<hr>
	
	<form>
	<div class="profile-img">
		<c:if test="${isExistsImg }">
			<%-- <img src="/upload/${profile.myStoredName }"> --%>
			<img src="/resources/img/test1.png">
		</c:if>
		<c:if test="${not isExistsImg }">
			<img src="/resources/img/test1.png">
		</c:if>
	</div>
	<div class="edit-img-btns">
		<input type="file" id="profileImgFile" name="profileImgFile" accept="image/*" style="display:none;" />
		<c:if test="${isExistsImg }">
		<button type="button" id="btnChangeImg">바꾸기</button>
		<button type="button" id="btnDeleteImg" onclick="deleteImg()">삭제</button>
		</c:if>
		<c:if test="${not isExistsImg }">
			<button type="button">프로필 사진 등록</button>
		</c:if>
	</div>
	<div class="my-introduce">
		<h4>간단한 한 마디로 나를 소개 해주세요.</h4>
		<textarea id="introduce" name="introduce">${profile.myIntroduce }</textarea>
	</div>
	<div class="submit-btns">
		<button type="button">취소</button>
		<button type="button">확인</button>
	</div>
	</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	/* '바꾸기' 클릭 시 파일 업로드 */
	$("#btnChangeImg").click(function() {
		$("#profileImgFile").click()
	})
	
	/* 파일 첨부 시 changeImg() 함수 호출 */
	$("#profileImgFile").on('change', changeImg)
	
})
</script>
<script type="text/javascript">
function changeImg(e) {
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
			$("img").attr('src', '/resources/img/test2.png')
			console.log(res)
		}
		, error: function(res) {
			console.log("ajax 실패")
		}
	})
	
}

function deleteImg() {
	console.log("***deleteImg START***")
	
}
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>