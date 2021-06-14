<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty param.category }">
	<c:set var="category" value="category=${param.category }" />
</c:if>
<c:if test="${not empty param.search }">
	<c:set var="search" value="search=${param.search }" />
</c:if>
<c:if test="${not empty param.orderby }">
	<c:set var="orderby" value="orderby=${param.orderby }" />
</c:if>


<div class="text-center">
	<ul class="pagination">

		<%-- 이전 페이징 리스트로 가기 --%>
		<c:choose>
			<c:when test="${paging.startPage gt paging.pageCount }">
				<li><a href="/user/notice/list?curPage=${paging.startPage - paging.pageCount }&${category}&${search}&${orderby}"
				style="border: none; color: black; margin: 0px 5px;">&lt;이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		
		
		<%-- 페이징 리스트 --%>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }" step="1">
			<c:choose>
				<c:when test="${i eq paging.curPage }">
					<li><a href="/user/notice/list?curPage=${i }&${category}&${search}&${orderby}"
					style="color: #4EEDED; margin: 0px 5px;">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/user/notice/list?curPage=${i }&${category}&${search}&${orderby}"
					style="border: none; color: black; margin: 0px 5px;">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		

		<%-- 다음 페이징 리스트로 가기 --%>
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
				<li><a href="/user/notice/list?curPage=${paging.startPage + paging.pageCount }&${category}&${search}&${orderby}"
				style="border: none; color: black; margin: 0px 5px;">다음 &gt;</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		
	</ul>
</div>