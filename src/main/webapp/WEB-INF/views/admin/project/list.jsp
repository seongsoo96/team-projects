<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<style type="text/css">
hr{
	margin-top:80px;
}
.fa-plus{
	color:#4EE2EC;
}
#projectWrite{
	cursor: pointer;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#projectWrite").click(function(){
		var result = confirm('프로젝트를 생성 하시겠습니까?');
		if(result){
			$(location).attr("href", "/admin/project/write");
		}
	})	
})

</script>

<div id="content"> 
<h1 class="pull-left">프로젝트 관리 &nbsp;<a id="projectWrite"><i class="fas fa-plus"></i></a></h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 20%; text-align:center;">프로젝트 이름</th>
		<th style="width: 5%; text-align:center;">요건</th>
		<th style="width: 5%; text-align:center;">정보</th>
		<th style="width: 10%; text-align:center;">스토리</th>
		<th style="width: 10%; text-align:center;">리워드</th>
		<th style="width: 10%; text-align:center;">메이커</th>
		<th style="width: 15%; text-align:center;">승인 상태</th>
		<th style="width: 15%; text-align:center;">진행 상태</th>
		<th style="width: 20%; text-align:center;">생성 날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="project">
	<tr>
		<td><a href="/admin/project/view?pNo=${project.pNo }">${project.pName }</a></td>
		<td>${project.pRequirements }</td>
		<td>${project.pInformation }</td>
		<td>${project.pStory }</td>
		<td>${project.pReward }</td>
		<td>${project.pMaker }</td>
		<td>${project.pState}</td>
		<td>${project.pProgressState }</td>
		<td><fmt:formatDate value="${project.pCreateDate }" pattern="yy-MM-dd" /></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span><br>

<c:import url="/WEB-INF/views/admin/project/paging.jsp"></c:import>    
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>