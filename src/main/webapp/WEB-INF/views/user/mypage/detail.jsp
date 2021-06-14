<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 상단 메뉴 - 홈 아이콘 */
.fa-house-user {font-size:30px; position:relative; left:650px;}

/* 기본 정보 수정, 비민번호 변경 버튼*/
.text-center div {font-size:18px; margin:50px 0;}
.text-center div button {background:none; border:1px solid rgba(0,0,0, 0.2); border-radius:5px; width:180px; height:40px;}
.text-center div button:hover {color:#4EE2EC;}
</style>

<div class="container">
	<!-- 비밀번호 확인 모달창 -->
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
	
	<!-- 회원 탈퇴 불가 모달창 -->
	<div class="modal fade" id="unsubCancleModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body form-inline">
					<div class="form-group text-center" style="width:100%;">
						<div class="modalMsg">현재 참여중인 프로젝트가 있어<br> 탈퇴가 불가능합니다.</div>
						<button type="button" class="btn" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	<h2 style="display:inline-block">회원정보수정</h2>
	<span><a href="/user/mypage/home"><i class="fas fa-house-user"></i></a></span>
	<hr>
	
	<div class="text-center" style="height:250px;">
		<div><button type="button" id="default-info">기본 정보 수정</button></div>
		<div><button type="button" id="changepw" data-toggle="modal" data-target="#pwModal">비밀번호 변경</button></div>
		<div><button type="button" id="btnUnsub" style="border:none; font-size:14px; text-decoration:underline;">회원탈퇴</button>	</div>
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
	
	// '회원 탈퇴' 클릭 시 ajax로 참여중인 프로젝트 조회
	$("#btnUnsub").click(function() {
		console.log("회원 탈퇴 클릭!")
		$.ajax({
			type: "post"
	    	, url: "/user/mypage/unsubscribe/ajax"
	    	, dataType: "json"
	    	, success: function(res) {
	    		
	    		if(res.hasProject) {//참여중인 프로젝트가 있는 경우
	    			console.log('탈퇴 불가')
	    			$('#unsubCancleModal').modal('toggle')
	    		} else {
	    			console.log('탈퇴 가능')
	    			location.href="/user/mypage/unsubscribe"
	    		}
	    	}
	    	, error: function() { console.log("회원 탈퇴 ajax 요청 실패") }
			
		})
	})
	
	//$("#btnUnsubComplete").click(function() {})
})
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>