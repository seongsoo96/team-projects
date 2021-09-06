<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">
$(document).ready(function() {
	totalPage = '${paging.totalPage}';
	totalCount = '${paging.totalCount}';
	listCount = '${paging.listCount}';
	curPage = '${paging.curPage}';
	cnt = parseInt(curPage) * parseInt(listCount)
})
</script>

<c:forEach items="${searchList }" var="list">
	<div class="SearchList_result_project">
		<a href="/story?pNo=${list.P_NO }">
			<c:choose>
				<c:when test = "${fn:length(list.I_STORED_NAME) < 20}">
					<img class="project_img" alt="테스트" src="/resources/img/${list.I_STORED_NAME }">
				</c:when>
				<c:otherwise>
					<img class="project_img" alt="테스트" src="/upload/information/${list.I_STORED_NAME }">
				</c:otherwise>
			</c:choose>
			<p>
				<strong class="project_title">${list.P_NAME }</strong>
				<small class="project_info">
					<span>${list.I_CATEGORY }</span>
					<span>${list.M_NO }</span>
				</small>
			</p>
		</a>
		<c:set var="now" value="<%=new java.util.Date() %>" />
		<c:set var="today"><fmt:formatDate value="${now}" pattern="yy-MM-dd" /></c:set>
		<c:set var="start_date"><fmt:formatDate value="${list.I_START_DATE }" pattern="yy-MM-dd" /></c:set>
		<c:set var="end_date"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></c:set>
		<fmt:parseDate value="${today }" var="todayDate" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${todayDate.time / (1000*60*60*24)}" integerOnly="true" var="tDate"></fmt:parseNumber>
		<fmt:parseDate value="${start_date }" var="strPlanDate" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="sDate"></fmt:parseNumber>
		<fmt:parseDate value="${end_date }" var="endPlanDate" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="eDate"></fmt:parseNumber>
		
		<c:choose>
			<c:when test="${start_date <= today && end_date >= today }">
				<div class="project_status_wrap">
					<div class="goal_bar"><span style="width:${list.FUNDED_PERCENT }% "></span></div>
					<div class="project_status_info">
						<div class="project_status_info_box">
							<strong class="project_funded_percent">${list.FUNDED_PERCENT }%</strong>
							<em class="project_funded_money">${list.FUNDED_MONEY }원</em>
						</div>
						<em class="project_deadline">${eDate - tDate }일 남음</em>
					</div>
				</div>
			</c:when>
			<c:when test="${start_date > today }">
				<div class="project_status_wrap_comingsoon">
					<fmt:formatDate value="${list.I_START_DATE }" pattern="MM" />/<fmt:formatDate value="${list.I_START_DATE }" pattern="dd" />(<fmt:formatDate value="${list.I_START_DATE }" pattern="E" />)
					<fmt:formatDate value="${list.I_START_DATE }" pattern="HH" />시<fmt:formatDate value="${list.I_START_DATE }" pattern="dd" />분
					오픈예정
				</div>
			</c:when>
			<c:when test="${end_date < today }">
				<div class="project_status_wrap">
					<div class="goal_bar"><span style="width:${list.FUNDED_PERCENT }% "></span></div>
					<div class="project_status_info">
						<div class="project_status_info_box">
							<strong class="project_funded_percent">${list.FUNDED_PERCENT }%</strong>
							<em class="project_funded_money">${list.FUNDED_MONEY }원</em>
						</div>
						<c:if test="${list.FUNDED_PERCENT >= 100 }">
							<em class="project_deadline">종료</em>
							<em class="project_success">성공</em>
						</c:if>
						<c:if test="${list.FUNDED_PERCENT < 100 }">
							<em class="project_deadline">종료</em>
							<em class="project_success">실패</em>
						</c:if>
					</div>
				</div>
			</c:when>
		</c:choose>
	</div>
</c:forEach>
