<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type= "text/css">
.container {
    width: 980px;
}
.idfind-form{
	width: 670px;
	margin: 100px auto;
}
.button{
	width: 100%;
	height: 45px;
	margin-top : 5px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var modalContents = $(".modal-contents");
	var modal = $("#defaultModal");
	var authNumber = false;
	var regExPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 정규식
	$('#mPassword').blur(function(event){
    	console.log('blur')
        var divPassword = $('#divPassword');
         
        if(!regExPw.test($("#mPassword").val())){
        	$('#mPassword').val("");
        	
        	divPassword.removeClass("has-success");
            divPassword.addClass("has-error");
        }else{
        	divPassword.removeClass("has-error");
            divPassword.addClass("has-success");
        }
       
    });
    
    $('#passwordCheck').keyup(function(event){
        
        var passwordCheck = $('#passwordCheck').val();
        var password = $('#mPassword').val();
        var divPasswordCheck = $('#divPasswordCheck');
        
        if((passwordCheck=="") || (password!=passwordCheck)){
            divPasswordCheck.removeClass("has-success");
            divPasswordCheck.addClass("has-error");
        }else{
            divPasswordCheck.removeClass("has-error");
            divPasswordCheck.addClass("has-success");
        }
    });
	
	$( "form" ).submit(function( event ) {
		var divPassword = $('#divPassword');
	    var divPasswordCheck = $('#divPasswordCheck');
		
	  //패스워드 검사
        if($('#mPassword').val()==""){
            modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divPassword.removeClass("has-success");
            divPassword.addClass("has-error");
            $('#mPassword').focus();
            return false;
        }else{
            divPassword.removeClass("has-error");
            divPassword.addClass("has-success");
        }
        
        //패스워드 확인
        if($('#passwordCheck').val()==""){
            modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divPasswordCheck.removeClass("has-success");
            divPasswordCheck.addClass("has-error");
            $('#passwordCheck').focus();
            return false;
        }else{
            divPasswordCheck.removeClass("has-error");
            divPasswordCheck.addClass("has-success");
        }
        
        //패스워드 비교
        if($('#mPassword').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
            modalContents.text("패스워드가 일치하지 않습니다.");
            modal.modal('show');
            
            divPasswordCheck.removeClass("has-success");
            divPasswordCheck.addClass("has-error");
            $('#passwordCheck').focus();
            return false;
        }else{
            divPasswordCheck.removeClass("has-error");
            divPasswordCheck.addClass("has-success");
        }
	    
		//이메일 인증
        if(!authNumber){
            modalContents.text("인증을 완료해주세요");
            modal.modal('show');

            $('#emailAuth').focus();
            return false;
        }
	})
	
	$("#btnEmail").click(function(){
   		var email = $("#email").val();
   		$.ajax({
	 		type: "post"
	 		, url: "/user/member/email/send"
	 		, dataType: "json"
	 		, data: {
	 			email: email
	 		}
	 		, success: function(res){
	 			
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});		
   	})
   	
   	$("#btnEmailAuth").click(function(){
   		var divEmailAuth = $('#divEmailAuth');
   		var authKey = $("#emailAuth").val();
   		
   		$.ajax({
	 		type: "post"
	 		, url: "/user/member/email/auth"
	 		, dataType: "json"
	 		, data: {
	 			emailAuth: authKey
	 		}
	 		, success: function(res){
	 			//인증 성공
	 			if(res.isAuth){
	 				console.log("인증 완료");
	 				authNumber=true;
	 	   			$("#emailAuth").attr("readonly", true);
	 	   			divEmailAuth.removeClass("has-error");
	 	   			divEmailAuth.addClass("has-success");
	 			}else{ //인증 실패
	 				authNumber=false;
	 	   			divEmailAuth.removeClass("has-success");
	 	   			divEmailAuth.addClass("has-error");
	 			}
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});
   		
   	})

});

</script>
<div class="container">
	<div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr/>
    <h3>비밀번호 재설정</h3>
	<form action="/user/member/password/reset" method="post"> 
	
	<div class="idfind-form">
		<div class="form-group" id="divEmail">
			<label for="email" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-10">
				<input type="email" class="form-control col-lg-7" style="display: inline-block; width: 70%;" id="email" name="mEmail" data-rule-required="true" value="${member.mEmail}" readonly>
				<button type="button" id="btnEmail" class="btn btn-default col-lg-3" style="padding-top: 5px; margin-bottom: 5px; margin-left: 21px;">인증번호 발송</button>
			</div>
		</div>

		<div class="form-group" id="divEmailAuth">
			<label for="emailAuth" class="col-lg-2 control-label">인증번호</label>
			<div class="col-lg-10">
				<input type="text" id="emailAuth" class="form-control onlyNumber col-lg-7"style="display: inline-block; width: 70%;" name="emailAuth"data-rule-required="true" placeholder="인증번호" maxlength="6">
				<button type="button" id="btnEmailAuth" class="btn btn-default col-lg-3" style="padding-top: 5px; margin-bottom: 5px; margin-left: 21px;">인증하기</button>
			</div>
		</div>
		<div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control passwordReg" style="padding-top: 5px; margin-bottom: 5px;" id="mPassword" name="mPassword" data-rule-required="true" placeholder="최소 8자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자" maxlength="30">
                    </div>
                </div>
       <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" style="padding-top: 5px; margin-bottom: 5px;" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                    </div>
        </div>
		<div class="form-group">
			<div class="col-lg-12">
				<button type="submit" id="btnPassword" class="btn button btn-default col-lg-12" style="padding-top: 5px; margin-bottom: 5px;">비밀번호 재설정</button>
			</div>
		</div>
	</div>
	</form>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
