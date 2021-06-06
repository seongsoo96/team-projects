<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PpeonFun</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
<link rel="stylesheet" href="/resources/css/header.css">

<script type="text/javascript">

// <ul class="keyword_ul">
// <li class="keyword_li">
// <button class="content_title">
// 		<span>도구</span>
// </button>
// <button type="button" class="deleteBtn">
// 		<i class="icon close">x</i>
// </button>




var i = 0;
console.log("전역변수 i = "+i)


$(document).ready(function() {
	
	//검색 버튼 클릭
	$("#btnSearch").click(function(){
		searchEnter()
	})
	
	//검색창 클릭
	$('#keyword').click(function(){
		if($(this).next().next().hasClass('searchInput_suggest')){
			$(".searchInput_suggest").attr('class','searchInput_suggest_open')
		} else {
			$(".searchInput_suggest_open").attr('class','searchInput_suggest')
		}
	})
})



//엔터 누르면 검색
function searchEnter(){
	var keyword = $("#keyword").val()
	
	if(keyword === ""){
		alert("검색어를 입력하세요")
	} else {
		
		
		console.log("searchEnter() ++전 i --- : " + i)
		i = i + 1
		console.log("searchEnter() ++후 i --- : " + i)
		
		console.log("keyword"+i)
		localStorage.setItem('keyword'+i, keyword)
		$(location).attr("href", "/search?keyword=" + keyword)
// 		location.href="/search?keyword="+keyword;
	}
}
console.log("----searchEnter()밖의 iiii---- : " + i)
</script>


</head>
<body>
<header>
	<!-- 로고 -->
	<div>
		<a href = "/"><img src="/resources/img/test1.png" width="100" height="40" alt="PpeonFun"  title="PpeonFun"> </a>
	</div>
	
	<ul class="hdropdown">
		<li><a href="/user/project/list">펀딩하기</a></li>
		<li><a href="#">오픈예정</a></li>
		<li>
			<a href="#">더보기</a>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">게시판</a></li>
			</ul>
		</li>
	</ul>
	
	<!--메인 검색창  -->
<!-- 	<div> -->
<!-- 		<form action="/search" method="get" id ="form" > -->
<!-- 			<input type="text" id="keyword" name="keyword" placeholder="어떤 프로젝트를 찾고 계신가요"/> -->
<!-- 			<button><i class="fas fa-search"></i></button> -->
<!-- 		</form> -->
<!-- 	</div> -->
	
	<!--메인 검색창  -->
	<div class="searchInput">
		<input type="text" id="keyword" onkeypress="if( event.keyCode == 13 ) searchEnter();"
			placeholder="어떤 프로젝트를 찾고 계신가요"/>
		<button id="btnSearch"><i class="fas fa-search"></i></button>
		<div class="searchInput_suggest">
			<div class="searchInput_module">
				<div class="searchInput_recent">
					<span>최근검색어</span>
				</div>
				<div class="hr"></div>
				<div class="searchInput_module_content">
					<div class="searchInput_module_contentBox">
						<ul class="keyword_ul">
							<li class="keyword_li">
								<button class="content_title">
									<span>도구</span>
								</button>
								<button type="button" class="deleteBtn">
									<i class="icon close">x</i>
								</button>
							</li>
							<li>
								<button class="content_title">
									<span>도구</span>
								</button>
								<button type="button" class="deleteBtn">
									<i class="icon close">x</i>
								</button>
							</li>
							<li>
								<button class="content_title">
									<span>도구</span>
								</button>
								<button type="button" class="deleteBtn">
									<i class="icon close">x</i>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 로그인 -->
	<c:choose>
		<c:when test="${!empty accessToken }">
		<ul class="hdropdown right">
				<li>
					<a href="#" style="color:black;" class="fa fa-user fa-3x"></a>
					<ul>
						<li><a href="/user/member/kakao/logout">카카오 로그아웃</a></li>
						<li><a href="/user/mypage/home">마이페이지</a></li>
						<li><a href="/user/project/list">프로젝트 펀딩하기</a></li>
					</ul>
				</li>
			</ul>
		</c:when>
		<c:when test="${empty mNo }">
			<ul class="hdropdown right">
				<li>
					<a href="#" style="color:black;" class="fa fa-user fa-3x"></a>
					<ul>
						<li><a href="/user/member/loginForm">로그인</a></li>
						<li><a href="/user/member/joinSelect">회원가입</a></li>
						<li><a href="/user/project/list">프로젝트 펀딩하기</a></li>
					</ul>
				</li>
			</ul>	
		</c:when>
		<c:otherwise>
			<ul class="hdropdown right">
				<li>
					<a href="#" class="fa fa-user fa-3x"></a>
					<ul>
						<li><a href="/user/member/logout">로그아웃</a></li>
						<li><a href="/user/mypage/home">마이페이지</a></li>
						<li><a href="/user/project/list">프로젝트 펀딩하기</a></li>
					</ul>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
</header>