<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">

.container {
    width: 980px;
}
#loginForm {
	width: 400px;
	margin: 100px auto;
}
.button{
	width: 75%;
	height: 45px;
	margin: 5px 15px;
}
.img{
	width:100%
}
#btnKaKao{
	background: url(/resources/img/kakaoLoginLarge.png) no-repeat;
	height: 45px;
}

</style>
 <script type="text/javascript">
$(document).ready(function() {
	//페이지 첫 접속 시 입력창으로 포커스 이동
	$("input").eq(0).focus();
	
	//패스워드 입력 창에서 엔터 입력 시 form submit
	$("input").eq(1).keydown(function(key) {
		if(key.keyCode == 13) {
			$(this).parents("form").submit();
		}
	})

	//로그인 버튼 클릭 시 form submit
	$("#btnLogin").click(function() {
		$(this).parents("form").submit();
	})
	
	//취소 버튼 누르면 뒤로가기
	$("#btnCancel").click(function() {
		history.go(-1);
	})

});
</script>

<div class="container">
	
	<div>
		<form id="loginForm" action="/user/member/login" method="post">
			<div class="form-group">
				<h2>로그인</h2>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label for="mId">아이디</label>
					<input type="text" class="form-control" id="mId" name="mId" placeholder="아이디를 입력하세요"/><br>
				</div>
				<div class="col-sm-10">
					<label for="mPassword">비밀번호</label>
					<input type="password" class="form-control" id="mPassword" name="mPassword" placeholder="비밀번호(영문, 숫자, 특수 문자 포함 8자 이상)"/><br>
				</div>
			</div>
			<button type="button" id="btnLogin" class="btn btn-primary button">로그인</button>
	     	<button type="button" id="btnCancel" class="btn btn-danger button">뒤로가기</button>
			<button type="button" id="btnKaKao" class="btn button button"></button>

			<div class="form-group">
   					<div class="col-sm-10">
		      			<a href="#">회원가입</a> |
		      			<a href="#">아이디 찾기</a> |
		      			<a href="#">비밀번호 재설정</a>
    				</div>
    		</div>
		</form>
	</div>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>