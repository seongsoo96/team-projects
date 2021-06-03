<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type= "text/css">
.container {
    width: 980px;
}
.idfind-form{
	width: 550px;
	margin: 100px auto;
}

</style>
<div class="container">
    <h3>아이디 찾기</h3>
	<div class="idfind-form">
		<div class="form-group" id="divId">
			<label for="id" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-10">
				<input type="text" class="form-control col-lg-7" style="display: inline-block; width: 70%;" id="id" data-rule-required="true" value="${id}" readonly>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>