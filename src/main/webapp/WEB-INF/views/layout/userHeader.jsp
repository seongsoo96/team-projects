<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="/resources/css/userHeader.css" type="text/css">

<!-- bootstrap icon 적용 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 마이페이지 목록형 페이지 css -->
<link rel="stylesheet" href="/resources/css/mypageCateList.css" type="text/css">
<script type="text/javascript">

$(document).ready(function() {
	
	//검색 버튼 클릭
	$("#btnSearch").click(function(){
		console.log("돋보기 클릭")
		searchEnter()
	})
	
	//검색창 클릭
	$('#keyword').click(function(){
		console.log("검색창 클릭")
		if($(this).next().hasClass('searchInput_suggest')){
			$(".searchInput_suggest").attr('class','searchInput_suggest_open')
			
			keywordList();
			
		} else {
			$(".searchInput_suggest_open").attr('class','searchInput_suggest')
		}
	})
})

function keywordList(){
	if(getLocalStorage() != null){
		
		var app = '';
		for(var i=0; i<getLocalStorage().length; i++) {
			app += '<li class="keyword_li">'
					+ '<button id="content_title'+i+'" class="content_title">'
						+ '<span>'+ getLocalStorage()[i] +'</span>'
					+ '</button>'
					+ '<button type="button" id="deleteBtn'+i+'" class="deleteBtn">'
						+ '<i class="icon close">x</i>'
					+ '</button>'
				+ '</li>'
		}
		$(".keyword_ul").html(app)
		
		$("button[id^='content_title']").click(function(){
			
			var keyword = $(this).text()
			
			console.log(keyword)
			
			$(location).attr("href", "/search?keyword=" + keyword)
		})
		
		$("button[id^='deleteBtn']").click(function(){
			var keyword = $(this).prev().text()
			var kk = $(this).parent().children().first().text()
			
			console.log("this :" + $(this).parent().children().first().text())
			console.log( getLocalStorage().indexOf(kk) )
			
			var idx = getLocalStorage().indexOf(kk)
			
			deleteKeyword(idx)		
			
			$(this).parent().remove();
		})
		
	}
}


//로컬스토리지 생성하기
function setLocalStorage(value) {
	
	//로컬스토리지 키값 설정
	let key = 'keywords'
	
	//기존 로컬스토리지가 있을 때
	if(localStorage.getItem(key) != null){
		
		let resArr = getLocalStorage()
		
		
		if( resArr.includes(value) ){
			
			let idx = resArr.indexOf(value)
			resArr.splice(idx, 1)
			resArr.unshift(value)
			
			localStorage.setItem(key, JSON.stringify(resArr))
		} else {
			resArr.unshift(value)
			localStorage.setItem(key, JSON.stringify(resArr))
		}
		
	} else { //기존 로컬스토리지가 없을 때
		let resArr = []
		
		resArr.push(value)
		
		localStorage.setItem(key, JSON.stringify(resArr))
	}
	
}

//로컬스토리지 불러오기
function getLocalStorage(){
	
	var getLocal = localStorage.getItem('keywords')
	
	var getResArr = JSON.parse(getLocal)
	
	return getResArr
}

//로컬스토리지에서 특정값 삭제
function deleteKeyword(idx){
	let getArr = getLocalStorage()
	getArr.splice(idx, 1)
	
	localStorage.setItem('keywords', JSON.stringify(getArr))
}



//엔터 누르면 검색
function searchEnter(){
	var keyword = $("#keyword").val()
	
	if(keyword === ""){
		alert("검색어를 입력하세요")
	} else {
		
		setLocalStorage(keyword)		
		
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
		<li><a href="/user/open/list">오픈예정</a></li>
		<li>
			<a href="#">더보기</a>
			<ul>
				<li><a href="/user/notice/list">공지사항</a></li>
				<li><a href="/user/board/list">게시판</a></li>
			</ul>
		</li>
	</ul>
	
	
	<!--메인 검색창  -->
	<div class="searchInput" style="margin-left:25px;">
		<input type="text" id="keyword" onkeypress="if( event.keyCode == 13 ) searchEnter();"
			placeholder="어떤 프로젝트를 찾고 계신가요"/>
		<button id="btnSearch"><i class="fas fa-search"></i></button>
		<input class="sinput" type="text" id="keyword" onkeypress="if( event.keyCode == 13 ) searchEnter();"
			placeholder="어떤 프로젝트를 찾고 계신가요"/>
		<div class="searchInput_suggest">
			<div class="searchInput_module">
				<div class="searchInput_recent">
					<span>최근검색어</span>
				</div>
				<div class="hr"></div>
				<div class="searchInput_module_content">
					<div class="searchInput_module_contentBox">
						<ul class="keyword_ul">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 로그인 -->
	<div class="divHeaderLoginMenu"
		<c:if test="${empty mNo }">style="margin:5px 0 0 80px;"</c:if>
	>
	<c:choose>
		<c:when test="${!empty accessToken }">
			<a href="/user/member/kakao/logout" style="font-size:16px;">카카오 로그아웃</a>
			<a href="/user/mypage/home">
			<c:choose>
				<c:when test="${fn:contains(myStoredName, 'test') or ('member.png' eq myStoredName) }">
					<img src="/resources/img/member.png">
				</c:when>
				<c:otherwise>
					<img src="/upload/profile/${myStoredName }">
				</c:otherwise>
			</c:choose>
			</a>
		</c:when>
		<c:when test="${empty mNo }">
			<a href="/user/member/loginForm">로그인</a>
			<a href="/user/member/joinSelect">회원가입</a>
		</c:when>
		<c:otherwise>
			<a href="/user/member/logout" style="margin-left:30px; font-size:16px;">로그아웃</a>
			<a href="/user/mypage/home">
			<c:choose>
				<c:when test="${fn:contains(myStoredName, 'test') or ('member.png' eq myStoredName) }">
					<img src="/resources/img/member.png">
				</c:when>
				<c:otherwise>
					<img src="/upload/profile/${myStoredName }">
				</c:otherwise>
			</c:choose>
			</a>
		</c:otherwise>
	</c:choose>
	</div>
	<div class="celarfix"></div>
</header>