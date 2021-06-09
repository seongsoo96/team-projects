<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">
/* 탈퇴 전 확인 */
.unsub-wrap {width:100%; margin:0 25%;}
.unsub-wrap .first-step {border-bottom:1px solid #eee; width:440px;}
.unsub-wrap .first-step span {display:inline-block;}

dt {font-size:15px; margin-top:20px;}
dd {font-size:13px; border-bottom:1px solid #eee; width:440px; margin:5px 0;}

/* 체크박스 */
input[id="checkAgree"] {display:none;}
input[id="checkAgree"] + label {display:inline-block; width:20px; height:20px; border:1px solid #eee; cursor:pointer; vertical-align:bottom; margin:0;}
input[id="checkAgree"]:checked + label {background-color:#4EE2EC;}

/* 버튼 스타일 */
#btnStepTwo {
	background-color:#4EE2EC;
	color:white;
	width:150px;
	height:50px;
	font-size:16px;
	font-weight:600;
	margin:5px 0 60px;
}

/* 모달 */
.modalMsg {display:inline-block; font-size:15px; margin:30px 0; padding:0 25px;}
#btnModalComplete {background-color:#4EE2EC; color:white;}

/* 이메일 폼 */
.form-group {margin: 20px 0;}
</style>
<div class="container">
	<!-- 모달창 -->
	<div class="modal fade" id="agreeModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body form-inline">
					<div class="form-group text-center">
						<span class="modalMsg">탈퇴 전 유의사항을 확인해 주세요.</span><br>
						<button type="button" class="btn" id="btnModalComplete">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<h2>회원탈퇴</h2>
	<hr>

	<!-- 탈퇴 전 확인 -->
	<div class="unsub-wrap">
	<h3>탈퇴 전 꼭 확인하세요!</h3>
		<p class="first-step">
			<span style="margin-top:5px;">탈퇴 전 반드시 아래 유의 사항을 확인하시기 바랍니다.</span><br>
			<span style="margin:5px 0; color:red;">참여·모집 중인 프로젝트가 있을 경우 탈퇴가 불가능합니다.</span>
		</p>
		<dl>
			<dt>탈퇴 후 개인 정보 1년 보관</dt>
			<dd>참여한/찜 한/개설 중인 프로젝트 및 쿠폰, 포인트 등 개인 정보 1년 보관</dd>
			
			<dt>탈퇴 후 작성한 게시물은 삭제 불가</dt>
			<dd>게시글, 댓글, 펀딩한 프로젝트의 투자 리스트에 남겨진 이름 등 삭제 불가</dd>
			
			<dt>미상환 투자금 환급 불이익 감수</dt>
			<dd>아직 상환되지 않은 투자금이 있을때, 투자금을 돌려받지 못할 불이익과 위험 감수</dd>
		</dl>
		<p>
			<input type="checkbox" id="checkAgree">
			<label for="checkAgree"><span class="glyphicon glyphicon-ok" id="okicon" style="top:-1px; left:2px; color:white"></span></label>
			<span style="font-size:15px; padding-left:3px;">상기 펀뻔 탈퇴 시 유의 사항을 확인하였습니다.</span>
		</p>
	</div><!-- div.unsub-wrap -->
	
	
	<!-- 본인 확인 -->
	<div class="unsub-wrap">
	<h3 style="margin:80px 0 10px;">본인 확인</h3>
		<p style="font-size:16px;">안전한 탈퇴를 위해 본인 인증 절차를 진행합니다. 본인확인하기 버튼을 클릭해주세요.</p>
		<button type="button" id="btnStepTwo" class="btn">본인 확인하기</button>
		
		<div class="step-two-box form-inline">
			<div class="form-group">
				<input type="text" class="form-control" value="${mEmail }" disabled="disabled">
				<button type="button" class="btn" id="btnResend">재전송</button>		
			</div>
			<br>
			<div class="form-group has-feedback">
				<input type="text" class="form-control" id="emailAuth" placeholder="인증번호 입력"/>
				<span id="inputEmailAuthStatus" class="glyphicon form-control-feedback" style="right:90px;" aria-hidden="true"></span>
				<button type="button" class="btn" id="btnEmailAuth">인증 확인</button>	
			</div>	
			<br>
			<button type="button" class="btn btn-danger" id="btnUnsub" disabled="disabled" style="margin:10px 0 50px;">회원탈퇴</button>	
		</div>		
	</div><!-- div.unsub-wrap -->
	
</div><!-- div.container  -->

<script type="text/javascript">
$(document).ready(function() {

	//체크 아이콘 숨기기
	$("#okicon").hide()
	
	$(".step-two-box").hide()
	$("#inputEmailAuthStatus").hide()
	$("#btnUnsub").hide()
	
	//체크박스 변화에 따른 이벤트
	$("#checkAgree").change(function() {
		if($("#checkAgree").is(":checked")) {
			console.log('체크 완료')
			$("#okicon").show()
		} else {
			console.log('체크 해제')
			$("#okicon").hide()
		}
	})
	
	//'본인 확인하기' 버튼 클릭시
	$("#btnStepTwo").click(function() {
		
		//체크박스 상태 확인
		if($("#checkAgree").is(":checked")) {
			
			$("#btnStepTwo").hide()
			$(".step-two-box").show()
			$("#inputEmailAuthStatus").show()
			
			//ajax로 이메일 전송
			$.ajax({
				type: "post"
				, url: "/user/member/email/send"
				, dataType: "json"
				, data: {
					email: "${mEmail }"
				}
				, success: function(res){
			 			console.log("이메일로 인증 번호 전송 성공")
				}
			 	, error: function() {
			 		console.log("이메일로 인증 번호 전송 성공 실패");
			 	}
			})
			
		} else {
			$("#agreeModal").modal('toggle')
		}
	})
	
	//모달에서 '확인' 버튼 클릭 시
	$("#btnModalComplete").click(function() {
		$('#agreeModal').modal('hide')
	})
	
	// '재전송' 버튼 클릭시
	$("#btnResend").click(function() {
		
		$.ajax({
			type: "post"
			, url: "/user/member/email/send"
			, dataType: "json"
			, data: {
				email: "${mEmail }"
			}
			, success: function(res){
		 			console.log("이메일로 인증 번호 전송 성공")
			}
		 	, error: function() {
		 		console.log("이메일로 인증 번호 전송 성공 실패");
		 	}
		})		
	})
	
	// '인증 확인' 클릭 시
	$("#btnEmailAuth").click(function() {
		var $hasfeedback = $(".has-feedback")
		console.log($hasfeedback)

		var inputEmailAuthStatus = $("#inputEmailAuthStatus")
		
		$.ajax({
	 		type: "post"
	 		, url: "/user/member/email/auth"
	 		, dataType: "json"
	 		, data: {
	 			emailAuth: $("#emailAuth").val()
	 		}
	 		, success: function(res){
	 			//인증 성공
	 			if(res.isAuth){
	 				console.log("이메일 인증 완료");
	 				
	 				$hasfeedback.removeClass("has-error");
	 				$hasfeedback.addClass("has-success");
	 				
	 				inputEmailAuthStatus.removeClass("glyphicon-remove");
	 				inputEmailAuthStatus.addClass("glyphicon-ok");
	 				
	 				$("#emailAuth").attr("disabled", "disabled")
	 				$("#btnUnsub").show()
	 				$("#btnUnsub").removeAttr("disabled")
    				
	 			} else { //인증 실패
	 				console.log("이메일 인증 실패");
	 				
	 				$hasfeedback.removeClass("has-success");
	 				$hasfeedback.addClass("has-error");
	 				
	 				inputEmailAuthStatus.removeClass("glyphicon-ok");
	 				inputEmailAuthStatus.addClass("glyphicon-remove");
    				
	 			}
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	})
	})
	
	//회원 탈퇴 클릭 시
	$("#btnUnsub").click(function() {
		$.ajax({
			type: "post"
			, url: "/user/mypage/unsubscribe"
			, dataType: "json"
			, success: function() { 
				console.log("탈퇴 요청 성공")
				var isSocialKakao = "${isSocialKakao }"
				
				if( isSocialKakao ) {//카카오 가입자
					console.log("카카오 탈퇴진행 예정")
					location.href= "/user/member/kakao/logout"
				} else {//사이트 가입자
					console.log("사이트 탈퇴진행 예정")
					location.href= "/user/member/logout"
				}
			}
			, error: function() { console.log("탈퇴 요청 실패") }
		})
	})
})
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>