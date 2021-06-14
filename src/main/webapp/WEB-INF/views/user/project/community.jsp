<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			, url: "/community/favorite"
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
	margin-left: 5px;
/* 	padding-left: 10px; */
}

#left .comDiv {
	margin-bottom: 40px;
	font-size: 13px;
}

/* left 안에 가장 위 멘트 */
#left .comDiv .ment {
	line-height: 24px;
	font-size: 16px;
	padding-bottom: 30px;
	box-shadow: 0 1px 0 0 rgb(0 0 0 / 10%);
	margin-bottom: 60px;
/* 	border-bottom: 1px solid #44484b; */
}

/* 멘트 밑 제목 */
#left .comDiv .comContainer .comTitle {
	margin-bottom: 24px;
}

/* 응원, 질문, 체험리뷰 */
#left .comDiv .comContainer .comTitle .commuTitle {
	position: relative;
	margin-bottom: 8px;
	line-height: 24px;
	font-size: 20px;
	font-weight: 700;
}

/* 응원,질문,체험리뷰 개수 */
#left .comDiv .comContainer .comTitle .commuTitle em {
	margin-left: 4px;
	color: #4EE2EC;
}

#left .comDiv .comContainer .comTitle .explain {
	color: rgba(0,0,0,.54);
	font-size: 13px;
}

/* 글 남기기 버튼 */
#left .comDiv .comContainer .writeCom {
	background-color: #90949c;
	color: #fff;
	border-color: #90949c;
	border-radius: 3px;
	cursor: pointer;
	height: 48px;
	vertical-align: middle;
	line-height: 1;
	font-size: 17px;
	font-weight: 400;
	padding-top: .07em;
	width: 343px;
	margin-bottom: 24px;
}

/* 커뮤 리스트 하나하나의 div */
#left .comDiv .comContainer .communityList .itemContainer {
	position: relative;
	padding-top: 16px;
	padding-bottom: 16px;
}

#left .comDiv .comContainer .communityList .itemContainer .item {
	position: relative;
	padding: 0 0 0 56px;
}

#left .comDiv .comContainer .communityList .itemContainer .item .itemIcon {
	position: absolute;
	top: 0;
	left: 0;
}

/* 프로필 사진 */
.profile {
	width: 36px;
	height: 36px;
	display: inline-block;
	position: relative;
	border-radius: 50%;
	vertical-align: middle;
}
</style>


<style type="text/css">
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
		<li><a class="menuLink" href="/community?pNo=${info.pNo }">커뮤니티<span class="count">2</span></a></li>
		<li><a class="menuLink" href="/supporter?pNo=${info.pNo }">서포터<span class="count">${totalCnt }</span></a></li>
	</ul>
</nav><!-- #topMenu end -->
</div><!-- .reward-nav end --> <hr><br>


<div id="left">
<div class="comDiv">
	<div class="ment">
		<p>
			서포터님!<br>처음 <strong>메이커의 열정과 가치에 공감</strong>
			해주셨듯, 마지막까지 <strong>메이커를 응원</strong>해주세요.
		</p>
	</div>
	<div class="comContainer">
	
		<!-- 응원,질문,체험리뷰 -->
		<div class="comTitle">
			<div class="commuTitle">
				<p>응원 · 질문 · 체험리뷰
					<em>86</em>
				</p>
			</div>
			<p class="explain">펀딩 종료전에 남긴 글입니다.</p>
		</div>
		
		<!-- 글 남기기 버튼 -->
		<div>
			<button class="writeCom">글 남기기</button>
		</div>
		
		<!-- 질문, 답변 전체 -->
		<div class="communityList">
			<div style="height: 20px; border-bottom: 1px solid #44484b;" ></div>
			<div>
				<!-- 리스트 하나하나 -->
				<div class="itemContainer">
					<div class="item">
					
						<!-- 아이콘 -->
						<div class="itemIcon">
							<img class="profile" src="/resources/img/basic.png">
						</div>
						<!-- 글씨 -->
						<div class="itemMain">
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
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