<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	 $("#search").click(function(){
		  $("form").submit()
	 })
 })

</script>

<style type="text/css">

/* 테이블 디자인 */
.botable {
	margin-bottom: 20px;
	max-width: 100%;
	width: 100%;
}

tr {
	border-radius: 10px;
	height: 35px;
}

th, td {
	border-bottom: 1px solid #f6f6f6;
	text-align: center;
}

th {
	background-color: #C4FFFF;
}

/* 게시글 제목 */
td:nth-child(2) {
	text-align: left;
}	

/* 검색 디자인 */
.searchcategory {
	border-color: snow;
	height: 30px;
	width: 200px;
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

#searchForm{
   text-align : center; 
}

.anbody1 {
	margin: 0 auto;
	text-align: left !important;
	width: 1070px;
}

</style>

<div class="container">


<h1>게시판</h1>
<hr> 

<div class="anbody1">
<table class="botable">
<thead>
	<tr>
		<th style="width: 10%">글번호</th>	
		<th style="width: 45%">제목</th>
		<th style="width: 20%">작성자</th>
		<th style="width: 10%">조회수</th>
		<th style="width: 15%">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.B_NO }</td>
		
		<td><a href="/user/board/view?bNo=${board.B_NO }">${board.B_TITLE}</a></td>
		<td>${board.M_NICK}</td>
		<td>${board.B_HIT}</td>
		<td><fmt:formatDate value="${board.B_CREATE_DATE }" pattern="yy-MM-dd HH:mm:ss" /></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span>
<span class="pull-right"><button><a href="/user/board/write">글쓰기</a></button></span>
<div class="clearfix"></div>

</div>

<%-- 페이징 JSP --%> 
<c:import url="/WEB-INF/views/layout/ppeonfunpaging.jsp"/>
<div id="searchForm">
   <form>
   <div id="searchcategory">
     <select name="category" class="dropbox">
       <option value="title">제목</option>
       <option value="content">내용</option>
       <option value="totalplus">제목+내용</option>
     </select>
     <input type="text" size="20" name="search" />&nbsp;
     <input type="submit" id="search" value="검색" class="searchBtn"/>
   </div>
    </form>
</div>

</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
