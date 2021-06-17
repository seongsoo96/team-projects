<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<div class="container" style="margin-bottom:50px;">
	<h2>나의 프로젝트</h2>
	<div class="divFundMenu">
		<span><a href="/user/mypage/openpj">오픈 프로젝트</a></span>
		<span><a href="/user/maker/project/list">오픈 예정 프로젝트</a></span>
		<span><a href="/user/mypage/home"><i class="fas fa-house-user"></i></a></span>
	</div>
	<hr>
	
	<c:import url="/WEB-INF/views/layout/myCategoryBtn.jsp"/>
	<c:if test="${empty openpjList } ">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>오픈한 프로젝트가 없습니다.</h3>
			<h4>
				<a href="/user/project/list">
				프로젝트 개설하기
				<img src="/resources/img/arrow.svg" class="arrow-img">
				</a>
			</h4>
		</div>
	</c:if>
	
	<c:if test="${not empty openpjList }">
		<%-- 현재 날짜 --%>
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now }" var="nowFormat" pattern="yyyy-MM-dd"/>
		<fmt:parseDate value="${nowFormat }" var="today" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"/>
		
		<%-- 사용자가 오픈한 프로젝트 --%>
		<div class="row" id="divTotalFunding" >
			<c:forEach var="oplist" items="${openpjList }">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail text-center">
						<fmt:formatDate value="${oplist.I_END_DATE }" var="endFormat" pattern="yyyy-MM-dd"/>
						<fmt:parseDate value="${endFormat }" var="end" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${end.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
	
						<div class="dday">
							<span class="pull-left">${oplist.I_CATEGORY }</span>
							<c:if test="${oplist.P_PROGRESS_STATE eq 'Y' }">
								<span class="pull-right">D-${endDate - todayDate }</span>
							</c:if>
							<c:if test="${oplist.P_PROGRESS_STATE eq 'N' }">
								<span class="pull-right" style="color:red">종료</span>
							</c:if>
						</div>
						
						<a href="/story?pNo=${oplist.P_NO }">
						<c:choose>
							<c:when test="${fn:contains(oplist.I_STORED_NAME, 'test') }">
								<img src="/resources/img/${oplist.I_STORED_NAME }">
							</c:when>
							<c:otherwise>
								<img src="/upload/imformation/${oplist.I_STORED_NAME }">
							</c:otherwise>
						</c:choose>
						</a>
						<div class="caption">
							<div class="pjname">${oplist.P_NAME }</div>
							<div>펀딩 목표 금액: <fmt:formatNumber type="number" maxFractionDigits="3" value="${oplist.I_MONEY}" />원</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${paging.totalPage > 1 }">
			<c:import url="/WEB-INF/views/layout/paging.jsp"/>
		</c:if>
</c:if>
</div><!-- div.container -->
<script src="/resources/js/mypageList.js" type="text/javascript"></script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>