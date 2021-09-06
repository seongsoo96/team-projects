<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">

.container {
    width: 980px;
}
#idCheckForm {
	width: 400px;
	margin: 100px auto;
}
.button{
	width: 75%;
	height: 45px;
	margin: 5px 15px;
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
		<form id="idCheckForm" action="/user/member/password/reset" method="get">
			<div class="form-group">
				<h2>아이디 입력</h2>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label for="mId">아이디</label>
					<input type="text" class="form-control" id="mId" name="mId" placeholder="아이디를 입력하세요"/><br>
				</div>
			</div>
			<button type="button" id="btnLogin" class="btn btn-primary button">아이디 확인</button>
	     	<button type="button" id="btnCancel" class="btn btn-danger button">뒤로가기</button>
		</form>
	</div>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>