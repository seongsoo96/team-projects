<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(document).ready(function() {
	totalPage = '${paging.totalPage}';
	totalCount = '${paging.totalCount}'

		if(cnt < totalCount) {
			$('.listCount').text(cnt)
		} else {
			$('.listCount').text(totalCount)
			$('#btnViewMore').prop("disabled", true)
		}
	console.log("더보기 totalPage : " + totalPage)
	console.log("더보기 totalCount : " + totalCount)

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
						<a href="#">
							<img class="project_img" alt="테스트" src="/resources/img/test6.jpg">
							<p>
								<strong class="project_title">${list.P_NAME }</strong>
								<small class="project_info">
									<span>${list.I_CATEGORY }</span>
									<span>${list.M_NO }</span>
								</small>
							</p>
						</a>
						<div class="project_status_wrap">
							<div class="goal_bar"><span></span></div>
							<div class="project_status_info">
								<div class="project_status_info_box">
									<strong class="project_funded_percent">${list.FUNDED_PERCENT }%</strong>
									<em class="project_funded_money">${list.FUNDEND_MONEY }</em>
								</div>
								<em class="project_deadline"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></em>
							</div>
						</div>
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
			
