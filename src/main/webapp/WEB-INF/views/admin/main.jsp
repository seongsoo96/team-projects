<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
html, body { height: 100%; }
body {
  font-family: "Noto Sans KR", sans-serif !important;
  margin: 0;
  overflow-x: hidden;
  display: flex;
  flex-direction: column;
}

.left{
	float:left;
}
.right{
	float:right;
}
.center{
	text-align:center;
}

#hamburger { display: none; }
#hamburger ~*{
	transition: transform 0.4s;
}
#hamburger:checked ~ * { transform: translate3d(200px, 0, 0); }
#hamburger ~ label {
  position: absolute;
  font-size: 54px;
  top: -16px; left: 8px;
  cursor: pointer;
  z-index: 1;
}
#hamburger ~ nav {
  position: absolute;
  background: black;
  width: 200px;
  left: -200px;
  height: 100%;
  
}
#hamburger ~ nav * {
  margin: 0; padding: 0;
  color: white;
}
#hamburger ~ nav div {
  background: teal;
  padding: 1em;
}
#hamburger ~ nav a {
  display: block;
  text-decoration: none;
  padding: 1em;
}
#hamburger ~ nav a:hover { background: gray; }

#content {
  position: relative;
  padding: 2.6em 1em 1em;
  width: 100%;
}

header{
	/* header태그의 전체적인 설정 */
 	background: #FFFFFF;
 	width: 980px;
 	padding-left: 60px;
 	/* border: 1px solid #ccc; */
 	
}
.hdropdown{
	/* ul태그의 기본 리스트스타일 없애기 */
	/* 기본 리스트스타일: disc */
	list-style-type: none;
	/* 기본 여백 제거 */
	padding: 0px;
	margin: 0px;
}


.hdropdown > li{
	/* 수평으로 일렬 배치하기 */
	float: left;
	background: #FFFFFF;
	/* 크기 (배경색 포함) 변경하기 */
	/* padding: 20px 5px; */
	/* 줄 간격을 이용한 높이 조절 */
	line-height: 40px;
	/* 테두리를 이용한 메뉴 항목 구분선 만들기 */
	/* border-right: 1px solid #FFFFFF; */
	/* 서브메뉴(absolute)의 위치 기준점 설정 */
	margin-left: 20px;
	position: relative;
	text-align: left;
}

.hdropdown > li > a{
	color: #1E2227;
	/* 글자 꾸밈선 없애기(underline) */
	text-decoration: none;
	/* 글자 스타일 지정 */
	font-size: 20px;
	margin: 0 5px;
}

.hdropdown > li > ul{
	/* HTM 계층구조에서 빼내는 설정  */
	/* 부모요소인 <li>태그의 컨텐츠 영역에서 벗어나게 된다 */
	position: absolute;
	/* ul태그 기본 리스파일 (disc) 제거 */
	list-style-type: none;
	/* ul태그 기본 여백 제거 */
	padding: 0;
	margin: 0;
	
	/* 서브메뉴의 위치 설정 */
	left: 5px;
	/* 서브메뉴영역의 너비 */
	width: 180px;
}
.hdropdown > li:hover > a{
	color: #4EE2EC;
	
}
.hdropdown > li:hover > ul > li{
	height: 40px;
	font-size: 20px;
	line-height:40px;
	transition: all 0.5s ease-out;
}



.hdropdown > li > ul > li{
	/* 배경색 지정 */
	background: #143642;
	/* 항목의 크기 키우기 */
	/* padding: 2px 5px;  */
	/* 텍스트 들여쓰기 */
	padding-left: 10px; 
	
	/* 평소에 화면에서 안보이도록 설정하기 */
	height: 0;
	font-size: 0;
	line-height:0;
	
}
.hdropdown > li > ul > li > a{
	/* 배경색 지정 */
	background: #FFFFFF;
	
	/* 글자색 지정 */
	color: #143642;
	/* 꾸밈선 제거(underline) */
	text-decoration: none;
	/* 부모요소<li>항목을 자식요소 <a>로 가득 채우기 */
	display: block; 
	/* 변화 시작, 종료 둘 다 적용 */
	/* transition: background 2s, color 1s; */
	
}

.hdropdown > li > ul > li > a:hover{
	/* 글자색 변경 */
	color: #4EE2EC;
	/* 배경색 변경 */
	background: #FFFFFF;


}
#navigation{
	display:relative;
	width: 100%;
	height: 100px;
	float: left;
}
#navigation > div{
	display:inline-block;
	width: 600px;
	
}
input[id="keyword"]{
	width: 500px;
	margin: 10px;
}
#content {
  position: flax;
  width: 980px;
  background: #FFFFFF;
  margin-left: 200px;
  margin-top: 30px;
}

footer{
	/* footer의 전체적인 설정 */
	/*border: 1px solid #ccc;*/
 	background: #FFFFFF;
 	width: 100%;
 	margin-left: 200px;
 	margin-top: 30px;
 	
}
</style>
</head>
<body>
<header>
	<!-- 로고 -->
	<div id="navigation">
	<input id="hamburger" type="checkbox" /><label for="hamburger">&equiv;</label>
	  <nav>
	    <div>Core</div>
	    <ul>
	      <li><a href="#">Dashboard</a></li>
	    </ul>
	    <div>List</div>
	    <ul>
	      <li><a href="#">사용자 관리</a></li>
	      <li><a href="#">공지사항 관리</a></li>
	      <li><a href="#">게시판 관리</a></li>
	      <li><a href="#">프로젝트 관리</a></li>
	      <li><a href="#">신고 관리</a></li>
	    </ul>
	</nav>
	<div style="width:200px;">
	<a href = "/admin/main"><img src="/resources/img/test1.png" width="100" height="40" alt="PpeonFun"  title="PpeonFun"> </a>
	</div>
	<!--메인 검색창  -->
	<div>
	<form action="/search" method="get" id ="form" >
		<input type="text" id="keyword" name="keyword" placeholder="어떤 프로젝트를 찾고 계신가요"/>
		<button><i class="fas fa-search"></i></button>
	</form>
	</div>
	
	<!-- 로그인 -->
	<c:choose>
		<c:when test="${empty mNo }">
			<ul class="hdropdown right">
				<li>
					<a href="#" style="color:black;" class="fa fa-user fa-3x"></a>
					<ul>
						<li><a href="/user/member/loginForm">로그인</a></li>
						<li><a href="#">프로젝트 펀딩하기</a></li>
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
						<li><a href="#">프로젝트 펀딩하기</a></li>
					</ul>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
	</div>
</header>
<div id="content">
<h1>CSS 슬라이드</h1>
    <p>우리나라의 말이 중국과 달라 문자가 서로 통하지 않는데 이런 이유로 어리석은 백성이 말하고자 하는 바가 있어도 마침내 제 뜻을 능히 펴지 못하는 사람이 많다. 내가 이를 불쌍히 여겨 새로 스물여덟 자를 만드니 사람마다 하여금 쉽게 익혀 매일 쓰기에 편안하게 하고자 할 따름이다.</p>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>