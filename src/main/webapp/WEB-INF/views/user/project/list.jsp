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
</style>
<div class="container">
<div class="category">
	<div class="box">
		<a href="#"><img class="img-circle" src="/resources/img/test2.png"></a>
		<p>전체보기</p>
	</div>
	<div class="box">
		<a href="#"><img class="img-circle" src="/resources/img/test1.png"></a>
		<p>테크/가전</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test3.png"></a>
		<p>반려동물</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test4.jpg"></a>
		<p>출판</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test5.png"></a>
		<p>기부/후원</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test2.png"></a>
		<p>푸드</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test1.png"></a>
		<p>운동</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test3.png"></a>
		<p>여행</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test4.jpg"></a>
		<p>뷰티</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test5.png"></a>
		<p>패션</p>
	</div>
	<div class="box" >
		<a href="#"><img class="img-circle" src="/resources/img/test1.png"></a>
		<p>디자인소품</p>
	</div>
</div>
<div class="row">
  <c:forEach items="${list }" var="info">
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <c:choose>
	      	<c:when test = "${fn:contains(info.iStoredName, 'test')}">
	      		<a href="/user/story/view?pNo=${info.pNo }"><img src="/resources/img/${info.iStoredName }" ></a>
	      	</c:when>
	      	<c:otherwise>
	      		<a href="/user/story/view?pNo=${info.pNo }"><img src="/upload/${info.iStoredName }"></a>
	      	</c:otherwise>
	      </c:choose>
	      <div class="caption">
	        <h3>${info.iTitle }</h3>
	        <p>${info.iCategory }</p>
	        <p><a href="/user/story/view?pNo=${info.pNo }" class="btn btn-primary" role="button">보기</a> 
	      </div>
	    </div>
	  </div>
  </c:forEach>
</div>

</div>
<c:import url="/WEB-INF/views/layout/paging.jsp"/>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
