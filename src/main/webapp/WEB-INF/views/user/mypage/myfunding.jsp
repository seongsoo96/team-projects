<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 상단 메뉴 */
.divFundMenu span a {display:inline-block; width:150px; margin-top:10px; font-size:17px; color:black;}
.divFundMenu span a:hover {text-decoration:none; color:#4EE2EC;}
.fa-house-user {font-size:30px; position:relative; left:550px;}

/* 프로젝트 없는 경우 스타일*/
.arrow-img {width:20px; height:20px; vertical-align:bottom;}
h4 a:hover{text-decoration:none;}

/* 프로젝트 있는 경우 스타일 */
.divCheckbox {height:50px; font-size:15px; text-align:center; margin:2% 0;}
.divCheckbox label {display:inline-block; margin:0 7px; font-weight:600; height:100%; padding-top:7px;}
.divCheckbox label input {width:15px; vertical-align:text-top;}
.divCheckbox span {margin-left:2%;}
.divCheckbox span button {background:none; border:none;}
.divCheckbox span button:hover {color:#4EE2EC;}


.selectMyFund {text-align-last:center; font-size:17px; width:150px; height:35px; margin:0 45% 15px;}
.thumbnail a img {width:80%; height:200px;}
.dday span {display:inline-block; width:100px; margin:10px 0;}
.pjname {font-weight:600; font-size:16px;}
</style>

<div class="container" style="margin-bottom:50px;">
	<h2>펀딩하기</h2>
	<div class="divFundMenu">
		<span><a href="/user/mypage/myfunding">나의 펀딩</a></span>
		<span><a href="/user/mypage/fundingchart">펀딩 내역</a></span>
		<span><a href="/user/mypage/home"><i class="fas fa-house-user"></i></a></span>
	</div>
	<hr>
	
	<c:if test="${empty totalList } ">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>펀딩 프로젝트에 참여한 이력이 없습니다.</h3>
			<h4>
				<a href="/user/project/list">
				펀딩 프로젝트 참여하러 가기
				<img src="/resources/img/arrow.svg" class="arrow-img">
				</a>
			</h4>
		</div>
	</c:if>
	
	<c:if test="${not empty totalList }">
		<form action="/user/mypage/myfunding" method="get">
		<div class="form-control divCheckbox">
			<label><input type="checkbox" name="category" value="전체" checked>카테고리 전체</label>
			<label><input type="checkbox" name="category" value="테크/가전">테크/가전</label>
			<label><input type="checkbox" name="category" value="반려동물">반려동물</label>
			<label><input type="checkbox" name="category" value="출판">출판</label>
			<label><input type="checkbox" name="category" value="기부/후원">기부/후원</label>
			<label><input type="checkbox" name="category" value="푸드">푸드</label>
			<label><input type="checkbox" name="category" value="운동">운동</label>
			<label><input type="checkbox" name="category" value="여행">여행</label>
			<label><input type="checkbox" name="category" value="뷰티">뷰티</label>
			<label><input type="checkbox" name="category" value="패션">패션</label>
			<label><input type="checkbox" name="category" value="디자인소품">디자인소품</label>
			<span><button type="button" id="btnSelectCategory"><i class="fas fa-search"></i></button></span>
		</div>
		</form>


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
						
						<a href="/story?pNo=${tlist.P_NO }">
						<c:choose>
							<c:when test="${fn:contains(tlist.I_STORED_NAME, 'test') }">
								<img src="/resources/img/${tlist.I_STORED_NAME }">
							</c:when>
							<c:otherwise>
								<img src="/upload/imformation/${tlist.I_STORED_NAME }">
							</c:otherwise>
						</c:choose>
						</a>
						<div class="caption">
							<div class="pjname">${tlist.P_NAME }</div>
							<div>펀딩한 금액: <fmt:formatNumber type="number" maxFractionDigits="3" value="${tlist.PAYM_AMOUNT}" />원</div>
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
<script type="text/javascript">
$(document).ready(function() {
	
	var categorybox = $("input:checkbox[name='category']")
	
	/* 체크 박스 옵션 선택 시 */
	categorybox.change(function() {
		console.log("checkbox change!")
		
		/* 0번째 옵션(전체) unchecked */
		categorybox.eq(0).prop('checked', false)
	})
	
	/* 검색 아이콘 클릭 시 카테고리 폼 데이터 전송*/
	 $("#btnSelectCategory").click(function() {
		 $("form").submit()
	 })
})
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>