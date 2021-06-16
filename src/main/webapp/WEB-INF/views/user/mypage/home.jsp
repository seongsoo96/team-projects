<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* '>' svg */
.arrow-img {width:20px; height:20px; vertical-align:bottom;}

/* 서포터, 메이커 버튼 */
.mypage-header {position:relative; width:100%; height:45px;}
.mypage-header .switch-btns-box {position:absolute; top:1px; right:60px; height:100%;}
.mypage-header .switch-btns-box > button {position:relative; font-size:15px; transition-duration:0.4s; width:80px; height:100%; border-radius:10px 10px 0 0; border-bottom:none;}
.mypage-header .switch-btns-box > button:hover {color:#4EE2EC; font-weight:400;}
.mypage-header .switch-btns-box .btnMaker {right:4px;}

/* 서포터, 메이커 버튼 클릭 됐을 때 스타일 지정 */
.selectBtnStyle {color:#4EE2EC; z-index:21; border:2px solid black; background-color:black; font-weight:600;}
.unselectBtnStyle {color:#ccc; z-index:1; border:1px solid #ccc; background-color:white; font-weight:100;}

/* 본문(프로필, 바로가기메뉴) 영역 */
.mypage-contents-wrap{border:2px solid black; height:550px; position:relative; z-index:11; border-radius:20px;}

/* 프로필 박스 위치 */
.mypage-contents-wrap .profile-box {position:relative; float:left; left:10px; width:230px; padding:25px 25px 0; font-size:15px;}

/* 프로필 사진 */
.mypage-contents-wrap .profile-box .profile-img {float:none; position:relative; margin: 0 45px 20px; width:80px; height:80px; border-radius:50%; border: 1px solid rgba(0,0,0,.06);}
.mypage-contents-wrap .profile-box .profile-img:hover {border:1px solid black;}
/* 프로필 닉네임*/
.mypage-contents-wrap .profile-box .profile-nick {margin-bottom: 40px;}
.mypage-contents-wrap .profile-box .profile-nick button {width:100%; background:none; border:none;}
.mypage-contents-wrap .profile-box .profile-nick button:hover {text-decoration:underline;}

/* 프로필 로그아웃  */
.mypage-contents-wrap .profile-box .profile-logout button {width:100%; background:none; border:1px solid #ccc; border-radius:8px; height:35px; transition-duration:0.4s;}
.mypage-contents-wrap .profile-box .profile-logout button:hover {background:#f0f0f5;}

/* 바로가기 메뉴 영역 속성 */
.mode-menu-box {position:relative; float:left; width:calc(100% - 230px); padding:35px 30px 0;}
.mode-menu-box div h3 {font-size:18px;}

/* 바로가기 메뉴 공통 (서포터, 메이커 모두 적용) */
.mymenu > div > div > a {position:relative;}
.mymenu > div {height:120px;}
.mymenu .span-menu-name {display:inline-block; color:black;}
.mymenu .span-menu-name:hover {text-decoration:none; color:#4EE2EC;}
.mymenu .span-menu-name span {display:inline-block; width:160px;}

/* 바로가기 메뉴 -서포터 모드) */
.myfunding, .fundingchart, .favorite, .message, .mywrite, .myprofile, .myinfo, .myopenpj, .myprepj  {
	float:left; width:50%; font-size:15px; padding: 0 5%; margin:15px 0;
}

/* clearfix
div.mywrite::after {display:block; content:""; clear:both;} 
*/

/* 바로가기 메뉴 - 메이커 모드 (새 프로젝트 생성) */
#maker-menu .newpj {
	position:relative; border:1px solid rgba(0,0,0,.06); border-radius:15px; height:250px; text-align:center; margin-bottom:35px;
}
#maker-menu .newpj > a {color:black;}
#maker-menu .newpj > a:hover {text-decoration:none; color:#4EE2EC;}
#maker-menu .newpj > a > span {font-size:17px;}

/* 아이콘 스타일 */
a span svg {margin-right:10px;}
</style>
<div class="container" style="margin-bottom:50px;">
	<!-- 1. 서포터, 메이커 버튼 -->
	<div class="mypage-header">
		<div class="switch-btns-box">
			<button type="button" class="btnSupporter" id="btnSupporter">
				<span id="sptIcon"><i class="fas fa-caret-down"></i></span>서포터
			</button>
			<button type="button" class="btnMaker" id="btnMaker">
				<span id="makIcon"><i class="fas fa-caret-down"></i></span>메이커
			</button>
		</div>
	</div>
	
	<!-- 2. 프로필 & 바로가기 메뉴 -->
	<div class="mypage-contents-wrap">
		<!-- 2-1. 프로필 -->
		<div class="profile-box">
			<!-- 2-1-1. 프로필 사진 -->
			<a href="/user/mypage/profile">
			<c:choose>
				<c:when test="${fn:contains(profile.myStoredName, 'test') or ('member.png' eq profile.myStoredName) }">
					<img class="profile-img" src="/resources/img/member.png">
				</c:when>
				<c:otherwise>
					<img class="profile-img" src="/upload/profile/${profile.myStoredName }">
				</c:otherwise>
			</c:choose>
			</a>
			
			<!-- 2-1-2. 닉네임-->
			<div class="profile-nick">
				<button type="button" onclick="location.href='/user/mypage/detail'">
					<span style="font-weight:600">${mNick }</span>
					<span>님</span>
					<img src="/resources/img/arrow.svg" class="arrow-img">
				</button>
			</div>
			<!-- 2-1-3. 로그아웃 -->
			<div class="profile-logout">
				<button type="button" onclick="location.href='/user/member/logout'">로그아웃</button>
			</div>
		</div><!-- div.profile-box END -->
	
		<!-- 2-2. 바로가기 (서포터 모드 / 메이커 모드) -->
		<div class="mode-menu-box">
			<!-- 서포터 모드 -->
			<div class="mymenu" id="supporter-menu">
				<div>
					<h3>나의 프로젝트</h3>
					<div class="myfunding">
						<a href="/user/mypage/myfunding">
							<span class="span-menu-name">
								<i class="far fa-handshake"></i>
								<span>나의 펀딩</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
					<div class="fundingchart">
						<a href="/user/mypage/fundingchart">
							<span class="span-menu-name">
								<i class="fas fa-receipt"></i>
								<span>펀딩 내역</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div style="margin-bottom:60px;">
					<h3>나의 활동</h3>
					<div class="favorite">
						<a href="/user/mypage/favorite">
							<span class="span-menu-name">
								<i class="fas fa-heart"></i>
								<span>좋아요</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
					<div class="message">
						<a href="/user/mypage/message">
							<span class="span-menu-name">
								<i class="far fa-envelope"></i>
								<span>메시지</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
					<div class="mywrite">
						<a href="/user/mypage/fundcomm">
							<span class="span-menu-name">
								<i class="fas fa-keyboard"></i>
								<span>내가 쓴 글</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
				</div>
				<div>
					<h3>나의 정보</h3>
					<div class="myprofile">
						<a href="/user/mypage/profile">
							<span class="span-menu-name">
								<i class="far fa-user-circle"></i>
								<span>프로필</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
					<div class="myinfo">
						<a href="/user/mypage/detail">
							<span class="span-menu-name">
								<i class="fas fa-user-cog"></i>
								<span>회원정보</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
				</div>
			</div><!-- div#supporter-menu END -->
			

			<!-- 메이커 모드 -->
			<div class="mymenu" id="maker-menu">
				<div class="newpj">
					<a href="/user/maker/project/list">
						<img src="/resources/img/subLogo.png" style="width:218px"><br>
						<span>
							새 프로젝트 개설하기
							<img src="/resources/img/arrow.svg" class="arrow-img">
						</span>
					</a>
				</div>
				<div>
					<div class="myopenpj">
						<a href="/user/mypage/openpj">
							<span class="span-menu-name">
								<i class="fas fa-play"></i>
								<span>오픈 프로젝트</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
					<div class="myprepj">
						<a href="/user/mypage/prepj">
							<span class="span-menu-name">
								<i class="fas fa-map"></i>
								<span>오픈예정 프로젝트</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
					<div class="message">
						<a href="/user/mypage/message">
							<span class="span-menu-name">
								<i class="far fa-envelope"></i>
								<span>메시지</span>
								<img src="/resources/img/arrow.svg" class="arrow-img">
							</span>
						</a>
					</div>
				</div>
			</div><!-- div#maker-menu END -->
		</div><!-- div.mode-menu-box END -->
	</div><!-- div.mypage-contents-wrap END -->
</div><!-- div.container END -->
<script type="text/javascript">
$(document).ready(function() {
	<%-- '서포터' 버튼 클릭 시 서포터 메뉴만 보이도록 설정 --%>
	$("#btnSupporter").click(function () {
		$("#supporter-menu").show()
		$("#maker-menu").hide()
		
		$("#sptIcon").show()
		$("#makIcon").hide()
		
		$(this).removeClass("unselectBtnStyle").addClass("selectBtnStyle")
		$("#btnMaker").removeClass("selectBtnStyle").addClass("unselectBtnStyle")
	})
	
	<%-- '메이커' 버튼 클릭 시 메이커 메뉴만 보이도록 설정 --%>
	$("#btnMaker").click(function () {
		$("#maker-menu").show()
		$("#supporter-menu").hide()

		$("#makIcon").show()
		$("#sptIcon").hide()
		
		$(this).removeClass("unselectBtnStyle").addClass("selectBtnStyle")
		$("#btnSupporter").removeClass("selectBtnStyle").addClass("unselectBtnStyle")
	})
	
	<%-- home 초기값: 서포터 모드 --%>
	$("#btnSupporter").click()
})
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>