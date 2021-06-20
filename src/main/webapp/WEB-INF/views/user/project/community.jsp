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
	
	
	/* 좋아요 버튼 */
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
	}); //$(".btn_heart").click(function() end
			
			
	if(${nullmNo} == null || "".equals(${nullmNo})) {
		
		$(".writeCom").click(function() {
				alert("로그인 후 사용하세요");
				location.href = "/user/member/loginForm";
			});
		
	} //if end
	
	/* 신고 버튼 */
// 	if(${nullmNo} == null) || "".equals("${nullmNo}")) {
	if(${nullmNo} == null) {
		
		$(".btn_declare").click(function() {
				alert("로그인 후 신고할 수 있습니다.");
				location.href = "/user/member/loginForm";
			});
		
	} //if end	
	
	
	/* 답글 버튼 */
// 	$(".answerBtn").click(function() {
		
// 		if(${nullmNo} == null || "".equals(${nullmNo})) {//로그인 안되어있을 경우
// 			alert("로그인 후 사용 가능. 메이커만 답변 가능합니다.");	
			
// 		} else if ("${nullmNo}".equals("yes") && "${mNo}".equals("${makerMno}")) { //로그인 되어있고 메이커인 경우
			
// 		} else { //로그인 되어있고 메이커가 아닌 경우
// 			alert("메이커만 답변 가능합니다.")
// 		}
		
// 	});
	
	
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
 	padding-left: 30px; 
 	padding-right: 30px;
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

/* 왼쪽 프로필 영역 */
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

/* 프로필 오른쪽 영역 */
#left .comDiv .comContainer .communityList .itemContainer .item .itemMain {
	position: relative;
}

/* 작성자 아이디 */
.itemContainer .item .itemMain .itemUserId {
	min-height: 44px;
	line-height: 36px;
}

/* 작성자 아이디 */
.itemContainer .item .itemMain .itemUserId .userid {
	margin-left: 0;
	line-height: 20px;
	font-size: 15px;
	font-weight: 700;
	margin-right: 10px;
	vertical-align: middle;
}

/* 작성 시간 */
.itemContainer .item .itemMain .itemUserId .writeTime {
	line-height: 16px;
    color: rgba(0,0,0,.54);
    font-size: 12px;
    vertical-align: middle;
}

/* 내용 */
.itemContainer .item .itemMain .content {
	line-height: 24px;
	color: #44484b;
	font-size: 15px;
}

/* 답글 버튼 div */
.itemContainer .item .itemMain .answer {
	padding-top: 8px;
	padding-bottom: 8px;
}

/* 답글 버튼 */
.itemContainer .item .itemMain .answer .answerBtn {
	padding: 0 10px;
	height: 28px;
	line-height: 26px;
	font-size: 12px;
	
	border: 1px solid rgba(0,0,0,.15);
    background-color: #fff;
    color: rgba(0,0,0,.54);
    
    /*답글 있을 때 배경색 설정*/
/*     background-color: #f0f2f5; */
}

/* 메이커 답변 div */
.itemContainer .makerReply {
	margin-left: 52px;
}

.itemContainer .makerReply .replyBox {
	background: #f5f7fa;
	padding: 0 16px;
}

.itemContainer .makerReply .replyBox .reply {
	position: relative;
	padding-top: 16px;
	padding-bottom: 16px;
}

.itemContainer .makerReply .replyBox .reply .makerWrapper {
	position: relative;
	padding: 0 0 0 56px;
}

.itemContainer .makerReply .replyBox .reply .makerWrapper .makerProfile {
	position: absolute;
	top: 0;
	left: 0;
}

/* 메이커 프로필 사진 */
.itemContainer .makerReply .replyBox .reply .makerWrapper .makerProfile .maker_profile {
	width: 36px;
	height: 36px;
	display: inline-block;
	position: relative;
	border-radius: 50%;
	vertical-align: middle;
	cursor: pointer;
}

/* 메이커 프로필 오른쪽 영역 */
.makerWrapper .makerReplyDiv {
	position: relative;
}

.makerWrapper .makerReplyDiv .makerInfo {
	min-height: 44px;
	line-height: 36px;
}

/* 메이커 이름 */
.makerWrapper .makerReplyDiv .makerInfo .makername {
	margin-left: 0;
	line-height: 20px;
	color: black;
	font-size: 15px;
	font-weight: 700;
}

.makerWrapper .makerReplyDiv .makerInfo .makername a {
	color: black;
}

/* 메이커 태그 */
.makerWrapper .makerReplyDiv .makerInfo .maker {
	background: #4EE2EC;
	display: inline-block;
	padding: 0 4px;
	line-height: 18px;
	color: #fff;
	font-size: 10px;
	font-weight: 500;
	
	margin-left: 3px;
	margin-right: 8px;
}

/* 메이커 답변 시간 */
.makerWrapper .makerReplyDiv .makerInfo .replyTime {
	line-height: 16px;
    color: rgba(0,0,0,.54);
    font-size: 12px;
    vertical-align: middle;
}

/* 메이커 답변 내용 div */
.makerWrapper .makerReplyDiv .reply_container {
	line-height: 24px;
	color: #44484b;
	font-size: 15px;
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


<!-- Modal style -->
<style type="text/css">
.warning {
	margin: 24px auto;
/* 	border: 0; */
	background-color: hsla(0,100%,70%,.1);
	padding: 16px;
	line-height: 1.38;
	color: #7c8288;
	font-size: 13px;
	
}

.warning p {
	color: #f66;
}

.riskMessage {
	line-height: 20px;
    letter-spacing: 0;
    color: #868e96;
    font-size: 13px;
    font-weight: 400;
}

.riskMessage .risk_inner {
	margin: 56px 0 40px;
	font-size: 17px;
	line-height: 1.8em;
	text-align: left;
}

.riskMessage .risk_inner h1 {
	font-weight: 400;
	font-size: 28px;
	text-align: left;	
	margin: 2em 0 0 20px;
	line-height: 1.4em;
	color: #0D0F12;
	letter-spacing: -.02em;
}

.riskMessage .risk_inner ol {
	margin: 1em 0;
	letter-spacing: -.02em;
/* 	list-style: none; */
	padding-right: 10px;
}

.riskMessage .risk_inner ol li {
	margin: 0 0 .5em 1.25em;
	position: relative;
 	margin-left: 0; 
	padding-left: 16px;
/* 	list-style: none; */
	color: #44484B;
	line-height: 1.8em;
	font-size: 13px;
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
		<li><a class="menuLink" href="/news?pNo=${info.pNo }">새소식<span class="count">${newsCnt }</span></a></li>
		<li class="active"><a class="menuLink" href="/community?pNo=${info.pNo }">커뮤니티<span class="count">${communityCnt }</span></a></li>
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
					<em>${communityCnt }</em>
				</p>
			</div>
			<p class="explain">펀딩 종료전에 남긴 글입니다.</p>
		</div>
		
		<!-- 글 남기기 버튼 -->
		<div>
			<button class="writeCom" data-toggle="modal" data-target="#myModal">
			글 남기기
			</button>
		</div>
		
		
		
		<!-- 커뮤니티 글 남기기 Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    
		    
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h2 class="modal-title" id="myModalLabel">글 남기기</h2>
		      </div> <br>
		      <div class="modal-body">
		      
			      <p style="margin-bottom: 10px; line-height: 1.33; font-size: 15px; font-weight: 400;">
			     	 응원∙질문∙체험리뷰를 남겨주세요. <br>	
			     	 메이커에게 답변을 받을 수 있습니다.
			      </p>
			      
			      <form action="/community?pNo=${info.pNo }" method="post" id="write_community">
			      	<label for="comContent" class="control-label"></label>
	            	<textarea class="form-control" id="comContent" name="comContent" style="height: 300px;"></textarea>
			      </form>
			      
			      <!-- 경고 메시지 -->
			      <div class="warning">
			      	<p>최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는 점을 유의하여 주시기 바랍니다.</p>
			      </div>
			      
			      <!-- 이용 안내 -->
			      <div class="riskMessage">
			      	<div class="risk_inner">
			      		<article>
			      			<h1>게시물 이용안내</h1>
			      			<ol>
			      				<li>본 프로젝트와 무관한 글, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있으며, 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.</li>
			      				<li>서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.</li>
			      				<li>체험 리뷰는 반드시 펀딩을 위해 진행된 오프라인 전시(체험)에 참여한 후 작성하세요.</li>
			      			</ol>
			      		</article>
			      	</div>
			      </div>
		      
		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="btn" form="write_community"
		        	style="background-color: #4EE2EC; width: 90px; height: 40px;">등록
		        </button>
		      </div>
		    </div>
		  </div>
		</div><!-- Modal end -->
		
		
		
		<!-- 질문, 답변 전체 -->
		<div class="communityList">
			<div style="height: 20px; border-bottom: 1px solid #44484b;" ></div>
			
			<c:forEach items="${list }" var="list">
			<div>
				<!-- 리스트 하나하나 -->
				<div class="itemContainer">
				
					<div class="item">
						<input type="hidden" name="comNo" value="${list.comNo }"><!-- 커뮤니티번호 -->
					
						<!-- 아이콘 -->
						<div class="itemIcon">
							<img class="profile" src="/resources/img/basic.png">
						</div>
						
						<!-- 글씨 -->
						<div class="itemMain">
						
							<!-- 아이디, 작성시간 -->
							<div class="itemUserId">
								<span class="userid">
									<a href="#" style="color: black;">${list.cid }</a>
								</span>
								<span class="writeTime">11시간 전</span>
							</div>
							
							<!-- 내용 -->
							<div>
								<div class="content">
									<div>${list.comContent }</div>
								</div>
							</div>
							
							<!-- 답글 버튼 -->
							<div class="answer">
								<c:if test="${mNo ne '' and mNo eq makerMno }">
								<button class="answerBtn" data-toggle="modal" data-target="#answerModal">
									답글
								</button>
								</c:if>
							</div>
							
							
							<!-- 답글 Modal -->
							<div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
							      </div>
							      <div class="modal-body">
							      
							      	<div>
							      		<p style="font-size: 18px; margin-bottom: -7px;">메이커 답변 내용:</p>
							      	</div>
							      
							      	<form action="/community/answer?pNo=${info.pNo }&comNo=${list.comNo }" method="post" id="community_answer">
<%-- 							      	<form action="/community/answer?pNo=${info.pNo }" method="post" id="report"> --%>
								      	<label for="caContent" class="control-label"></label>
							          	<textarea class="form-control" id="caContent" name="caContent" style="height: 300px;"></textarea>
								    </form>
								    
							      </div>
							      <div class="modal-footer">
							        <button type="submit" class="btn" form="community_answer"
							        	style="background-color: #4EE2EC; width: 90px; height: 40px;">답글 달기</button>
							      </div>
							    </div>
							  </div>
							</div><!-- 답글 Modal end -->
							
							
						</div>
						
					</div>
					
					<!-- 메이커의 답변이 있을 때만 출력 -->
					<c:if test="${list.caid ne '' and list.caid ne null}">
					<!-- 메이커의 답변 -->
					<div class="makerReply">
						<div class="replyBox">
							<div class="reply">
								<div class="makerWrapper">
								
									<!-- 메이커 프로필 사진 left -->
									<div class="makerProfile">
										<img class="maker_profile" src="/resources/img/basic.png">
									</div>
									
									<!-- 메이커 답변 right -->
									<div class="makerReplyDiv">
									
										<!-- 메이커 이름 -->
										<div class="makerInfo">
											<span class="makername">
												<a href="#">${list.caid }</a>
											</span>
											<span class="maker">메이커</span>
											<span class="replyTime">7시간 전</span>
										</div>
										
										<!-- 메이커 답변 -->
										<div>
											<div class="reply_container">
												<div>${list.caContent }</div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:if>
					
				</div><!-- .itemContainer end -->
			</div>
			</c:forEach>
			
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