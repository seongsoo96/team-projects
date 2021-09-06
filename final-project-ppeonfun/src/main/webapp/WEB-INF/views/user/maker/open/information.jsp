<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"></c:import>
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
h1 {
	margin-left: 360px;
}
</style>
<div id="content">
	<c:import url="/WEB-INF/views/layout/userProjectSlide2.jsp"></c:import>
	<div class="container">
		<h1>기본정보</h1>
		<form role="role">
			
			<div class="background-white form-group alert" role="alert">
				<label for="iTitle">프로젝트 제목</label>
				<input type="text" id="iTitle" name="iTitle" class="form-control" value="${information.iTitle }" readonly/>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="iMoney">목표 금액(최소 50만원  ~ 최대 1억원)</label>
				<input type="number" id="iMoney" name="iMoney" class="form-control" min="500000" max="100000000" step="100000" value="${information.iMoney }" readonly/>
			</div>
			
			<div class="background-white form-group alert" role="alert">
			    <label for="file">대표이미지</label>
			    <p class="help-block">텍스트 로고 삽입 금지</p>
			    <img id="img" class="imgclick" src="/upload/information/${information.iStoredName} " width="900px" height="400px">
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="iCategory">카테고리</label>
				<input type="text" id="iCategory" name="iCategory" class="form-control" value="${information.iCategory }" readonly/>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="endDate">프로젝트 종료일</label>
				<input type="date" id="endDate" name="endDate" class="form-control" value="<fmt:formatDate value="${information.iEndDate }" pattern="yyyy-MM-dd" />" readonly/>
			</div>
		</form>
		<c:import url="/WEB-INF/views/user/maker/open/openPaging.jsp"></c:import>
	</div>
	
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>