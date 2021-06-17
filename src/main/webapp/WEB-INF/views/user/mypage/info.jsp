<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.form-group div {margin-bottom:30px;}
.pre-nick, .pre-email, .email-auth, .pre-phone {display:inline-block; width:50%; margin-bottom:15px; }

/* 취소, 확인 버튼 */
#btnComplete, #btnCancle {background:#fff; border:1px solid #e0e0e0; font-weight:600; margin:0 3px;}
#btnComplete{color:#4EE2EC;}
#btnCancle{color:#ff8080;}
#btnComplete:hover, #btnCancle:hover {border:none; box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);}
#btnComplete:hover {background:#4EE2EC; color:#fff}
#btnCancle:hover {background:#ff8080; color:#fff}
#btnComplete:focus, #btnCancle:focus {outline:none;}

</style>
    
<div class="container">
	<h3>기본 정보 수정</h3>
	<hr>

	<form action="/user/mypage/info" method="post">
	<!-- 닉네임 -->
	<div class="form-group has-feedback" id="divNickname">
    	<label for="nickname" class="col-lg-2 control-label">별명</label>
        <div class="col-lg-10">
        	<span class="pre-nick-box">
        		<span class="pre-nick">${mNick }</span>
        		<button type="button" id="btnChangeNick" class="btn btn-default">별명 변경</button><br>
        	</span>
        	<span class="change-nick">
        		<input type="text" class="form-control" style="display:inline-block; width:50%;" id="nickname" name="mNick" data-rule-required="true" placeholder="새 별명 입력" maxlength="15">
				<span id="inputNickStatus" class="glyphicon form-control-feedback" style="top:38px; right:400px; "aria-hidden="true"></span>
            	<button type="button" id="btnNickCheck" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;" >닉네임 중복</button>
				<br><span id="nickmsg" style="color:#a94442;"></span>
			</span>
        </div>
    </div>
    
    <!-- 이메일 -->
    <div class="form-group has-feedback" id="divEmail">
    	<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
        <div class="col-lg-10">
        	<span class="pre-email-box">
        		<span class="pre-email">${mInfo.mEmail }</span>
        		<button type="button" id="btnChangeEmail" class="btn btn-default">이메일 변경</button><br>
        	</span>
        	<span class="change-email">
        		<input type="email" class="form-control" style="display:inline-block; width:50%;" id="email" name="mEmail" data-rule-required="true" placeholder="새 이메일 입력" maxlength="40">
 				<span id="inputEmailStatus" class="glyphicon form-control-feedback" style="top:40px; right:400px;" aria-hidden="true"></span>
        		<button type="button" id="btnEmailCheck" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;">이메일 중복</button>
        		<button type="button" id="btnEmail" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;" disabled>이메일 인증</button>
        		<br><span id="emailmsg" style="color:#a94442;"></span>
      		</span>
        </div>
    </div>
    
    <!-- 이메일 인증번호 입력란 -->
    <div class="form-group has-feedback" id="divEmailAuth">
    	<label for="emailAuth" class="col-lg-2 control-label">인증번호</label>
        <div class="col-lg-10">
        	<span class="email-auth">
				<input type="text" id="emailAuth"  class="form-control onlyNumber" style="display:inline-block; width:50%;" name="emailAuth" data-rule-required="true" placeholder="인증번호" maxlength="6">
				<span id="inputEmailAuthStatus" class="glyphicon form-control-feedback" style="right:585px;" aria-hidden="true"></span>
				<button type="button" id="btnEmailAuth" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;">인증하기</button>
				<br><span id="emailAuthMsg" style="color:#a94442;"></span>
			</span>
		</div>
    </div>
   
   	<!-- 휴대폰 번호-->
	<div class="form-group" id="divPhoneNumber">
		<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
		<div class="col-lg-10">
		<span class="pre-phone-box">
        		<span class="pre-phone">${mInfo.mPhone }</span>
        		<button type="button" id="btnChangePhone" class="btn btn-default">번호 변경</button><br>
        </span>
        <span class="change-phone">
			<input type="tel" class="form-control onlyNumber" id="phoneNumber" name="mPhone" style="width:50%;" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
        	<span id="inputPhoneStatus" class="glyphicon form-control-feedback" style="top:40px; right:400px;" aria-hidden="true"></span>
        	<br><span id="phoneMsg" style="color:#a94442;"></span>
        </span>
		</div>
    </div>
    
    <!-- 계좌 -->
     <div class="form-group" id ="divAccount">
		<label for="account" class="col-sm-2 control-label">계좌</label>
		<div class="col-lg-10">
			<span class="pre-bank-box">
				<span class="pre-bank">
					<input type="text" value="${mInfo.mBank  }" style="width:25%; text-align:center;" disabled="disabled"/>
					<input type="text" value="${mInfo.mAccount  }" style="width:25%; text-align:center;" disabled="disabled"/>
				</span>
				<button type="button" id="btnChangeBank" class="btn btn-default" style="height:35px;">계좌 변경</button><br>
			</span>
			<span class="change-bank form-inline">
				<select class="form-control" style="width:25%; margin:0;" id="bank" name="mBank">
					<option selected>은행</option>
					<option value="KB국민은행">KB국민은행</option>		  
					<option value="SC제일은행">SC제일은행</option>		
					<option value="경남은행">경남은행</option>			
					<option value="광주은행">광주은행</option>			
					<option value="기업은행">기업은행</option>			
					<option value="농협">농협</option>			
					<option value="대구은행">대구은행</option>			
					<option value="부산은행">부산은행</option>		
					<option value="산업은행">산업은행</option>			
					<option value="새마을금고">새마을금고</option>			
					<option value="수협">수협</option>			
					<option value="신한은행">신한은행</option>			
					<option value="신협">신협</option>			
					<option value="외환은행">외환은행</option>			
					<option value="우리은행">우리은행</option>			
					<option value="우체국">우체국</option>			
					<option value="전북은행">전북은행</option>			
					<option value="축협">축협 </option>			
					<option value="카카오뱅크">카카오뱅크</option> 		
					<option value="케이뱅크">케이뱅크</option>			
					<option value="하나은행(서울은행)">하나은행(서울은행)</option>		
					<option value="한국씨티은행(한미은행)">한국씨티은행(한미은행)</option> 
    			</select>
				<input type="text" class="form-control onlyNumber" id="account" name="mAccount" style="width:25%;" placeholder="계좌번호(숫자만)"/>
			</span>		
		</div>
    </div>

	<!-- 우편 주소 -->
    <div class="form-group" id="divPost">
		<label for="post" class="col-sm-2 control-label">우편주소</label>
		<div class="col-lg-10">
			<input type="text" class="form-control" style="display:inline-block; width:50%;" id="post" name="mPost" value="${mInfo.mPost }" readonly>
			<button type="button" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;" onclick="execDaumPostcode()">우편번호 찾기</button>
		</div>
	</div>
                
	<!-- 주소 -->
	<div class="form-group">
		<label for="address" class="col-sm-2 control-label">주소</label>
		<div class="col-lg-10">
			<input type="text" class="form-control" id="address" name="mAddress" value="${mInfo.mAddress }" style="width:80%;" readonly />
		</div>
	</div>
	
	<!-- 상세 주소 -->
    <div class="form-group" id="divDetailAddress">
		<label for="detailaddress" class="col-sm-2 control-label">상세 주소</label>
		<div class="col-lg-8">
			<input type="text" class="form-control" id="detailAddress" name="mDetailAddress"value="${mInfo.mDetailAddress }" disabled="disabled" />
			<span id="dAddressMsg" style="color:#a94442;"></span>
		</div>
		<div class="col-lg-2">
			<input type="text" class="form-control" id="extraAddress" placeholder="참고항목" readonly>
		</div>
	</div>  
	</form>	    
</div><!-- div.container -->

	<div class="text-center">
		<button type="button" class="btn" id="btnCancle">취소</button>
		<button type="button" class="btn" id="btnComplete">확인</button>
	</div>

<script type="text/javascript">
$(document).ready(function() {

	// 초기 값: 변경란 모두 hide
	$(".change-nick").hide()
	$("#inputNickStatus").hide()
	$("#divEmailAuth").hide()
	
	$(".change-email").hide()
	$("#inputEmailStatus").hide()
	
	$(".change-phone").hide()
	$(".change-bank").hide()

	$("#extraAddress").hide()
	
	//----------------------------------------------------
	
	//정규식
	$(".onlyNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        }
    });
	
	//----------------------------------------
	
	// '별명 변경' 클릭 시 '.change-nick' show()
	$("#btnChangeNick").click(function() {
		$(".change-nick").show()
		$("#nickname").focus()
	})
	
	// '이메일 변경' 클릭 시 '.change-email' show()
	$("#btnChangeEmail").click(function() {
		$(".change-email").show()
		$("#email").focus()
	})
	
	// '이메일 인증' 클릭 시 '#divEmailAuth' show()
	$("#btnEmail").click(function() {
		$("#divEmailAuth").show()
		$("#emailAuth").focus()
	})
	
	// '번호 변경' 클릭 시 '.change-phone' show()
	$("#btnChangePhone").click(function() {
		$(".change-phone").show()
		$("#phoneNumber").focus()
	})
	
	// '계좌 변경' 클릭 시 '.change-bank' show()
	$("#btnChangeBank").click(function() {
		$(".change-bank").show()
	})
	
	// '취소' 클릭 시 회원정보수정 페이지로 이동
	$("#btnCancle").click(function() {
		location.href = "/user/mypage/detail"
	})
	
	// '확인' 클릭 시 폼 데이터 전송
	$("#btnComplete").click(function() {
		
		//값이 수정되지 않은 경우 기존 값을 value로 삽입
		if($("#nickname").val() == "") {
			$("#nickname").val("${mNick }")
		} 
		
		if($("#email").val() == "") {
			$("#email").val("${mInfo.mEmail }")
		} 
		
		if($("#phoneNumber").val() == "") {
			$("#phoneNumber").val("${mInfo.mPhone }")
		} 
		
		if($("#bank").val() == "은행") {
			var prebank = "${mInfo.mBank }"
			console.log("기존은행:", prebank)
			
			$("#bank").val(prebank).prop('selected', true)
		} 
		
		if($("#account").val() == "") {
			$("#account").val("${mInfo.mAccount }")
		}
		
		if($("#detailAddress").val() == "") {
			$("#dAddressMsg").html("상세 주소를 입력해주세요.")
			return
		}
		
		$("form").submit()
	})
	
	
	//----------------------------------------
	
	// 닉네임 입력 value에 따른 class 변화 적용
	$("#nickname").keyup(function(event){
		var changeNick = $(".change-nick")
		
        if($.trim($("#nickname").val())==""){
        	changeNick.removeClass("has-success");
        	changeNick.addClass("has-error");
        }else{
        	changeNick.removeClass("has-error");
        	changeNick.addClass("has-success");
        }
    });
    
	// 이메일 입력 value에 따른 class 변화 적용
	$("#email").keyup(function(event){
		var changeEmail = $(".change-email")
		
        if($.trim($("#email").val())==""){
        	changeEmail.removeClass("has-success");
        	changeEmail.addClass("has-error");
        }else{
        	changeEmail.removeClass("has-error");
        	changeEmail.addClass("has-success");
        }
    });
    
	// 전화번호 입력 value에 따른 class 변화 적용
	$('#phoneNumber').keyup(function(event){
        var changePhone = $('.change-phone');
        
        if($.trim($("#phoneNumber").val())==""){
        	
        	changePhone.removeClass("has-success");
        	changePhone.addClass("has-error");
        	
        } else {
        	
        	changePhone.removeClass("has-error");
        	changePhone.addClass("has-success");
        }
    });
	
	//상세주소 입력 시 메시지 hide
	$("#detailAddress").keyup(function(event){
		$("#dAddressMsg").html("")
    });
	
	//----------------------------------------
	
    // '닉네임 중복' 클릭 시 중복 검사 실행
    $("#btnNickCheck").click(function() {
    	var changeNick = $(".change-nick")
    	var inputNickStatus = $("#inputNickStatus")
    	var msg = $("#nickmsg")
    	
    	inputNickStatus.show()
    	
    	$.ajax({
    		type: "post"
    		, url: "/user/member/nickCheck"
    		, dataType: "json"
    		, data: {mNick: $("#nickname").val()}
    		, success: function(res) {
    			
    			console.log("닉네임 중복 검사 성공")
    			console.log($("#nickname").val())
    			console.log("응답:", res)

    			if(res.isNick) {//중복이 아닌 경우
    				changeNick.removeClass("has-error");
    	        	changeNick.addClass("has-success");
    	        	
    	        	inputNickStatus.removeClass("glyphicon-remove");
    	        	inputNickStatus.addClass("glyphicon-ok");
    	        	
    	        	msg.html("")
    				
    				
    			} else {//중복인 경우
    				
    				changeNick.removeClass("has-error");
    	        	changeNick.addClass("has-success");
    	        	
    	        	inputNickStatus.removeClass("glyphicon-remove");
    	        	inputNickStatus.addClass("glyphicon-ok");
    	        	
    	        	changeNick.removeClass("has-success");
    				changeNick.addClass("has-error");
    				
    	        	inputNickStatus.removeClass("glyphicon-ok");
    	        	inputNickStatus.addClass("glyphicon-remove");
    	        	
    	        	msg.html("중복된 별명입니다.")
    			}
    		}
    		, error: function() { console.log("닉네임 중복 검사 실패") }
    	
    	})
    })
    
    // '이메일 중복' 클릭 시 중복 검사 실행
    $("#btnEmailCheck").click(function() {
    	var changeEmail = $(".change-email")
    	var inputEmailStatus = $("#inputEmailStatus")
    	var msg = $("#emailmsg")
    	
    	inputEmailStatus.show()
    	
    	$.ajax({
    		type: "post"
    		, url: "/user/member/email/check"
    		, dataType: "json"
    		, data: {email: $("#email").val()}
    		, success: function(res) {
    			
    			console.log("이메일 중복 검사 성공")
    			console.log($("#email").val())
    			console.log("응답:", res)

    			if(res.isEmail) {//중복인 경우
    				changeEmail.removeClass("has-success");
    				changeEmail.addClass("has-error");
    				
    				inputEmailStatus.removeClass("glyphicon-ok");
    				inputEmailStatus.addClass("glyphicon-remove");
    		
    				msg.html("중복된 이메일입니다.")
    				$("#btnEmail").attr("disabled", "disabled")
    				
    				
    			} else {//중복이 아닌 경우
    				changeEmail.removeClass("has-error");
    				changeEmail.addClass("has-success");
    	        	
    				inputEmailStatus.removeClass("glyphicon-remove");
    				inputEmailStatus.addClass("glyphicon-ok");
    				
    				msg.html("")
    				$("#btnEmail").removeAttr("disabled")
    				$("#emailAuth").removeAttr("disabled")
    			}
    		}
    		, error: function() { console.log("이메일 중복 검사 실패") }
    	
        	})
    })
    	
    	
    // '이메일 인증' 클릭 시 이메일로 인증번호 전송
    $("#btnEmail").click(function(){
   		$.ajax({
			type: "post"
			, url: "/user/member/email/send"
			, dataType: "json"
			, data: {
				email: $("#email").val()
			}
			, success: function(res){
	 				console.log("이메일로 인증 번호 전송 성공")
			}
	 		, error: function() {
	 			console.log("이메일로 인증 번호 전송 성공 실패");
	 		}
		})	
   	})
   	
   	
   	// '인증 하기' 클릭 시 인증번호 유효검사
   	$("#btnEmailAuth").click(function(){
    	var spanEmailAuth = $(".email-auth")
    	var inputEmailAuthStatus = $("#inputEmailAuthStatus")
    	var msg = $("#emailAuthMsg")
   		
   		$.ajax({
	 		type: "post"
	 		, url: "/user/member/email/auth"
	 		, dataType: "json"
	 		, data: {
	 			emailAuth: $("#emailAuth").val()
	 		}
	 		, success: function(res){
	 			
	 			if(res.isAuth){//인증 성공
	 				
	 				console.log("이메일 인증 완료");
	 				authNumber=true;
	 				
	 				spanEmailAuth.removeClass("has-error");
	 				spanEmailAuth.addClass("has-success");
	 				
	 				inputEmailAuthStatus.removeClass("glyphicon-remove");
	 				inputEmailAuthStatus.addClass("glyphicon-ok");
    				
    				msg.html("")
    				$("#emailAuth").attr("disabled", "disabled")
    				$("#btnEmail").attr("disabled", "disabled")
	 	   			
	 			} else { //인증 실패
	 				
	 				console.log("이메일 인증 실패");
	 				authNumber=false;
	 				
	 				spanEmailAuth.removeClass("has-success");
	 				spanEmailAuth.addClass("has-error");
	 				
	 				inputEmailAuthStatus.removeClass("glyphicon-ok");
	 				inputEmailAuthStatus.addClass("glyphicon-remove");
    				
    				msg.html("유효하지 않은 인증번호입니다.")
	 			}
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	})  		
   	})
   	 	
   	
})
</script>
<script type="text/javascript">
function execDaumPostcode() {
    
	$("#detailAddress").removeAttr("disabled")
	$("#detailAddress").val("")
	$("#extraAddress").show()
	
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>