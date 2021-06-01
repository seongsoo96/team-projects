<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
/* 모든 a 태그 hover 시 밑줄 효과 제거 */
a:hover {text-decoration: none;}

/* '>' 아이콘 */
svg {display:inline-block; width:20px; height:20px; vertical-align:middle;}

/* 서포터, 메이커 버튼 */
.mypage-header {position:relative; border:1px solid; width:100%; height:50px;}
.mypage-header .switch-btns-box {position:absolute; right:60px; border:3px solid red; height:100%;}
.mypage-header .switch-btns-box > button {font-size:15px; background-color:white; transition-duration:0.4s; border:2px solid green; width:80px; height:100%;}
.mypage-header .switch-btns-box > button:hover {color:#4EE2EC; border:none;}

/* 본문(프로필, 바로가기메뉴) 영역 */
.mypage-contents-wrap{border:1px solid coral; height:650px;}

/* 프로필 박스 위치 */
.mypage-contents-wrap .profile-box {position:relative; float:left; width:230px; padding:25px 25px 0; font-size:15px;}

/* 프로필 사진 */
.mypage-contents-wrap .profile-box .profile-img {float:none; position:relative; margin: 0 45px 20px; width:80px; height:80px; border-radius:50%; border: 1px solid rgba(0,0,0,.06);}

/* 프로필 닉네임*/
.mypage-contents-wrap .profile-box .profile-nick {margin-bottom: 40px;}
.mypage-contents-wrap .profile-box .profile-nick button {width:100%; background:none; border:none;}

/* 프로필 로그아웃  */
.mypage-contents-wrap .profile-box .profile-logout button {width:100%; background:none; border:1px solid #ccc; border-radius:8px; height:35px; transition-duration:0.4s;}
.mypage-contents-wrap .profile-box .profile-logout button:hover {background:#f0f0f5;}

/* 바로가기 메뉴 영역 속성 */
.mode-menu-box {position:relative; float:left; width:calc(100% - 230px); padding:35px 30px 0;}
.mode-menu-box div h3 {font-size:18px;}

/* 바로가기 메뉴 공통 */
.myfunding, .fundingchart, .favorite, .message, .mywrite, .myprofile, .myinfo, .myopenpj, .myprepj  {float:left; width:50%; font-size:15px; padding: 0 5%; margin:15px 0;}
.mymenu > div > div > a {position:relative;}
.mymenu > div > div > a > span:nth-child(1) {display:inline-block; width:200px;}
.mymenu > div > div > a > span:nth-child(2) {position:absolute; left:200px;}
.mymenu > div {height:120px;}

/* 바로가기 메뉴 - 메이커 모드 (새 프로젝트 생성) */
#maker-menu .newpj {position:relative; border:1px solid rgba(0,0,0,.06); border-radius:15px; height:250px; text-align:center; margin-bottom:35px;}
#maker-menu .newpj > a > img {margin:20px 0;}
#maker-menu .newpj > a > span {font-size:17px;}
</style>


<div class="container">
	<!-- 1. 서포터, 메이커 버튼 -->
	<div class="mypage-header">
		<div class="switch-btns-box">
			<button type="button" class="btnSupporter" id="supporter">서포터</button>
			<button type="button" class="btnMaker" id="maker">메이커</button>
		</div>
	</div>
	
	<!-- 2. 프로필 & 바로가기 메뉴 -->
	<div class="mypage-contents-wrap">
		<!-- 2-1. 프로필 -->
		<div class="profile-box">
			<!-- 2-1-1. 프로필 사진 -->
			<a href="/user/mypage/profile">
			<c:if test="${isExistsImg }">
				<img class="profile-img" src="/resources/img/${profileImg }" alt="프로필사진">
				<%-- 프로필 수정 구현 후 아래 코드로 바꿀 것 -->
				<%-- <img class="profile-img" src="/upload/${profileImg }" alt="프로필사진"> --%>
			</c:if>
			<c:if test="${not isExistsImg }">
				<img  class="profile-img" src="/resources/img/${profileImg }" alt="프로필사진">
			</c:if>
			</a>
			<!-- 2-1-2. 닉네임-->
			<div class="profile-nick">
				<button type="button" onclick="location.href='/user/mypage/detail'">
				<strong>
					<span>${mNick }</span><span style="font-weight:400">님</span>
					<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
						<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
					</svg>
				</strong>
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
							<span>나의 펀딩</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						</a>
					</div>
					<div class="fundingchart">
						<a href="/user/mypage/fundingchart">
							<span>펀딩 내역</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div style="margin-bottom:60px;">
					<h3>나의 활동</h3>
					<div class="favorite">
						<a href="/user/mypage/favorite">
							<span>좋아요</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						</a>
					</div>
					<div class="message">
						<a href="/user/mypage/sptmessage">
							<span>메시지</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						
						</a>
					</div>
					<div class="mywrite">
						<a href="/user/mypage/fundcomm">
							<span>내가 쓴 글</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div>
					<h3>나의 정보</h3>
					<div class="myprofile">
						<a href="/user/mypage/profile">
							<span>프로필</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						
						</a>
					</div>
					<div class="myinfo">
						<a href="/user/mypage/detail">
							<span>회원정보</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						</a>
					</div>
				</div>
			</div><!-- div#supporter-menu END -->
			

			<!-- 메이커 모드 -->
			<div class="mymenu" id="maker-menu">
				<div class="newpj">
					<a href="#">
						<img src="/resources/img/test1.png"><br>
						<span>새 프로젝트 개설하기</span>
					</a>
				</div>
				<div>
					<div class="myopenpj">
						<a href="/user/mypage/openpj">
							<span>오픈 프로젝트</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						</a>
					</div>
					<div class="myprepj">
						<a href="/user/mypage/prepj">
							<span>준비중인 프로젝트</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
							</span>
						</a>
					</div>
					<div class="message">
						<a href="/user/mypage/mkmessage">
							<span>메시지</span>
							<span>
								<svg viewBox="0 0 40 40" focusable="false" role="presentation" aria-hidden="true">
									<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
								</svg>
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
	<%-- home 초기값: 메이커 모드 -> 메이커 메뉴만 보이도록 설정 --%>
	$("#maker-menu").show()
	$("#supporter-menu").hide()
	
	<%-- '서포터' 버튼 클릭 시 서포터 메뉴만 보이도록 설정 --%>
	$("#supporter").click(function () {
		$("#maker-menu").hide()
		$("#supporter-menu").show()
	})
	
	<%-- '메이커' 버튼 클릭 시 메이커 메뉴만 보이도록 설정 --%>
	$("#maker").click(function () {
		$("#maker-menu").show()
		$("#supporter-menu").hide()
	})
})
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>