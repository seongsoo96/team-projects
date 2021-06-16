<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	requirementView(${info.pNo})	
});
</script>


<style type="text/css">
/* 전체 영역 */
.container {
	margin-top: 0;
}

hr {
	margin-top: 5px;
	margin-bottom: 5px;
}

#left {
	/* 영역 확인용 */
	float: left;
	width: 65%;
	height: 400px;
/* 	margin-left: 5px; */
/* 	padding-left: 10px; */
}

#right {
	/* 영역 확인용 */
/* 	border: 1px solid green;  */
	float: right;
	width: 30%;
	height: 400px;
	margin-right: 15px;
	padding-top: 15px;
}


/* 펀딩하기, 환불하기 버튼 감싸는 div */
#right .alarm, #right .back, #right .report {
	width: 100%;
	margin-bottom: 15px;
	padding-top: 10px;
}

#right .refund {
	margin-top: -15px;
}

#right .alarm .btn_alarm, #right .back .btn_back{
	background-color: #4EE2EC;
	color: white;
	border-color: #4EE2EC;
	width: 100%;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	height: 48px;
	font-size: 20px;
	font-weight: 400;
	vertical-align: middle;
	box-sizing: border-box!important;
}

#right .alarm .btn_alarm_cancel {
	background-color: #FF4229;
	color: white;
	border-color: #FF4229;
	width: 100%;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	height: 48px;
	font-size: 20px;
	font-weight: 400;
	vertical-align: middle;
	box-sizing: border-box!important;
}

#right .report .btn_report {
	background-color: #CCC;
	color: white;
	border-color: #CCC;
	width: 100%;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	height: 48px;
	font-size: 20px;
	font-weight: 400;
	vertical-align: middle;
	box-sizing: border-box!important;
}


</style>

<div class="container">
<br><br><hr>

<div id="titleHeader">
<!-- 	<div class="titleBg" style="background-image: -->
<!-- 		url('/resources/img/test1.png')"> -->
<!-- 	</div> -->
	<p class="text-center">${info.iCategory }</p>
	<p class="lead text-center">${info.iTitle }</p>
</div> <hr>

<div id="left" class="form-group">
	<c:import url="/WEB-INF/views/user/project/story/storyPaging.jsp"></c:import>
</div><!-- #left end -->


<div id="right">
	<div class="alarm">
		<c:choose>
			<c:when test="${check }"><a href="/user/open/alarm?pNo=${info.pNo }"><button class="btn_alarm">알림신청하기</button></a></c:when>
			<c:otherwise><a href="/user/open/alarm?pNo=${info.pNo }"><button class="btn_alarm_cancel">알림취소하기</button></a></c:otherwise>
		</c:choose>
		
		
	</div>
	<div class="back">
		<a href="/user/open/list"><button class="btn_back">돌아가기</button></a>
	</div>
	
	<div class="report">
		<a href="/user/payback/view?pNo=${info.pNo }"><button class="btn_report">신고하기</button></a>
	</div>
</div><!-- #right end --> 


<div style="clear: both;"></div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
