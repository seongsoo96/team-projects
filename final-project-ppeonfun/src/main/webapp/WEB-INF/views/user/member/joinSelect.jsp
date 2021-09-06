<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type= "text/css">
.container {
    width: 980px;
}
#btnKaKao{
	background: url(/resources/img/kakaoLoginLarge.png) no-repeat;
	height: 45px;
}
.button{
	width: 75%;
	height: 45px;
	margin: 5px 15px;
}
.signup-form{
	width: 400px;
	margin: 100px auto;
}
h3{
	margin-bottom: 80px;
	margin-left: 20px;
}
</style>
 <script type="text/javascript">
$(document).ready(function() {
	//페이지 첫 접속 시 입력창으로 포커스 이동
	$("input").eq(0).focus();
	
	//로그인 버튼 클릭 시 form submit
	$("#btnJoin").click(function() {
		$(location).attr("href", "/user/member/joinForm")
	})
	$("#btnKaKao").click(function(){
		$(location).attr("href", "/user/member/kakao/loginForm")
	})
	
	//취소 버튼 누르면 뒤로가기
	$("#btnCancel").click(function() {
		history.go(-1);
	})

});
</script>
<div class="container">

<div class="signup-form">
	<h3>회원가입</h3>
	<button type="button" id="btnJoin" class="btn btn-primary button">사이트 회원가입</button>
	<button type="button" id="btnCancel" class="btn btn-danger button">뒤로가기</button>
	<button type="button" id="btnKaKao" class="btn button"></button>
</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>