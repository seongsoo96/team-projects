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
<c:import url="/WEB-INF/views/layout/myCategoryBtn.jsp"/>
<div class="row">
<form action="/user/project/list" method="get">
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
	      	<c:when test = "${fn:length(information.iStoredName)<20}">
	      		<a href="/story?pNo=${info.pNo }"><img src="/resources/img/${info.iStoredName }" style="width:200px; height:150px;"></a>
	      	</c:when>
	      	<c:otherwise>
	      		<a href="/story?pNo=${info.pNo }"><img src="/upload/information/${info.iStoredName }" style="width:200px; height:150px;"></a>
	      	</c:otherwise>
	      </c:choose>
	      <div class="caption">
	        <h3>${info.iTitle }</h3>
	        <p>${info.iCategory }</p>
	        <p><a href="/story?pNo=${info.pNo }" class="btn" style="background: #4EE2EC; color: #FFFFFF" role="button">펀딩하기</a> 
	      </div>
	    </div>
	  </div>
  </c:forEach>
</div>

</div>
<c:import url="/WEB-INF/views/layout/paging.jsp"/>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
