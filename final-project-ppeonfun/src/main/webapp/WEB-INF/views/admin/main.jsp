<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>

<style type="text/css">
.selectsort {
	border-color: snow;
	height: 30px;
	width: 200px;
}

.dropbox {
	border-color: #2ed5d5;
	height: 30px;
	margin: 0px 5px;
/* 	width: 100px; */
}
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChartBar)
google.charts.setOnLoadCallback(drawChartColumn);
google.charts.setOnLoadCallback(drawChartDonut)
function drawChartBar() {
var data = new google.visualization.DataTable();
    
	data.addColumn('string', 'Topping');
	data.addColumn('number', '${category}');
	
	data.addRows([
		<c:forEach items="${map }" var="stat" varStatus="st">
		['${stat.CATEGORY }', ${stat.COUNT }]
		
		<c:if test="${not st.last }">,</c:if>
	</c:forEach>
	]);
var options = {'title':'${category}',
               'width':370,
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
		data.addColumn('number', '${category}');
		data.addRows([
			<c:forEach items="${map }" var="stat" varStatus="st">
			['${stat.CATEGORY }', ${stat.COUNT }]
			<c:if test="${not st.last }">,</c:if>
			</c:forEach>
		]);


	var options = {'title':'${category}',
	               'width':370,
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
		data.addColumn('number', '${category}');
		data.addRows([
			<c:forEach items="${map }" var="stat" varStatus="st">
			['${stat.CATEGORY }', ${stat.COUNT }]
			<c:if test="${not st.last }">,</c:if>
			</c:forEach>
		]);


	var options = {'title':'${category}',
	               'width':370,
	               'height':400,
	                pieHole: 0.2
					};


	var chart = new google.visualization.PieChart(document.getElementById('donut_chart'));
	chart.draw(data, options);
}

</script>
<div id="content">
	
	<div id="selectsort">
	<select class="pull-right dropbox"  onchange="if(this.value) location.href=(this.value);">
		<option value="" disabled="disabled">선택</option>
		
		<option value="/admin/main?category=payment" <c:if test="${category eq 'payment'}">selected="selected"</c:if>>결제</option>
		<option value="/admin/main?category=payback" <c:if test="${category eq 'payback'}">selected="selected"</c:if>>환불</option>
		<option value="/admin/main?category=favorite" <c:if test="${category eq 'favorite'}">selected="selected"</c:if>>좋아요</option>
		<option value="/admin/main?category=alarm" <c:if test="${category eq 'alarm'}">selected="selected"</c:if>>알림</option>
	</select>
	</div>
	<div class="container">
		<div id="chartTarget">
			<div id="bar_chart">BarChart</div>
			<div id="donut_chart">DonutChart</div>
			<div id="column_chart">ColumnChart</div>
		</div>
		
		<c:choose>
			<c:when test="${category eq 'payment'}">
				<c:import url="/WEB-INF/views/admin/statistics/payment.jsp"/>
			</c:when>
			<c:when test="${category eq 'payback'}">
				<c:import url="/WEB-INF/views/admin/statistics/payback.jsp"/>
			</c:when>
			<c:when test="${category eq 'alarm'}">
				<c:import url="/WEB-INF/views/admin/statistics/alarm.jsp"/>
			</c:when>
			<c:when test="${category eq 'favorite'}">
				<c:import url="/WEB-INF/views/admin/statistics/favorite.jsp"/>
			</c:when>
		</c:choose>
	</div>
</div>

<%-- <c:import url="/WEB-INF/views/layout/paging.jsp"></c:import> --%>

<c:if test="${paging.totalPage > 1 }">
	<c:import url="/WEB-INF/views/admin/user/ppeonfunpaging.jsp" />   
</c:if>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
