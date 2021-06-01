<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type= "text/css">
.container {
    width: 980px;
}
.idfind-form{
	width: 550px;
	margin: 100px auto;
}
.button{
	width: 100%;
	height: 45px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	var modalContents = $(".modal-contents");
	var modal = $("#defaultModal");
	var authNumber = false;
	
	$( "form" ).submit(function( event ) {
		//이메일
        if(!authNumber){
            modalContents.text("인증을 완료해주세요");
            modal.modal('show');

            $('#emailAuth').focus();
            return false;
        }
	})
	
	$("#btnEmail").click(function(){
   		var email = $("#email").val();
   		$("#email").attr("readonly", true);
   		$.ajax({
	 		type: "post"
	 		, url: "/user/member/email"
	 		, dataType: "json"
	 		, data: {
	 			email: email
	 		}
	 		, success: function(res){
	 			
	 			console.log("success")
	 			console.log(res)
	 			console.log(res.authKey);
	 			
	 			$("#authNumber").attr("value", res.authKey);
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});		
   	})
   	
   	$("#btnEmailAuth").click(function(){
   		var divEmailAuth = $('#divEmailAuth');
   		if($("#authNumber").val() == $("#emailAuth").val()){
   			console.log("인증 완료");
   			authNumber=true;
   			$("#emailAuth").attr("readonly", true);
   			divEmailAuth.removeClass("has-error");
   			divEmailAuth.addClass("has-success");
   		}else{
   			authNumber=false;
   			divEmailAuth.removeClass("has-success");
   			divEmailAuth.addClass("has-error");
   		}
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
    <h3>아이디 찾기</h3>
	<form action="/user/member/idFind" method="post">
	<input type="hidden" id="authNumber" name="authNumber" /> 
	<div class="idfind-form">
		<div class="form-group" id="divEmail">
			<label for="email" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-10">
				<input type="email" class="form-control col-lg-7" style="display: inline-block; width: 70%;" id="email" name="mEmail" data-rule-required="true" placeholder="이메일" maxlength="40">
				<button type="button" id="btnEmail" class="btn btn-default col-lg-3" style="padding-top: 5px; margin-bottom: 5px; margin-left: 21px;">인증번호 발송</button>
			</div>
		</div>

		<div class="form-group" id="divEmailAuth">
			<label for="emailAuth" class="col-lg-2 control-label">인증번호</label>
			<div class="col-lg-10">
				<input type="text" id="emailAuth" class="form-control onlyNumber col-lg-7"style="display: inline-block; width: 70%;" name="emailAuth"data-rule-required="true" placeholder="인증번호" maxlength="6">
				<button type="button" id="btnEmailAuth" class="btn btn-default col-lg-3"style="padding-top: 5px; margin-bottom: 5px; margin-left: 21px;">인증하기</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-12">
				<button type="submit" id="btnFind" class="btn button btn-default col-lg-12" style="padding-top: 5px; margin-bottom: 5px;">아이디 찾기</button>
			</div>
		</div>
	</div>
	</form>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>