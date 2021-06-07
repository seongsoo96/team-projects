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
	 }
 }

</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

/* 게시글 제목 */
td:nth-child(2) {
	text-align: left;
}	
#searchForm{
   text-align : center; 
}

</style>

<div class="container">


<h1>게시판</h1>
<hr> 


<table class="table table-striped table-hover">
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

<%-- 페이징 JSP --%> 
<jsp:include page="/WEB-INF/views/layout/paging.jsp" />

<div id="searchForm">
   <form>
   <div>
     <select name="category">
       <option value="title">제목</option>
       <option value="content">내용</option>
       <option value="totalplus">제목+내용</option>
     </select>
     <input type="text" size="20" name="search" />&nbsp;
     <input type="submit" id="search" value="검색"/>
   </div>
    </form>
</div>

</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
