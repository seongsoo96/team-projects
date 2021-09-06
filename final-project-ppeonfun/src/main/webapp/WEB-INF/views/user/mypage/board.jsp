<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 테이블 */
table th, td {text-align:center;}

/* 게시글 제목 */
#btnBoardName {background:none; border:none;}
</style>

<div class="container">
	<h2>내가 쓴 글</h2>
	<div class="divFundMenu">
		<span><a href="/user/mypage/fundcomm">펀딩 커뮤니티</a></span>
		<span><a href="/user/mypage/board">게시판</a></span>
	</div>
	<hr>
	
	<c:if test="${empty boardList }">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>게시판에 작성한 글이 없습니다.</h3>
		</div>
	</c:if>
	
	<c:if test="${not empty boardList }">
		<table class="table table-hover" style="width:80%;margin:0 auto;">
			<tr>
				<th style="width:10%">#</th>
				<th style="width:50%">제목</th>
				<th style="width:10%">조회수</th>
				<th style="width:10%">작성일</th>
			</tr>
			<c:forEach var="bList" items="${boardList }">
			<tr>
				<td>${bList.RNUM }</td>
				<td><button type="button" id="btnBoardName" onclick="location.href='/user/board/view?bNo=${bList.B_NO}'">${bList.B_TITLE }</button></td>
				<td>${bList.B_HIT }</td>
				<td><fmt:formatDate value="${bList.B_CREATE_DATE }" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</table>
		<c:if test="${paging.totalPage > 1 }">
			<c:import url="/WEB-INF/views/admin/project/paging.jsp"/>
		</c:if>
	</c:if>
</div><!-- div.container -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>