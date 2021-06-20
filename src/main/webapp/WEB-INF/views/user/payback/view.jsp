<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
input[name="suGroup"]+label {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #4EE2EC;
	cursor: pointer;
}

input[name="suGroup"]:checked+label {
	background-color: #4EE2EC;
}

input[name="suGroup"] {
	display: none;
}
.input-group{
	font-size:17px;
	border-radius: 5px;
	background:#F9F9F9;
}
.form-control-plaintext{
	margin: 10px 0;
}
.input-group-addon{
	border: 0;
	border-right: 1px solid #4EE2EC;
}
</style>

<div class="container">
<div class="circle active">리워드 환불선택</div>
<div class="circle">환불</div>
<div class="circle">환불 완료</div>

<h3>환불할 리워드 선택</h3>
<form action="/user/payback/proc" method="post">
<input type="hidden" name="pNo" value="${project.pNo }">
<c:forEach items="${groupList }" var="group">
	<div class="col-lg-4">
		<div class="input-group">
			<c:set var="sum" value="0"/>
			<c:forEach items="${group }" var= "payment" varStatus="status">
					<c:set var="sum" value="${sum+payment.paymAmount }"/>
					
					<c:if test="${status.first }">
						<span class="input-group-addon" style="background-color	:#F9F9F9;"> 
							<input type="checkbox" id="suGroup${payment.suGroup }" name="suGroup" value="${payment.suGroup }" />
							<label for="suGroup${payment.suGroup }"></label>
						</span> 			
					</c:if>
						<div class="form-control-plaintext">${payment.reTitle }의 금액 ${payment.paymAmount } </div>
					
					<c:if test="${status.last }">
						<div class="form-control-plaintext">${sum }원을 환불합니다. 결제일:<fmt:formatDate value="${payment.paymDate }" pattern="yy-MM-dd hh:mm:ss" /></div> 			
					</c:if>
					
			</c:forEach>
			
		</div>
	</div>
</c:forEach>
<c:choose>
	<c:when test="${empty groupList }">
		
		<div class="text-center">
			<h2>환불할 리워드가 존재 하지 않습니다.</h2>
			<a href="/story?pNo=${project.pNo }"><button type="button" class="btn btn-info">돌아가기</button></a>
		</div>
	</c:when>
	<c:otherwise>
		<div class="col-lg-12">
			<div class="text-center">
				<button class="btn btn-info">환불하기</button>
				<a href="/story?pNo=${project.pNo }"><button type="button" class="btn btn-info">돌아가기</button></a>
			</div>	
		</div>
	</c:otherwise>
</c:choose>

</form>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>