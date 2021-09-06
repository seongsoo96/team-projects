<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">
.circle{
	display:inline-block;
	width: 200px;
	heihgt: 200px;
	border-radius:50%;
	background:#FFFFFF;
	border: 1px dotted #000;
	font-size: 16px;
	text-align:center;
	line-height:200px;
	margin: 0 8%;
}
.active{
	background:#00d3d3;
	border: 1px solid #00d3d3;
}
.col-lg-12{
	margin-bottom: 50px;
}
</style>
<div class="container">

<div class="circle">리워드선택</div>
<div class="circle">결제</div>
<div class="circle active">결제완료</div>
<h1>결제가 완료되었습니다.</h1>
<div class="text-center">
	<a href="/story?pNo=${project.pNo }"><button type="button" class="btn btn-primary">펀딩하기</button></a>
	<a href="/user/project/list"><button type="button" class="btn btn-primary">목록으로</button></a>
</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
