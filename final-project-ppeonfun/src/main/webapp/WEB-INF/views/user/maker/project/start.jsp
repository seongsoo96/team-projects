<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#projectWrite").click(function(){
		var result = confirm('프로젝트를 생성 하시겠습니까?');
		if(result){
			$(location).attr("href", "/user/maker/project/write");
		}
	})	
})

</script>
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
	/* margin-top: 30px;
	margin-bottom: 30px;  */
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
#projectWrite{
	margin-left:45px; 
	color:#4EE2EC;
	cursor: pointer;
}
</style>
<div class="container">
	<h2>나의 프로젝트</h2>
	<div class="divFundMenu">
		<span><a href="/user/maker/project/start">오픈 프로젝트</a></span>
		<span><a href="/user/maker/project/open">오픈 예정 프로젝트</a></span>
		
		<form action="/user/maker/project/list" method="get" style="display:inline-block;">
  		<div id="search" style="margin-left: 400px;">
		<select class="dropbox" name="category">
			<option value="${category }" selected>제목</option>
		</select>
		<input type="text" id="search" class="search" name="search" placeholder="검색어를 입력해주세요"  />
		<button class="searchBtn">검색</button>
		<a id="projectWrite"><i class="fas fa-plus fa-4x"></i></a>
  		</div>
		</form>
	</div><!-- div.divFundMenu -->
	<hr>
<c:import url="/WEB-INF/views/layout/myCategoryBtn.jsp"/>
<%-- < div class="category">
	<div class="box">
		<a href="/user/maker/project/list"><img class="img-circle" src="/resources/img/subLogo.png"></a>
		<p>전체보기</p>
	</div>
	<div class="box">
		<a href="/user/maker/project/list?category=테크/가전"><img class="img-circle" src="/resources/img/tech.svg"></a>
		<p>테크/가전</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=반려동물"><img class="img-circle" src="/resources/img/paw.svg"></a>
		<p>반려동물</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=출판"><img class="img-circle" src="/resources/img/book.svg"></a>
		<p>출판</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=기부/후원"><img class="img-circle" src="/resources/img/hand-heart.svg"></a>
		<p>기부/후원</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=푸드"><img class="img-circle" src="/resources/img/utensils.svg"></a>
		<p>푸드</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=운동"><img class="img-circle" src="/resources/img/dumbbell.svg"></a>
		<p>운동</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=여행"><img class="img-circle" src="/resources/img/car-side.svg"></a>
		<p>여행</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=뷰티"><img class="img-circle" src="/resources/img/beauty.png"></a>
		<p>뷰티</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=패션"><img class="img-circle" src="/resources/img/tshirt.svg"></a>
		<p>패션</p>
	</div>
	<div class="box" >
		<a href="/user/maker/project/list?category=디자인소품"><img class="img-circle" src="/resources/img/pencil-ruler.svg"></a>
		<p>디자인소품</p>
	</div>
</div> --%>
<div class="row">
  <c:choose>
  <c:when test="${empty list }"> 
 	 <div class="text-center" style="height:210px; margin-top:100px;">
		<h3>오픈한 프로젝트가 없습니다.</h3>
	</div>
  </c:when>
  <c:otherwise>
  <c:forEach items="${list }" var="info">
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <c:choose>
	      	<c:when test = "${fn:length(info.iStoredName)<20}">
	      		<img src="/resources/img/${info.iStoredName }" style="width:100%; height:250px;">
	      	</c:when>
	      	<c:otherwise>
	      		<img src="/upload/information/${info.iStoredName }" style="width:100%; height:250px;">
	      	</c:otherwise>
	      </c:choose>
	      <div class="caption">
	      	<c:choose>
	      		<c:when test="${ empty info.iTitle }"><h3>제목없음</h3></c:when>
	      		<c:otherwise><h3>${info.iTitle }</h3></c:otherwise>
	      	</c:choose>
	      	<c:choose>
	      		<c:when test="${ empty info.iCategory }"><p>카테고리 없음</p></c:when>
	      		<c:otherwise><p>${info.iCategory }</p></c:otherwise>
	      	</c:choose>
	        <p><a href="/user/maker/project/view?pNo=${info.pNo }" class="btn" style="background: #4EE2EC; color: #FFFFFF" role="button">작성하기</a> 
	      </div>
	    </div>
	  </div>
  </c:forEach>
  </c:otherwise>
  </c:choose>
</div>

</div><!-- div.container  -->
<c:if test="${paging.totalPage > 1 }">
	<c:import url="/WEB-INF/views/admin/project/paging.jsp"/>
</c:if>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
