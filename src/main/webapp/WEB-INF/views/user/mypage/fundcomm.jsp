<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 테이블 */
table th, td {text-align:center;}

/* 프로젝트 제목 */
#btnPjName {background:none; border:none;}

/* 질문 내용 & 답변 */
td[colspan='3'] div {width:35%; border-radius:5px; position:relative; margin-bottom:15px;}
.divComContent {left:15%; text-align:left; border:2px solid #C4FFFF; background-color:#C4FFFF; }
.divComAnswer {left:50%; text-align:right;}
</style>

<div class="container">
	<h2>내가 쓴 글</h2>
	<div class="divFundMenu">
		<span><a href="/user/mypage/fundcomm">펀딩 커뮤니티</a></span>
		<span><a href="/user/mypage/board">게시판</a></span>
		<span><a href="/user/mypage/home"><i class="fas fa-house-user"></i></a></span>
	</div>
	<hr>
	
	<c:import url="/WEB-INF/views/layout/myCategoryBtn.jsp"/>
	<c:if test="${empty fundCommList }">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>참여한 펀딩 프로젝트 커뮤니티에 작성한 글이 없습니다.</h3>
		</div>
	</c:if>
	
	<c:if test="${not empty fundCommList }">
		<table class="table table-hover" style="width:80%;margin:50px auto 0 auto;">
			<tr>
				<th style="width:10%">#</th>
				<th style="width:50%">프로젝트명</th>
				<th style="width:10%">작성일</th>
				<th style="width:10%">답변</th>
			</tr>
			<c:forEach var="fcList" items="${fundCommList }">
			<tr>
				<td>${fcList.RNUM }</td>
				<td><button type="button" id="btnPjName" onclick="getContent(${fcList.RNUM }, ${fcList.COM_NO})">${fcList.P_NAME }</button></td>
				<td><fmt:formatDate value="${fcList.COM_DATE }" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${fcList.ANS_CNT > 0}"><span style="color:#4EE2EC;font-weight:700;">Y</span></c:if>
					<c:if test="${fcList.ANS_CNT eq 0}">N</c:if>
				</td>
			</tr>
			<tr>
				<td id="td${fcList.RNUM }" colspan="3">
					<div class="divComContent">
						<span>${fcList.COM_CONTENT }</span>
					</div>
					<div class="divComAnswer"></div>
				</td>
			</tr>
			</c:forEach>
		</table>
		<c:import url="/WEB-INF/views/layout/paging.jsp"/>
	</c:if>
</div><!-- div.container -->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//질문 상세 내용 숨기기
	$("td[colspan='3']").hide()
	
})

//프로젝트 제목 클릭 시 질문 상세 내용 show, hide
function getContent(rnum, comNo) {
	
	$("#td" + rnum).toggle()
	
	//show 일 때 답변 조회
	if( $("#td" + rnum).is(':visible')) {
		$.ajax({
			type: 'post'
			, url: '/user/mypage/fundcomm/ajax'
			, data: { 'comNo': comNo }
			, dataType: 'json'
			, success: function(res) {
				console.log("답변 조회 성공", res)
				if(res.answer != null) {
					$( "#td" + rnum + " .divComAnswer").css({'border':'2px solid #e6e6e6', 'background-color':'#e6e6e6'})
					
					/* 답변 작성일 Date format */
					var caDate = moment(new Date(res.answer.caDate)).format('YY.MM.DD')
					console.log(caDate)

					/* 답변 내용 추가 */
					var ansHtml = ""
					ansHtml += ("<span><i class='fas fa-certificate'></i>" + caDate + "</span><br><br>")
					ansHtml += ("<span>" + res.answer.caContent + "</span>")
					
					$( "#td" + rnum + " .divComAnswer").html(ansHtml)
				}
			}
			, error: function() { console.log("답변 조회 실패") }
		})		
	}
}
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>