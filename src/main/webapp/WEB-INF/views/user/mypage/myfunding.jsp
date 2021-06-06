<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
.selectMyFund {text-align-last:center; font-size:17px; width:150px; height:35px; margin:0 45% 50px;}
.thumbnail img {width:80%; height:200px; margin-top:20px; border:1px solid coral;}

</style>

<div class="container">
	<h2>펀딩하기</h2>
	<div>
		<span><a href="/user/mypage/myfunding">나의 펀딩</a></span>
		<span><a href="/user/mypage/fundingchart">펀딩 내역</a></span>
	</div>
	<hr>
	
	<select class="selectMyFund">
		<option selected>최근 펀딩</option>
		<option>전체 펀딩</option>
	</select>
	
	<!-- 최근 펀딩 -->
	<div class="row" id="divLatelyFunding">
		<c:forEach var="list" items="${latelyList }">
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img alt="프로젝트 사진" src="/upload/${list.I_STORED_NAME }">
				<div class="caption">
					<h4>${list.P_NAME }</h4>
					<div>마감일자: ${list.I_END_DATE }</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	
	<!-- 전체 펀딩 -->
	<div>
	
	
	
	</div>

</div><!-- div.container -->

<script type="text/javascript">
$(document).ready(function() {
	
	//select option 선택에 따른 show / hide
	$("select").change(function() {
		var option =  $("select").val();
		
		if(option == "전체 펀딩") {
			$("#divLatelyFunding").hide()
		} else {
			$("#divLatelyFunding").show()
		}
	})
})
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>