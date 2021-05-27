<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>

<div id="content">
	<select class="pull-right"  onchange="if(this.value) location.href=(this.value);">
		<option value="http://www.naver.com">네이버</option>
		<option value="http://www.google.com">구글</option>
		<option value="http://www.daum.net">다음</option>
		<option value="http://www.naver.com">네이버</option>
	</select>
	<div class="container">
		<div id="chartTarget">
			<div>LineChart</div>
			<div>BarChart</div>
			<div>DonutChart</div>
		</div>
		
		<div id="tableTarget">
		<h1 class="pull-left">결제 리스트</h1>	
		<table class="table table-hover table-striped table-condensed">
			<tr>
				<th class="text-center" style="width: 25%">결제 번호</th>
				<th class="text-center" style="width: 25%">결제 이름</th>
				<th class="text-center" style="width: 25%">결제 금액</th>
				<th class="text-center" style="width: 25%">결제 여부</th>
			</tr>
			
			
		</table>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
