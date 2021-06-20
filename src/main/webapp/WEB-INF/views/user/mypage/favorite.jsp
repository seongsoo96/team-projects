<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<div class="container" style="margin-bottom:50px;">
	<div class="divFundMenu">
		<h2 style="display:inline-block;"><a href="/user/mypage/favorite" style="color:black;">좋아요</a></h2>
	</div>
	<hr>
	
	<c:import url="/WEB-INF/views/layout/myCategoryBtn.jsp"/>
	<c:if test="${empty favoriteList }">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>좋아한 펀딩 프로젝트가 없습니다.</h3>
			<h4>
				<a href="/user/project/list">
				펀딩 프로젝트 둘러보기
				<img src="/resources/img/arrow.svg" class="arrow-img">
				</a>
			</h4>
		</div>
	</c:if>
	
	<c:if test="${not empty favoriteList }">
		<%-- 현재 날짜 --%>
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now }" var="nowFormat" pattern="yyyy-MM-dd"/>
		<fmt:parseDate value="${nowFormat }" var="today" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"/>
		
		<!-- 좋아요 프로젝트 목록 (최근순) -->
		<div class="row" id="divTotalFavorite" >
			<c:forEach var="flist" items="${favoriteList }">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail text-center">
						<fmt:formatDate value="${flist.I_END_DATE }" var="endFormat" pattern="yyyy-MM-dd"/>
						<fmt:parseDate value="${endFormat }" var="end" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${end.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
	
						<div class="dday">
							<span class="pull-left">${flist.I_CATEGORY }</span>
							<c:if test="${flist.P_PROGRESS_STATE eq 'Y' }">
								<span class="pull-right">D-${endDate - todayDate }</span>
							</c:if>
							<c:if test="${flist.P_PROGRESS_STATE eq 'N' }">
								<span class="pull-right" style="color:red">종료</span>
							</c:if>
						</div>
						
						<a href="/story?pNo=${flist.P_NO }">
						<c:choose>
							<c:when test = "${fn:length(flist.I_STORED_NAME)<20}">
								<img class="profile-img" style="width:100%; height:250px;" src="/resources/img/${flist.I_STORED_NAME }">
							</c:when>
							<c:otherwise>
								<img class="profile-img" style="width:100%; height:250px;" src="/upload/imformation/${flist.I_STORED_NAME }">
							</c:otherwise>
						</c:choose>
						</a>
						<div class="caption">
							<div class="pjname">${flist.P_NAME }</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${paging.totalPage > 1 }">
			<c:import url="/WEB-INF/views/admin/project/paging.jsp"/>
		</c:if>
	</c:if>
</div><!-- div.container -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>