<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 테이블 */
table th, td {text-align:center;}
/* 남긴 글이 있는 경우 스타일 */
.divFundMenu span a {display:inline-block; width:150px; margin-top:10px; font-size:17px;}
.selectMyFund {text-align-last:center; font-size:17px; width:150px; height:35px; margin:0 45% 15px;}
.thumbnail a img {width:80%; height:200px; border:1px solid coral;}
.dday span {display:inline-block; width:100px; margin:10px 0;}
.pjname {font-weight:600; font-size:16px;}
</style>

<div class="container">
	<h2>내가 쓴 글</h2>
	<div class="divFundMenu">
		<span><a href="/user/mypage/fundcomm">펀딩 커뮤니티</a></span>
		<span><a href="/user/mypage/board">자유 게시판</a></span>
	</div>
	<hr>
	
	<c:if test="${empty fundCommList }">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>참여한 펀딩 프로젝트 커뮤니티에 작성한 글이 없습니다.</h3>
		</div>
	</c:if>
	
	<c:if test="${not empty fundCommList }">
		<select class="selectMyFund">
			<option selected>카테고리 전체</option>
		</select>
	
		<table class="table" style="width:80%;margin:0 auto;">
			<tr>
				<th style="width:10%">#</th>
				<th style="width:50%">프로젝트명</th>
				<th style="width:10%">작성일</th>
			</tr>
			<c:forEach var="fcList" items="${fundCommList }">
			<tr id="trFcData">
				<td>${fcList.RNUM }</td>
				<td>${fcList.P_NAME }</td>
				<td><fmt:formatDate value="${fcList.COM_DATE }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr id="trDetailContent">
				<td colspan="3">${fcList.COM_CONTENT }</td>
			</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/layout/paging.jsp"/>
	</c:if>
</div><!-- div.container -->
<script type="text/javascript">
$(document).ready(function() {
	$("#trDetailContent td").hide()
	$("#trFcData").click(function() {
	$("#trFcData + tr > td").show()
		
	})
})
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>