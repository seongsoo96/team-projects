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
			
});
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
/*   	border: 1px solid red;   */
	float: left;
	width: 60%;
/* 	margin-left: 5px; */
/* 	padding-left: 10px; */
}

/* view 감싸는 div */
#left .newsViewDiv {
	padding: 16px 16px 32px;
}

/* 목록으로가기 버튼 */
#left .newsViewDiv a .gobackBtn {
	margin-top: 0;
	padding: 0 16px;
	height: 36px;
	font-size: 15px;
	border: 1px solid rgba(0,0,0,.15);
	border-radius: 3px;
	background-color: #fff;
	vertical-align: middle;
	line-height: 1; 
	color: rgba(0,0,0,.54);
	font-weight: 400;
}

/* 글 정보 영역 */
#left .newsViewDiv .newsViewTitle {
	margin-top: 40px;
	margin-bottom: 16px;
}

/* 카테고리 */
#left .newsViewDiv .newsViewTitle .news_category {
	line-height: 18px;
	letter-spacing: 0;
	font-size: 12px;
	font-weight: 700;
	color: #495057;
}

/* 제목 */
#left .newsViewDiv .newsViewTitle .news_title {
	line-height: 30px;
	letter-spacing: -.6px;
	font-size: 20px;
	font-weight: 700;
	margin: 12px 0;
}

/* 작성시간 */
#left .newsViewDiv .newsViewTitle .news_time {
	line-height: 20px;
	letter-spacing: 0;
	font-size: 14px;
	font-weight: 400;
	color: #495057;
}

/* 새소식 내용 div */
#left .newsViewDiv .newsDetail {
	box-shadow: 0 1px 0 0 rgb(0 0 0 / 10%), 0 -1px 0 0 rgb(0 0 0 / 10%);
    padding: 20px 0 40px;
}

/* 내용 */
#left .newsViewDiv .newsDetail .newsContent {
	line-height: 28px;
	font-size: 16px;
	font-weight: 400px;
}


#right {
	/* 영역 확인용 */ 
/*   	border: 1px solid green;   */
	float: right;
	width: 35%;
	margin-right: 15px;
	padding-top: 15px;
/*  	padding-left: 5px; */
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
		<li class="active"><a class="menuLink" href="/story?pNo=${info.pNo }">스토리</a></li>
		<li><a class="menuLink" href="/news?pNo=${info.pNo }">새소식<span class="count">${newsCnt }</span></a></li>
		<li><a class="menuLink" href="/community?pNo=${info.pNo }">커뮤니티<span class="count">${communityCnt }</span></a></li>
		<li><a class="menuLink" href="/supporter?pNo=${info.pNo }">서포터<span class="count">${totalCnt }</span></a></li>
	</ul>
</nav><!-- #topMenu end -->
</div><!-- .reward-nav end --> <hr><br>


<div id="left">
	<!-- view 감싸는 div -->
	<div class="newsViewDiv">
	
		<a href="#" onclick="history.back()">
			<button class="gobackBtn">
				<i class="fa fa-angle-left" aria-hidden="true"></i><!-- 왼쪽 화살표 아이콘 -->
				목록으로 이동
			</button>
		</a>
		
		<div class="newsViewTitle">
			<p>
				<span class="news_category">${view.nCategory }</span>
			</p>
			<p class="news_title">${view.nTitle }</p>
			<p class="news_time">
				<fmt:formatDate pattern="yyyy.MM.dd HH:ss" value="${view.nCreateDate }"/>
			</p>
		</div>
		
		<div class="newsDetail">
			<div class="newsContent">
				${view.nContext }
			</div>
		</div>
	</div><!-- .newsViewDiv end -->
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
		<button class="btn_funding">펀딩하기</button>
	</div>
	<div class="refund">
		<button class="btn_refund">환불하기</button>
	</div>
	<div class="buttons">
		<div class="heart">
			<button class="btn_heart">
				<i id="heart" class="fa fa-heart" aria-hidden="true"></i>
				<em id="cntFav">${cntFav }</em>
			</button>
		</div>
		<div class="declare">
			<button class="btn_declare">
				신고하기
			</button>
		</div>
	</div>
</div><!-- #right end --> 


<div style="clear: both;"></div>
</div>


<br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />