<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty report.REP_STATE }">
	<c:choose>
		<c:when test="${report.REP_STATE eq 'W'}">
			<c:set var="repState" value="신고 대기" />
		</c:when>
		<c:when test="${report.REP_STATE eq 'Y'}">
			<c:set var="repState" value="신고 승인" />
		</c:when>
		<c:when test="${report.REP_STATE eq 'N'}">
			<c:set var="repState" value="신고 거부" />
		</c:when>
	</c:choose>
</c:if>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnReject").click(function(){
		if(confirm("신고를 거부 하겠습니까?")){
			$(location).attr('href', '/admin/report/reject?repNo=${report.REP_NO}')
		}
	})
	
});

</script>

<style type="text/css">
label{
	display: block;
}
</style>

<div id="content">
	<div class="container">
		<h3>신고 조회</h3>
		<form action="/admin/report/approve" method="post">
		<input type="hidden" name="pNo" value="${report.P_NO }">
		<input type="hidden" name="mFounderNo" value="${report.M_FOUNDER_NO }">
		<div class="form-group">
		  <label class="control-label text-left" for="repNo">신고번호</label>
		  <input type="text" class="form-control" id="repNo" name="repNo" value="${report.REP_NO }" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="pName">프로젝트 제목</label>
		  <input type="text" class="form-control" id="pName" name="pName" value="${report.P_NAME }" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="mNick">신고자</label>
		  <input type="text" class="form-control" id="mNick" name="mNick" value="${report.M_NICK }" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="repCreateDate">신고날짜</label>
		  <input type="text" class="form-control" id="repCreateDate" value="<fmt:formatDate value="${report.REP_CREATE_DATE }" pattern="yyyy-MM-dd HH:mm:ss" />" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="repState">신고상태</label>
		  <input type="text" class="form-control" id="repState" name="repState" value="${repState }" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="repContent">신고내용</label>
		  <textarea class="form-control" id="repContent" name="repContent" rows="5" readonly="readonly">${report.REP_CONTENT }</textarea>
		</div>
		
		<c:if test="${report.REP_STATE eq 'W'}">
			<div class="form-group">
			  <label class="control-label text-left" for="repManagerContent">관리자 의견</label>
			  <textarea class="form-control" id="repManagerContent" name="repManagerContent" rows="5">${report.REP_MANAGER_CONTENT }</textarea>
			</div>
		</c:if>
		<c:if test="${not report.REP_STATE eq 'W'}">
			<div class="form-group">
			  <label class="control-label text-left" for="repManagerContent">관리자 의견</label>
			  <textarea class="form-control" id="repManagerContent" name="repManagerContent" rows="5" readonly="readonly">${report.REP_MANAGER_CONTENT }</textarea>
			</div>
		</c:if>
		
		<c:if test="${report.REP_STATE eq 'W'}">
			<div class="form-group text-left">
				<button type="submit" class="btn btn-info">신고승인</button>
				<button type="button" id="btnReject" class="btn btn-danger">신고거부</button>
				<a href="/admin/report/list"><button type="button" class="btn btn-primary">돌아가기</button></a>
			</div>
		</c:if>
		
		<c:if test="${report.REP_STATE eq 'Y' or report.REP_STATE eq 'N'}">
			<div class="form-group text-left">
				<button type="button" class="btn btn-info" disabled="disabled">신고승인</button>
				<button type="button" id="btnReject" class="btn btn-danger" disabled="disabled">신고거부</button>
				<a href="/admin/report/list"><button type="button" class="btn btn-primary">돌아가기</button></a>
			</div>
		</c:if>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>