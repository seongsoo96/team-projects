<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<style type="text/css">
.container{
 text-align : center;
 
}

</style>

<div class="container">

<h1 style="color: red;">405 에러페이지</h1>
<hr>
<img src="/resources/img/405.PNG" width="800" height="500"/><br>

<span id="time">5초후 메인화면으로 이동합니다...</span>

</div><!-- .container --><br><br>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>