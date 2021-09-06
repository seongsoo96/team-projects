<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	if(${isFav }) { //해당 아이디로 프로젝트 좋아요 누른 상태
		$("#heart")
			.css("color", "red");
	} else { //좋아요 누르지 않은 상태
		
	}
	
	
	$(".btn_heart").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/news/favorite"
			, data: {"pNo" : '${info.pNo }'}
			, dataType: "json"
			, success: function( data ) {
// 				console.log("성공");
// 				console.log(data.result);
// 				console.log(data.cnt);
				
				if(data.result) { //찜 성공
					$("#heart").css("color", "red");
				
				} else { //찜 취소 성공
					$("#heart").css("color", "");
				
				}
				
				$("#cntFav").text(data.cnt);
				
			}
			, error: function() {
				console.log("실패");
			}
		})
	}) //$(".btn_heart").click(function() end
			
	if(${nullmNo} == null || "".equals(${nullmNo})) {
		
		$(".btn_declare").click(function() {
				alert("로그인 후 신고할 수 있습니다.");
				location.href = "/user/member/loginForm";
			});
		
	} //if end	
		
});

function category() {
	var categorySort = $("#category option:selected").val();
	var timeSort = $("#time option:selected").val();

// 	console.log(categorySort);
// 	console.log(timeSort);
	
	location.href = "/news?pNo=" + ${info.pNo } + "&categorySort=" + categorySort + "&timeSort=" + timeSort;

}


// function viewMore(cp) {
// 	console.log("cp : " + cp);
// }
	
</script>

<style type="text/css">
/* 전체 영역 */
.container {
	margin-top: 0;
}

hr {
	margin-top: 5px;
	margin-bottom: 5px;
}

#topMenu {
	height: 40px;
	width: 700px;
	margin: 0 auto;
}

#topMenu ul li {
	list-style: none;
	color: black;
	float: left;
	line-height: 40px;
	vertical-align: middle;
	text-align: center;
	display: flex;
}

#topMenu .menuLink {
	text-decoration: none;
	color: black;
	width: 150px;
	font-size: 15px;
}

/* 메뉴 옆 작은 숫자 */
#topMenu .count {
	position: relative;
	font-size: 14px;
	color: #4EE2EC;
	left: 2px;
}

#left {
	/* 영역 확인용 */
/*    	border: 1px solid red;    */
	float: left;
	width: 60%;
/* 	margin-left: 5px; */
 	padding-left: 30px; 
 	padding-right: 40px;
}

/* 새소식 감싸는 div */
#left .newsDiv {
	padding: 16px 16px 32px;
}

/* 뉴스 리스트 헤더 */
#left .newsDiv .newsListHeader {
	border-bottom: 1px solid #44484b;
	height: 42px;
}

#left .newsDiv .newsListHeader .newsHeaderTitle {
	line-height: 30px;
	font-size: 20px;
	font-weight: 700;
	font-style: normal;
	float: left;
}

/* 타이틀: 새소식 */
#left .newsDiv .newsListHeader .newsHeaderTitle .news_title {
	line-height: 1.47;
	font-size: 20px;
	font-weight: 700;
}

/* 타이틀 : 새소식 갯수 */
#left .newsDiv .newsListHeader .newsHeaderTitle .news_count {
	margin-left: 3px;
	line-height: 1.47;
	color: #4EE2EC;
	font-size: 20px;
	font-weight: 700;
}

/* 카테고리, 시간정렬 */
#left .newsDiv .newsListHeader .newsHeaderSelect {
	line-height: 20px;
	letter-spacing: 0;
	font-size: 15px;
	font-weight: 400;
	font-style: normal;
	float: right;
	margin-top: 5px;
}

/* 카테고리, 시간정렬 label */
#left .newsDiv .newsListHeader .newsHeaderSelect .selectLabel {
	position: relative;
	margin-left: 16px;
}

#left .newsDiv .newsListHeader .newsHeaderSelect .selectLabel .option {
	width: 68px;
	background-color: #fff;
	line-height: 1.33;
	font-size: 15px;
	outline: none;
/* 	appearance: none; */
}

/* 새소식 리스트 각각의 div */
#left .newsDiv .newsListDiv {
	box-shadow: 0 1px 0 0 rgb(0 0 0 / 10%);
    padding: 16px 0;
}

/* 리스트 카테고리 */
#left .newsDiv .newsListDiv .category {
	line-height: 18px;
	letter-spacing: 0;
	font-size: 12px;
	font-weight: 700;
	font-style: normal;
	color: #495057;
}

/* 리스트 카테고리 옆 구분선 */
#left .newsDiv .newsListDiv .division {
	display: inline-block;
	margin: -2px 8px 0 9px;
	background: #e6eaed;
	width: 1px;
	height: 10px;
	vertical-align: middle;
	content: "";
}

/* 오픈예정 */
#left .newsDiv .newsListDiv .schedule {
	line-height: 18px;
	letter-spacing: 0;
	font-size: 12px;
	font-weight: 400;
	font-style: normal;
	color: #495057;
}

/* 새소식 제목 */
#left .newsDiv .newsListDiv .news_title {
	line-height: 28px;
 	letter-spacing: -1px; /* 글씨 간격 */
	font-size: 16px;
	font-weight: 400;
	font-style: normal;
	margin: 4px 0;
}

/* 리스트 각각 작성된날짜 */
#left .newsDiv .newsListDiv .news_date {
	line-height: 18px;
	letter-spacing: 0;
	font-size: 12px;
	font-weight: 400;
	font-style: normal;
	color: #495057;
	margin-bottom: 7px;
}

</style>


<!-- 더보기 스타일 -->
<style type="text/css">
.newsDiv .view_more {
	background-color: transparent!important;
    padding: 0;
    width: 100%;
    font-size: 15px!important;
    height: 52px!important;
    border-width: 0;
}

.newsDiv .view_more.button {
	transition-property: background-color,border-color,color,opacity;
    transition-duration: .2s;
    border: 0px solid rgba(0,0,0,.15);
    border-radius: 3px;
    background-color: #fff;
    cursor: pointer;
    padding: 0 1.41176em;
    height: 48px;
    vertical-align: middle;
    line-height: 1;
    color: rgba(0,0,0,.54);
    font-size: 17px;
    font-weight: 400;
    box-sizing: border-box!important;
    -webkit-appearance: none;
    display: inline-block;
    padding-top: .07em;
    text-decoration: none;
    background: none;
    text-align: center;
    align-items:flex-start;
}

.newsDiv .view_more em {
    color: rgba(0,0,0,.3);
    margin: 0 2px 0 1px;
    font-style: normal;
}

.newsDiv .view_more i {
    width: 16px;
    height: 18px;
    font-size: 18px;
}

.newsDiv .view_more .expand_more::before {
    content: "⌄";
    padding-bottom: 4px;
}

.newsDiv .view_more .icon::before {
    display: inline-block;
    margin-top: -.2em;
    vertical-align: middle;
    text-transform: none;
    line-height: 1;
    font-family: wadizicon!important;
    font-weight: 400;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    font-style: normal;
    font-variant: normal;
}
</style>


<!-- right style -->
<style type="text/css">
#right {
	/* 영역 확인용 */ 
/*   	border: 1px solid green;   */
	float: right;
	width: 32%;
	margin-right: 15px;
	padding-top: 15px;
  	padding-right: 30px;  
}

#right .project_state_info p {
	margin-bottom: 25px;
	font-size: 16px;
	line-height: 30px;
}

#right .project_state_info p strong {
	padding-right: 5px;
	font-size: 24px;
	font-weight: 500;
}

/* 프로젝트 남은 일수 */
#right .project_state_info p.remaining_day {
	font-size: 28px;
	line-height: 36px;
	font-weight: 500;
/* 	margin-bottom: 25px; */
}

/* 프로젝트 남은 일수 밑에 바 */
#right .project_state_info p.rate_bar {
	width: 100%;
	height: 7px;
	background: white;
	overflow: hidden;
}

#right .project_state_info p.rate_bar em {
	width: 100%;
	display: block;
	height: 5px;
	background: #4EEDED;
}

/* 펀딩하기, 환불하기 버튼 감싸는 div */
#right .funding, #right .refund {
	width: 100%;
	margin-bottom: 15px;
	padding-top: 10px;
}

/* 환불하기 */
#right .refund {
	margin-top: -15px;
}


/* 펀딩하기, 환불하기 버튼 */
#right .funding .btn_funding, #right .refund .btn_refund {
	background-color: #4EE2EC;
	color: white;
	border-color: #4EE2EC;
	width: 100%;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	height: 48px;
	font-size: 20px;
	font-weight: 400;
	vertical-align: middle;
	box-sizing: border-box!important;
}

/* 찜하기, 신고하기 버튼 */
.buttons {
	width: 100%;
	margin-bottom: 10px;
}

/* 찜하기 div */
.buttons .heart {
	float: left;
	width: 48%;
/* 	margin-left: 5px; */
}

/* 찜하기 버튼 */
.buttons .heart .btn_heart {
	font-size: 15px;
	width: 100%;
	height: 38px;
	background: #fff;
	border: 1px solid #dadce0;
	border-radius: 2px;
}

/* 신고하기 div */
.buttons .declare {
	float: right;
	width: 48%;
/* 	margin-right: 5px; */
}

/* 신고하기 버튼 */
.buttons .declare .btn_declare {
	font-size: 15px;
	width: 100%;
	height: 38px;
	background: #fff;
	border: 1px solid #dadce0;
	border-radius: 2px;
}

.active{
	border-bottom: 3px solid #4EE2EC;
}
</style>

<div class="container">
<br><br><hr>

<div id="titleHeader">
<!-- 	<div class="titleBg" style="background-image: -->
<!-- 		url('/resources/img/test1.png')"> -->
<!-- 	</div> -->
	<p class="text-center">${info.iCategory }</p>
	<p class="lead text-center">${info.iTitle }</p>
</div><!-- #titleHeader end --> <hr>

<div class="reward-nav">
<nav id="topMenu">
	<ul>
		<li><a class="menuLink" href="/story?pNo=${info.pNo }">스토리</a></li>
		<li class="active"><a class="menuLink" href="/news?pNo=${info.pNo }">새소식<span class="count">${newsCnt }</span></a></li>
		<li><a class="menuLink" href="/community?pNo=${info.pNo }">커뮤니티<span class="count">${communityCnt }</span></a></li>
		<li><a class="menuLink" href="/supporter?pNo=${info.pNo }">서포터<span class="count">${totalCnt }</span></a></li>
	</ul>
</nav><!-- #topMenu end -->
</div><!-- .reward-nav end --> <hr><br>


<div id="left">
	<!-- 새소식 감싸는 div -->
	<div class="newsDiv">
		<div class="newsListHeader">
			<span class="newsHeaderTitle">
				<span class="news_title">새소식</span>
				<span class="news_count">${newsCnt }</span>
			</span>
			<span class="newsHeaderSelect">
				<label class="selectLabel">
					<select class="option category" id="category" name="category" 
						onchange="category()">
						<option value="전체">전체</option>
						<option value="이벤트">이벤트</option>
						<option value="리워드">리워드 안내</option>
						<option value="리워드">결제</option>
					</select>
					<i></i> <!-- 아이콘 -->
				</label>
				<label class="selectLabel">
					<select class="option time" id="time" name="time"
						onchange="category()">
						<option value="최신순">최신순</option>
						<option value="과거순">과거순</option>
					</select>
					<i></i> <!-- 아이콘 -->
				</label>
			</span>
		</div><!-- .newsListHeader end -->


		<div>
		<c:forEach items="${newsList }" var="news">
			<div class="newsListDiv" style="cursor: pointer;" onclick="location.href='/news/view?nNo=${news.nNo}&pNo=${news.pNo }';">
				<p>
					<span class="category">${news.nCategory }</span>
					<span class="division"></span>
					<span class="schedule">오픈예정</span>
				</p>
				<p class="news_title">${news.nTitle }</p>
				<p class="news_date">
					<fmt:formatDate pattern="yyyy.MM.dd" value="${news.nCreateDate }"/>
				</p>
			</div>
		</c:forEach>
		</div>
		
		<!-- 더보기 버튼 -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${paging.totalCount < 9 }"> --%>
<%-- 				<button id="btnViewMore" type="button" disabled="disabled" class="view_more button less" onclick="viewMore(${paging.curPage})"> --%>
<!-- 					더보기 -->
<%-- 					<em>${paging.totalCount }/${paging.totalCount }</em> --%>
<!-- 					<i class="icon expand_more"></i> -->
<!-- 				</button> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<button id="btnViewMore" type="button" class="view_more button less" onclick="viewMore(${paging.curPage})"> --%>
<!-- 					더보기 -->
<!-- 					<em class="listCount">9</em> -->
<!-- 					<em>/</em> -->
<%-- 					<em class="totalCount">${paging.totalCount }</em> --%>
<!-- 					<i class="icon expand_more"></i> -->
<!-- 				</button> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
		
	</div><!-- .newsDiv end -->
</div><!-- #left end -->


<div id="right">
	<div class="project_state_info">
		<p class="remaining_day">${remainDay }일 남음</p>
		<p class="rate_bar">
			<em></em>
		</p>
		<p class="achievement_rate">
			<strong>${totalAmount/info.iMoney*100 }</strong>% 달성
		</p>
		<p class="total_amount">
			<strong>${totalAmount }</strong>원 펀딩
		</p>
		<p class="total_supporter">
			<strong>${totalCnt }</strong>명의 서포터
		</p>
	</div>
	<div class="funding">
		<a href="/user/reward/view?pNo=${info.pNo }"><button class="btn_funding">펀딩하기</button></a>
	</div>
	<div class="refund">
		<a href="/user/payback/view?pNo=${info.pNo }"><button class="btn_refund">환불하기</button></a>
	</div>
	<div class="buttons">
		<div class="heart">
			<button class="btn_heart">
				<i id="heart" class="fa fa-heart" aria-hidden="true"></i>
				<em id="cntFav">${cntFav }</em>
			</button>
		</div>
		<div class="declare">
			<button class="btn_declare" data-toggle="modal" data-target="#reportModal">
				신고하기
			</button>
		</div>
	</div>
</div><!-- #right end --> 

<!-- 신고하기 Modal -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">게시물 신고하기</h4>
      </div><br>
      <div class="modal-body">
      
      	<div>
      		<p style="font-size: 18px; margin-bottom: -7px;">신고 내용:</p>
      	</div>
      
		<form action="/project/report?pNo=${info.pNo }" method="post" id="report">
	      	<label for="repContent" class="control-label"></label>
          	<textarea class="form-control" id="repContent" name="repContent" style="height: 300px;"></textarea>
	    </form>
	    
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn" form="report"
        	style="background-color: #4EE2EC; width: 90px; height: 40px;">신고하기</button>
      </div>
    </div>
  </div>
</div>


<div style="clear: both;"></div>
</div>


<br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />