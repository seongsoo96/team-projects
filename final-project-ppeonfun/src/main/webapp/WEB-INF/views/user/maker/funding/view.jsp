<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="reMoney" value="0"></c:set>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChartBar)
google.charts.setOnLoadCallback(drawChartColumn);
google.charts.setOnLoadCallback(drawChartDonut)
function drawChartBar() {
var data = new google.visualization.DataTable();
    
	data.addColumn('string', 'Topping');
	data.addColumn('number', '펀딩');
	
	data.addRows([
		<c:forEach items="${mapChart }" var="stat" varStatus="st">
		['${stat.RE_TITLE }', ${stat.RE_MONEY*stat.COUNT }]
		
		<c:if test="${not st.last }">,</c:if>
	</c:forEach>
	]);
var options = {'title':'펀딩',
               'width':330,
               'height':400,
               legend : {
       			position : 'top' // 항목 표시 여부 (현재 설정은 안함)
       		   },
               };
var chart = new google.visualization.BarChart(document.getElementById('bar_chart'));
chart.draw(data, options);
}


function drawChartColumn() {
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'Topping');
		data.addColumn('number', '펀딩');
		data.addRows([
			<c:forEach items="${mapChart }" var="stat" varStatus="st">
			['${stat.RE_TITLE }', ${stat.RE_MONEY*stat.COUNT }]
			<c:if test="${not st.last }">,</c:if>
			</c:forEach>
		]);


	var options = {'title':'펀딩',
	               'width':330,
	               'height':400,
	               legend : {
	       			position : 'top' // 항목 표시 여부 (현재 설정은 안함)
	       			}
				};


	var chart = new google.visualization.ColumnChart(document.getElementById('column_chart'));
	chart.draw(data, options);
}

function drawChartDonut() {
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'Topping');
		data.addColumn('number', '펀딩');
		data.addRows([
			<c:forEach items="${mapChart }" var="stat" varStatus="st">
			['${stat.RE_TITLE }', ${stat.RE_MONEY*stat.COUNT }]
			<c:if test="${not st.last }">,</c:if>
			</c:forEach>
		]);


	var options = {'title':'펀딩',
	               'width':330,
	               'height':400,
	                pieHole: 0.2
					};


	var chart = new google.visualization.PieChart(document.getElementById('donut_chart'));
	chart.draw(data, options);
}

</script>


<c:forEach items="${mapChart }" var="stat">
	<c:set var="reMoney" value="${reMoney+ (stat.RE_MONEY*stat.COUNT) }"></c:set>
</c:forEach>

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

#chartTarget > div{
	display: inline-block;
	margin: 0 auto;
	width: 300px;
}
h1 {
	margin-left: 360px;
}
</style>
<div id="content">
	<c:import url="/WEB-INF/views/layout/userProjectSlide2.jsp"></c:import>
	<div class="container">
		<h1>펀딩현황</h1>
		<div id="chartTarget" style="margin-left: 260px;">
			<div id="bar_chart">BarChart</div>
			<div id="donut_chart">DonutChart</div>
			<div id="column_chart">ColumnChart</div>
		</div>
		<form role="role">
			
			<div class="background-white form-group alert" role="alert">
				<label for="fundingMoney">펀딩금액</label>
				<input type="number" id="fundingMoney" name="fundingMoney" class="form-control" value="${reMoney }" readonly/>
			</div>
			<div class="background-white form-group alert" role="alert">
				<label for="suAddMoney">추가 펀딩 금액</label>
				<input type="number" id="suAddMoney" name="suAddMoney" class="form-control" value="${suAddMoney }" readonly/>
			</div>
			
			<div class="background-white form-group alert" role="alert">
				<label for="totalMoney">총금액</label>
				<input type="number" id="totalMoney" name="totalMoney" class="form-control" value="${suAddMoney+reMoney }" readonly/>
			</div>
			
		</form>
	</div>
</div><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>