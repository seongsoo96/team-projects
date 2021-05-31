<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<section>
	<!-- 서포터, 메이커 버튼 -->
	<div class="switch-mode-btns">
		<button type="button" id="supporter">서포터</button>
		<button type="button" id="maker" >메이커</button>
	</div>
	
	<!-- 프로필 -->
	<div class="myprofile">
		<div>
			<a href="/user/mypage/profile">
			<c:if test="${isExistsImg }">
				<img alt="프로필사진" src="/upload/${profileImg }">
			</c:if>
			<c:if test="${not isExistsImg }">
				<img alt="프로필사진" src="/resources/img/${profileImg }">
			</c:if>
			</a>
		</div>
		<div><a href="/user/mypage/detail">${mNick }님 ></a></div>
		<div><a href="/user/member/logout">로그아웃</a></div>
	</div>
	
	<!-- 바로가기 (서포터 모드 / 메이커 모드) -->
	<div class="mode-menu">
		<!-- 서포터 모드 -->
		<div id="supporter-menu">
			<div>나의 프로젝트</div>
			<div>
				<a href="/user/mypage/myfunding"><span>나의 펀딩</span></a>
				<a href="/user/mypage/fundingchart"><span>펀딩내역</span></a>
			</div>
			<div>나의 활동</div>
			<div>
				<a href="/user/mypage/favorite"><span>좋아요</span></a>
				<a href="/user/mypage/sptmessage"><span>메시지</span></a>
				<a href="/user/mypage/fundcomm"><span>내가 쓴 글</span></a>
			</div>
			<div>나의 정보</div>
			<div>
				<a href="/user/mypage/profile"><span>프로필</span></a>
				<a href="/user/mypage/detail"><span>회원정보</span></a>
			</div>
		</div>
		
		<!-- 메이커 모드 -->
		<div id="maker-menu">
			<div><a href="#">새 프로젝트 개설하기</a></div>
			<div>
				<a href="/user/mypage/openpj"><span>오픈 프로젝트</span></a>
				<a href="/user/mypage/prepj"><span>준비중인 프로젝트</span></a>
				<a href="/user/mypage/mkmessage"><span>메시지</span></a>
			</div>
		</div>
	</div>
</section>
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