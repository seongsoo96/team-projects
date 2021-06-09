<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 좋아한 프로젝트 없는 경우 스타일*/
svg {display:inline-block; width:20px; height:20px; vertical-align:middle;}
h4 a:hover{text-decoration:none;}

/* 좋아한 프로젝트 있는 경우 스타일 */
.divFundMenu span a {display:inline-block; width:150px; margin-top:10px; font-size:17px;}
.selectMyFund {text-align-last:center; font-size:17px; width:150px; height:35px; margin:0 45% 15px;}
.thumbnail a img {width:80%; height:200px; border:1px solid coral;}
.dday span {display:inline-block; width:100px; margin:10px 0;}
.pjname {font-weight:600; font-size:16px;}
</style>

<div class="container">
	<h2>좋아요</h2>
	<hr>
	
	<c:if test="${empty favoriteList }">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>좋아한 펀딩 프로젝트가 없습니다.</h3>
			<h4>
				<a href="/user/project/list">
				펀딩 프로젝트 둘러보기
				<span>
					<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
					<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
					</svg>
				</span>
				</a>
			</h4>
		</div>
	</c:if>
	
	<c:if test="${not empty favoriteList }">
		<select class="selectMyFund">
			<option selected>카테고리 전체</option>
		</select>
	
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
						
						<a href="/user/project?pNo=${flist.P_NO }">
							<img alt="프로젝트 사진" src="/upload/imformation/${flist.I_STORED_NAME }">
						</a>
						<div class="caption">
							<div class="pjname">${flist.P_NAME }</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
			<c:import url="/WEB-INF/views/layout/paging.jsp"/>
	</c:if>
</div><!-- div.container -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>