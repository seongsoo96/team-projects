<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 기본 정보 수정, 비민번호 변경 버튼*/
.text-center div {font-size:18px; margin:50px 0;}
.text-center div button {background:none; border:1px solid rgba(0,0,0, 0.2); border-radius:5px; width:180px; height:40px;}
.text-center div button:hover {color:#4EE2EC;}
</style>

<div class="container">
	<!-- 모달창 -->
	<div class="modal fade" id="pwModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">현재 비밀번호를 확인합니다.</h4>
				</div>
				<div class="modal-body form-inline">
					<div class="form-group">
						<label for="prespw" style="margin:0 40px">현재 비밀번호 입력</label>
						<input type="password" class="form-control" id="prespw" style="width:340px">
						<div id="checkPwMsg" style="color:#a94442; margin-left:195px"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="btnPwComplete">확인</button>
				</div>
			</div>
		</div>
	</div>

	<h3>회원정보수정</h3>
	<hr>
	
	<div class="text-center" style="height:250px;">
		<div><button type="button" id="default-info">기본 정보 수정</button></div>
		<div><button type="button" id="changepw" data-toggle="modal" data-target="#pwModal">비밀번호 변경</button></div>
		<a href="/user/mypage/unsubscribe">회원탈퇴</a>	
	</div>
	
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	//카카오 가입자인 경우
	var isSocialKakao = ${isSocialKakao }
	console.log("카카오 로그인인지?:", isSocialKakao)
	
	if( isSocialKakao ) {
		$("#changepw").hide()
	}
	
	//'기본 정보 수정' 버튼 클릭 했을 때
	$("#default-info").click(function() {
		location.href = "/user/mypage/info"
	})
	
	//모달에서 비밀번호 입력 시 이벤트
	$("#prespw").keyup(function() {
		$("#checkPwMsg").html("")
	})
	
	// 비밀번호 변경 모달에서 '확인' 버튼 클릭 했을 때
	$("#btnPwComplete").click(function() {
		console.log("변경 확인 클릭!")
		$.ajax({
			type: "post"
	    	, url: "/user/mypage/checkpw"
	    	, dataType: "json"
	    	, data: {mPassword: $("#prespw").val() }
	    	, success: function(res) {
	    		if(res.isSameValue) {//비밀번호 일치 시
	    			location.href = "/user/mypage/changepw"
	    		} else {
	    			$("#checkPwMsg").html("비밀번호가 일치하지 않습니다.")
	    		}
	    	}
	    	, error: function() { console.log("비밀번호 일치 확인 실패") }
			
		})
		
	})
})
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>