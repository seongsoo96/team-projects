<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
.form-group div {margin-bottom:30px;}
.pre-nick, .pre-email, .email-auth, .pre-phone {display:inline-block; width:50%; margin-bottom:15px; }
</style>
    
<div class="container">
	<h3>기본 정보 수정</h3>
	<hr>
	
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
				<span id="inputEmailAuthStatus" class="glyphicon form-control-feedback" style="right:645px;" aria-hidden="true"></span>
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
			<span class="change-bank">
				<select class="form-control" style="width:25%; margin:0;" id="bank" name="mBank">
					<option>KB국민은행</option>		  
					<option>SC제일은행</option>		
					<option>경남은행</option>			
					<option>광주은행</option>			
					<option>기업은행</option>			
					<option>농협</option>			
					<option>대구은행</option>			
					<option>부산은행</option>		
					<option>산업은행</option>			
					<option>새마을금고</option>			
					<option>수협</option>			
					<option>신한은행</option>			
					<option>신협</option>			
					<option>외환은행</option>			
					<option>우리은행</option>			
					<option>우체국</option>			
					<option>전북은행</option>			
					<option>축협 </option>			
					<option>카카오뱅크</option> 		
					<option>케이뱅크</option>			
					<option>하나은행(서울은행)</option>		
					<option>한국씨티은행(한미은행)</option> 
    			</select>
				<input type="text" class="form-control onlyNumber" id="account" name="mAccount" style="width:25%;" placeholder="계좌번호(숫자만)"/>
			</span>		
		</div>
     </div>
    
    
    
    
    
    
    

</div><!-- div.container -->

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
<c:import url="/WEB-INF/views/layout/footer.jsp"/>