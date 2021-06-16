<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">
.box {
	display:inline-block;
	text-align:center;
}
.box > p{
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left:22px;
}
.img-circle{
	width: 60px;
    margin-left: 23px;
    height: 60px;
    border: 1px solid #4EE2EC;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.category{
	margin-bottom: 20px;
}
.search {
	border-color: snow;
	height: 30px;
	width: 200px;
	margin-top: 10px;
	margin-bottom: 30px; 
	
}

.searchBtn {
	
	background-color: #C4FFFF;
	border: none;
	height: 30.5px;
	margin-left: -4px;
	width: 50px;
}
.dropbox {
	
	border-color: ivory;
	height: 30px;
	margin: 0px 5px;
	width: 100px;
}
</style>
<div class="container">
<div class="category">
	<div class="box">
		<a href="/user/open/list"><img class="img-circle" src="/resources/img/subLogo.png"></a>
		<p>전체보기</p>
	</div>
	<div class="box">
		<a href="/user/open/list?category=테크/가전"><img class="img-circle" src="/resources/img/tech.svg"></a>
		<p>테크/가전</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=반려동물"><img class="img-circle" src="/resources/img/paw.svg"></a>
		<p>반려동물</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=출판"><img class="img-circle" src="/resources/img/book.svg"></a>
		<p>출판</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=기부/후원"><img class="img-circle" src="/resources/img/hand-heart.svg"></a>
		<p>기부/후원</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=푸드"><img class="img-circle" src="/resources/img/utensils.svg"></a>
		<p>푸드</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=운동"><img class="img-circle" src="/resources/img/dumbbell.svg"></a>
		<p>운동</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=여행"><img class="img-circle" src="/resources/img/car-side.svg"></a>
		<p>여행</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=뷰티"><img class="img-circle" src="/resources/img/beauty.png"></a>
		<p>뷰티</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=패션"><img class="img-circle" src="/resources/img/tshirt.svg"></a>
		<p>패션</p>
	</div>
	<div class="box" >
		<a href="/user/open/list?category=디자인소품"><img class="img-circle" src="/resources/img/pencil-ruler.svg"></a>
		<p>디자인소품</p>
	</div>
</div>
<div class="row">
<form action="/user/open/list" method="get">
  <div id="search">
	<select class="dropbox" name="category">
		<option value="${category }" selected>제목</option>
	</select>
	<input type="text" id="search" class="search" name="search" placeholder="검색어를 입력해주세요"  />
	<button class="searchBtn">검색</button>
  </div>
  </form>
  
  <c:forEach items="${list }" var="info">
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <c:choose>
	      	<c:when test = "${fn:contains(info.iStoredName, 'test') or fn:contains(info.iStoredName, 'search')}">
	      		<a href="#"><img src="/resources/img/subLogo.png" style="width:200px; height:150px;"></a>
	      	</c:when>
	      	<c:otherwise>
	      		<a href="#"><img src="/upload/information/${info.iStoredName }" style="width:200px; height:150px;"></a>
	      	</c:otherwise>
	      </c:choose>
	      <div class="caption">
	        <h3>${info.iTitle }</h3>
	        <p>${info.iCategory }</p>
	        <p><a href="/user/open/view?pNo=${info.pNo }" class="btn" style="background: #4EE2EC; color: #FFFFFF" role="button">둘러보기</a> 
	      </div>
	    </div>
	  </div>
  </c:forEach>
</div>

</div>
<c:import url="/WEB-INF/views/layout/paging.jsp"/>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
