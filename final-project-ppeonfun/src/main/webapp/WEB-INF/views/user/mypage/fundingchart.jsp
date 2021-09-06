<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">
/* 상단 메뉴 */
.divFundMenu span a {display:inline-block; width:150px; margin-top:10px; font-size:17px; color:black;}
.divFundMenu span a:hover {text-decoration:none; color:#4EE2EC;}
.fa-house-user {font-size:30px; position:relative; left:550px;}

/* 카테고리 */
.selectMyFund {text-align-last:center; font-size:15px; width:125px; height:30px; margin:0 45% 35px;}
</style>

<div class="container">
	<h2>펀딩하기</h2>
	<div class="divFundMenu">
		<span><a href="/user/mypage/myfunding">나의 펀딩</a></span>
		<span><a href="/user/mypage/fundingchart">펀딩 내역</a></span>
	</div>
	<hr>
	
	<select class="selectMyFund" onchange="if(this.value) location.href=(this.value);">
		<option value="/user/mypage/fundingchart/payment" <c:if test="${paystate eq 'payment'}">selected="selected"</c:if>>결제 완료</option>
		<option value="/user/mypage/fundingchart/payback" <c:if test="${paystate eq 'payback'}">selected="selected"</c:if>>환불/취소</option>
	</select>
	
	<div id="chartTarget">
		<div id="column_chart" class="pull-right">ColumnChart</div>
		<div id="donut_chart">DonutChart</div>
	</div>

</div><!-- div.container -->

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChartDonut);
google.charts.setOnLoadCallback(drawChartColumn);

function drawChartDonut() {
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'Topping');
	data.addColumn('number', '${paystate}');
	data.addRows([
		<c:forEach items="${map }" var="stat" varStatus="st">
			['${stat.CATEGORY }', ${stat.COUNT }]
			<c:if test="${not st.last }">,</c:if>
		</c:forEach>
	]);

	var options = { 'title': '결제 내역 비율'
				   	, 'width': 400
	               	, 'height': 400
	               	, 'pieHole': 0.2
	               	, 'pieSliceText' : 'none'
	               	, 'fontSize': 16
	               	, 'legend' : {
	               		'position' : 'right'
	               		, 'textStyle' : {'fontSize':14}
					}
	
				};

	var chart = new google.visualization.PieChart(document.getElementById('donut_chart'));
	chart.draw(data, options);
}

function drawChartColumn() {
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'Topping');
	data.addColumn('number', '누적 합계');
	data.addRows([
		<c:forEach items="${map }" var="stat" varStatus="st">
			['${stat.CATEGORY }', ${stat.COUNT }]
			<c:if test="${not st.last }">,</c:if>
		</c:forEach>
	]);


	var options = { 'title': '결제 내역'
	               	, 'width': 400
	               	, 'height': 400
	               	, 'fontSize': 16
	               	, 'legend' : {
	            	   'position' : 'top'
	            	   , 'textStyle' : {'fontSize':14}
	            	}
				};

	var chart = new google.visualization.ColumnChart(document.getElementById('column_chart'));
	chart.draw(data, options);
}
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>