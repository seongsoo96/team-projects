<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 기본 정보 수정, 비민번호 변경 버튼*/
.text-center div {font-size:18px; margin:50px 0;}
.text-center div button {background:none; border:1px solid rgba(0,0,0, 0.2); border-radius:5px; width:180px; height:40px;}
.text-center div button:hover {color:#4EE2EC;}
</style>

<div class="container">
	<h3>회원정보수정</h3>
	<hr>
	
	<div class="text-center">
		<div><button type="button" id="default-info">기본 정보 수정</button></div>
		<div><button type="button" id="changepw">비밀번호 변경</button></div>
		<a href="/user/mypage/unsubscribe">회원탈퇴</a>	
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	//'기본 정보 수정' 버튼 클릭 했을 때
	$("#default-info").click(function() {
		location.href = "/user/mypage/info"
	})
	
	//'비밀번호 변경' 버튼 클릭 했을 때
	$("#changepw").click(function() {
		location.href = "/user/mypage/chpw"
	})
})
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>