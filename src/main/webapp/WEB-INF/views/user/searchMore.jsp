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
	
	
	console.log("현재 페이지 curPage : " + curPage)
	console.log("페이지 리스트 수 listCount : " + listCount)
	console.log("더보기 totalPage : " + totalPage)
	console.log("더보기 totalCount : " + totalCount)
	
	cnt = parseInt(curPage) * parseInt(listCount)
	console.log("변수 cnt : " + cnt)
	
// 		if(cnt < totalCount) {
// 			$('.listCount').text(cnt)
// 		} else {
// 			$('.listCount').text(totalCount)
// 			$('#btnViewMore').prop("disabled", true)
// 		}
	console.log("-----------searchMore.jsp 끝-------------")

})
</script>

<%-- <c:forEach items="${searchList }" var="list"> --%>
<!-- 	<div class="SearchList_result_project"> -->
<!-- 		<a href="#"> -->
<!-- 			<img class="project_img" alt="테스트" src="/resources/img/test6.jpg"> -->
<!-- 			<p> -->
<%-- 				<strong class="project_title">${list.P_NAME }</strong> --%>
<!-- 				<small class="project_info"> -->
<%-- 					<span>${list.I_CATEGORY }</span> --%>
<%-- 					<span>${list.M_NO }</span> --%>
<!-- 				</small> -->
<!-- 			</p> -->
<!-- 		</a> -->
<!-- 		<div class="project_status_wrap"> -->
<!-- 			<div class="goal_bar"><span></span></div> -->
<!-- 			<div class="project_status_info"> -->
<!-- 				<div class="project_status_info_box"> -->
<%-- 					<strong class="project_funded_percent">${list.FUNDED_PERCENT }</strong> --%>
<%-- 					<em class="project_funded_money">${list.FUNDEND_MONEY }</em> --%>
<!-- 				</div> -->
<%-- 				<em class="project_deadline"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></em> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<%-- </c:forEach> --%>


<!-- 			<div class="SearchList_result_wrap"> -->
				<c:forEach items="${searchList }" var="list">
					<div class="SearchList_result_project">
						<a href="/story?pNo=${list.P_NO }">
							<c:choose>
								<c:when test = "${fn:contains(list.I_STORED_NAME, 'search') or fn:contains(list.I_STORED_NAME, 'test')}">
									
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
<%-- 										<em class="project_deadline"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></em> --%>
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
<!-- 						<div class="project_status_wrap"> -->
<!-- 							<div class="goal_bar"><span></span></div> -->
<!-- 							<div class="project_status_info"> -->
<!-- 								<div class="project_status_info_box"> -->
<%-- 									<strong class="project_funded_percent">${list.FUNDED_PERCENT }%</strong> --%>
<%-- 									<em class="project_funded_money">${list.FUNDEND_MONEY }</em> --%>
<!-- 								</div> -->
<%-- 								<em class="project_deadline"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></em> --%>
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</c:forEach>
<!-- 			</div>.SearchList_result_wrap -->
			
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${paging.totalCount < 9 }"> --%>
<%-- 					<button id="btnViewMore" type="button" disabled="disabled" class="view_more button less" onclick="viewMore(${paging.curPage}, '${keyword }')"> --%>
<!-- 						더보기 -->
<%-- 						<em>${paging.totalCount }/${paging.totalCount }</em> --%>
<!-- 						<i class="icon expand_more"></i> -->
<!-- 					</button> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 					<button id="btnViewMore" type="button" class="view_more button less" onclick="viewMore(${paging.curPage}, '${keyword }')"> --%>
<!-- 						더보기 -->
<!-- 						<em class="listCount">9</em> -->
<%-- 						<em>/${paging.totalCount }</em> --%>
<!-- 						<i class="icon expand_more"></i> -->
<!-- 					</button> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
			
