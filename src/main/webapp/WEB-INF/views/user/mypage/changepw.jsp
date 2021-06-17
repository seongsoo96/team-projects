<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
div.form-group {height:90px; margin:0;}

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
	<h3>비밀번호 변경</h3>
	<hr>
	
	<form action="/user/mypage/changepw" method="post">
	
	<div style="margin: 0 0 0 200px;">
	<!-- 새 비밀번호 -->
	<div class="form-group has-feedback" id="divPassword">
    	<label for="newpw" class="col-lg-2 control-label">새 비밀번호</label>
        <div class="col-lg-10">
        	<span class="change-pw">
        		<input type="password" class="form-control passwordReg" style="display:inline-block; width:50%;" id="newpw" name="mPassword" data-rule-required="true" autocomplete="off" maxlength="30">
				<span id="newPwStatus" class="glyphicon form-control-feedback" style="right:320px; "aria-hidden="true"></span>
				<br><span id="newpwMsg" style="display:inline-block; margin:10px 0;">최소 8자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자</span>
			</span>
        </div>
    </div>
    
	<!-- 비밀번호 확인 -->
	<div class="form-group has-feedback" id="divPasswordCheck">
    	<label for="checknewpw" class="col-lg-2 control-label">비밀번호 확인</label>
        <div class="col-lg-10">
        	<span class="check-change-pw">
        		<input type="password" class="form-control" style="display:inline-block; width:50%;" id="checknewpw" data-rule-required="true" autocomplete="off" maxlength="30">
				<span id="checkNewpwStatus" class="glyphicon form-control-feedback" style="right:320px; "aria-hidden="true"></span>
				<br><span id="checkNewpwMsg" style="color:#a94442;"></span>
			</span>
        </div>
    </div>
    
    </div>
    </form>
    
    <div class="text-center">
    	<button type="button" id="btnCancle" class="btn">취소</button>
    	<button type="button" id="btnComplete" class="btn">확인</button>
    </div>
</div><!-- div.container -->

<script>
$(document).ready(function() {
	$("#newpw").focus()
	
	var regExPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 정규식
	
	//새 비밀번호
	$('#newpw').blur(function(event){
    	console.log('새 비밀번호 blur 이벤트 시작')
        var changePw = $(".change-pw")
        var newPwStatus = $("#newPwStatus")
    	
        if(!regExPw.test($("#newpw").val())){
        	
        	$('#newpw').val("");

        	changePw.removeClass("has-success");
        	changePw.addClass("has-error");
        	
        	newPwStatus.removeClass("glyphicon-ok");
        	newPwStatus.addClass("glyphicon-remove");
        	
        } else {
        	
        	changePw.removeClass("has-error");
        	changePw.addClass("has-success");
        	
        	newPwStatus.removeClass("glyphicon-remove");
        	newPwStatus.addClass("glyphicon-ok");
        }
       
    });
	
	//비밀번호 확인
	$('#checknewpw').keyup(function(event){
    	console.log('비밀번호 확인 keyup 이벤트 시작')
        var checkChangePw = $(".check-change-pw")
        var checkNewpwStatus = $("#checkNewpwStatus")
    	
        //확인란이 빈 문자열이거나 새 비밀번호 입력 값과 같지 않을 때
        if( $("#checknewpw").val() == "" || $("#checknewpw").val() != $("#newpw").val() ) {
        	
        	checkChangePw.removeClass("has-success");
        	checkChangePw.addClass("has-error");
        	
        	checkNewpwStatus.removeClass("glyphicon-ok");
        	checkNewpwStatus.addClass("glyphicon-remove");
        	
        } else {
        	
        	checkChangePw.removeClass("has-error");
        	checkChangePw.addClass("has-success");
        	
        	checkNewpwStatus.removeClass("glyphicon-remove");
        	checkNewpwStatus.addClass("glyphicon-ok");
        }
       
    });
	
	// '취소' 버튼 클릭 시 정보 수정 페이지로 이동
	$("#btnCancle").click(function() {
		location.href = "/user/mypage/detail"
	})
	
	// '확인' 버튼 클릭 시 폼 데이터 전송
	$("#btnComplete").click(function() {
		var newpwClass = $("#newPwStatus").attr("class").split(" ")[2]
		console.log("클래스확인1", newpwClass)
		
		var checknewpwClass = $("#checkNewpwStatus").attr("class").split(" ")[2]
		console.log("클래스확인2", checknewpwClass)
		if(newpwClass == "glyphicon-ok" && checknewpwClass == "glyphicon-ok") {
			$("form").submit()
		}
	})
	
})
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>