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
$(document).ready(function() {
	
	//검색 버튼 클릭
	$("#btnSearch").click(function(){
		searchEnter()
	})
})

//쿠키 생성하기
function setCookie(cookie_name, value, days) {
  var exdate = new Date();
  exdate.setDate(exdate.getDate() + days);
  // 설정 일수만큼 현재시간에 만료값으로 지정

  var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
  document.cookie = cookie_name + '=' + cookie_value;
}

//쿠키 가져오기
function getCookie(cookie_name) {
  var x, y;
  var val = document.cookie.split(';');

  for (var i = 0; i < val.length; i++) {
    x = val[i].substr(0, val[i].indexOf('='));
    y = val[i].substr(val[i].indexOf('=') + 1);
    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
    if (x == cookie_name) {
      return unescape(y); // unescape로 디코딩 후 값 리턴
    }
  }
}

//쿠키 추가하기
function addCookie(id) {
  var items = getCookie('keyword'); // 이미 저장된 값을 쿠키에서 가져오기
  var maxItemNum = 10; // 최대 저장 가능한 아이템개수
  var expire = 7; // 쿠키값을 저장할 기간
  if (items) {
    var itemArray = items.split(',');
    if (itemArray.indexOf(id) != -1) {
      // 이미 존재하는 경우 종료
      console.log('Already exists.');
    }
    else {
      // 새로운 값 저장 및 최대 개수 유지하기
      itemArray.unshift(id);
      if (itemArray.length > maxItemNum ) itemArray.length = 5;
      items = itemArray.join(',');
      setCookie('keyword', items, expire);
    }
  }
  else {
    // 신규 id값 저장하기
    setCookie(keyword, 'keyword', expire);
  }
}


//엔터 누르면 검색
function searchEnter(){
	var keyword = $("#keyword").val()
	console.log("keyword" + keyword)
	
	
	if(keyword === ""){
		alert("검색어를 입력하세요")
	} else {
		addCookie('keyword')
		
		console.log("검색어 쿠키 : " + getCookie('keyword'))
		
		$(location).attr("href", "/search?keyword=" + keyword)
	}
}
</script>


</head>
<body>
<header>
	<!-- 로고 -->
	<div>
		<a href = "/"><img src="/resources/img/logo.png" style="border-radius: 50%;" width="50" height="50" alt="PpeonFun"  title="PpeonFun"> </a>
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
	<div>
		<input type="text" id="keyword" onkeypress="if( event.keyCode == 13 ){searchEnter();}"
			placeholder="어떤 프로젝트를 찾고 계신가요"/>
		<button id="btnSearch"><i class="fas fa-search"></i></button>
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