<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 프로젝트 없는 경우 스타일*/
svg {display:inline-block; width:20px; height:20px; vertical-align:middle;}
h4 a:hover{text-decoration:none;}

/* 프로젝트 있는 경우 스타일 */
.divFundMenu span a {display:inline-block; width:150px; margin-top:10px; font-size:17px;}
.selectMyFund {text-align-last:center; font-size:17px; width:150px; height:35px; margin:0 45% 15px;}
.thumbnail img {width:80%; height:200px; border:1px solid coral;}
.dday span {display:inline-block; width:100px; margin:10px 0;}
.pjname {font-weight:600; font-size:16px;}
</style>

<div class="container">
	<h2>펀딩하기</h2>
	<div class="divFundMenu">
		<span><a href="/user/mypage/myfunding">나의 펀딩</a></span>
		<span><a href="/user/mypage/fundingchart">펀딩 내역</a></span>
	</div>
	<hr>
	
	<c:if test="${empty totalList }">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>펀딩 프로젝트에 참여한 이력이 없습니다.</h3>
			<h4>
				<a href="#">
				펀딩 프로젝트 참여하러 가기
				<span>
					<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
					<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
					</svg>
				</span>
				</a>
			</h4>
		</div>
	</c:if>
	
	<c:if test="${not empty totalList }">
		<select class="selectMyFund">
			<option selected>카테고리 전체</option>
		</select>
	
		<%-- 현재 날짜 --%>
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now }" var="nowFormat" pattern="yyyy-MM-dd"/>
		<fmt:parseDate value="${nowFormat }" var="today" pattern="yyyy-MM-dd"/>
		<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"/>
		
		<!-- 전체 펀딩 (최근순) -->
		<div class="row" id="divTotalFunding" >
			<c:forEach var="tlist" items="${totalList }">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail text-center">
						<fmt:formatDate value="${tlist.I_END_DATE }" var="endFormat" pattern="yyyy-MM-dd"/>
						<fmt:parseDate value="${endFormat }" var="end" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${end.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
	
						<div class="dday">
							<span class="pull-left">${tlist.I_CATEGORY }</span>
							<c:if test="${tlist.P_PROGRESS_STATE eq 'Y' }">
								<span class="pull-right">D-${endDate - todayDate }</span>
							</c:if>
							<c:if test="${tlist.P_PROGRESS_STATE eq 'N' }">
								<span class="pull-right" style="color:red">종료</span>
							</c:if>
						</div>
						
						<img alt="프로젝트 사진" src="/upload/imformation/${tlist.I_STORED_NAME }">
						<div class="caption">
							<div class="pjname">${tlist.P_NAME }</div>
							<div>펀딩한 금액: <fmt:formatNumber type="number" maxFractionDigits="3" value="${tlist.PAYM_AMOUNT}" />원</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
			<c:import url="/WEB-INF/views/layout/paging.jsp"/>
	</c:if>
</div><!-- div.container -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>