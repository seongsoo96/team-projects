<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>

<div id="content"> 
<h1>프로젝트 관리</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 20%">프로젝트 이름</th>
		<th style="width: 5%">요건</th>
		<th style="width: 5%">정보</th>
		<th style="width: 10%">스토리</th>
		<th style="width: 10%">리워드</th>
		<th style="width: 10%">메이커</th>
		<th style="width: 15%">승인 상태</th>
		<th style="width: 15%">진행 상태</th>
		<th style="width: 20%">생성 날짜</th>
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