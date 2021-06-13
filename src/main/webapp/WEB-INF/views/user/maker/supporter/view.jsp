<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnDelete").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			$(location).attr("href","/user/maker/supporter/remove?suNo=${supporter.SU_NO }");
		}
	});
		
})
</script>
<style type="text/css">
.alert{
	width: 900px;
	float: right;
}
.background-white{
	background: #FFFFFF;
	color: #1E2227;
	font-size: 20px;
	text-align: left;
}

</style>
<div id="content">
	<c:import url="/WEB-INF/views/layout/userProjectSlide.jsp"></c:import>
	<div class="container">
		<h1>서포터</h1>
		
		<form role="role">
			<input type="hidden" name="pNo" value="${supporter.P_NO }" />
			<input type="hidden" name="mNo" value="${supporter.M_NO }" />
			<div class="background-white form-group alert" role="alert">
				<label for="M_ID">아이디</label>
				<input type="text" id="M_ID" name="M_ID" class="form-control" value="${supporter.M_ID }" readonly/>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="M_NAME">이름</label>
				<input type="text" id="M_NAME" name="M_NAME" class="form-control" value="${supporter.M_NAME }" readonly/>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="M_NICK">닉네임</label>
				<input type="text" id="M_NICK" name="M_NICK" value="${supporter.M_NICK }" readonly>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="SU_CREATE_DATE">펀딩 등록 날짜</label>
				<input type="text" id="SU_CREATE_DATE" name="SU_CREATE_DATE" value="<fmt:formatDate value="${supporter.SU_CREATE_DATE }" pattern="yy-MM-dd" />" readonly>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="RE_TITLE">리워드 선택</label>
				<input type="text" id="RE_TITLE" name="RE_TITLE" value="${supporter.RE_TITLE }" readonly>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="RE_MONEY">펀딩금액</label>
				<input type="text" id="RE_MONEY" name="RE_MONEY" value="${supporter.RE_MONEY }" readonly>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="SU_ADD_MONEY">추가펀딩</label>
				<input type="text" id="SU_ADD_MONEY" name="SU_ADD_MONEY" value="${supporter.SU_ADD_MONEY }" readonly>
			</div>
			
			<div class="background-white form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button id="btnDelete" type="button" class="btn btn-danger">삭제하기</button>
                        <button type="button" class="btn btn-info" onclick="location.href='/user/maker/supporter/list?pNo=${supporter.P_NO }'">목록으로</button>
                    </div>
            </div>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>