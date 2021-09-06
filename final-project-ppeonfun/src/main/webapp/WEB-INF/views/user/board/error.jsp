<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	setTimeout(function() {
		alert("메인페이지로 이동")
		location.href = "/main";
	}, 3100)
	
	var i = 3;
	setInterval(function() {
		$("#time").text(--i);
	}, 1000);
})
</script>

<style type="text/css">
.container{
 text-align : center;
 
}

</style>

<div class="container">

<h1 style="color: red;">게시판 에러</h1>
<hr>
게시판은 로그인 후 이용할 수 있습니다<br>

<span id="time">3</span>초후 메인화면으로 이동합니다...

</div><!-- .container --><br><br>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>