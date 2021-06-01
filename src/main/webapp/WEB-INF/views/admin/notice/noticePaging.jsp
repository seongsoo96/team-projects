<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty param.category }">
	<c:set var="category" value="category=${param.category }" />
</c:if>
<c:if test="${not empty param.search }">
	<c:set var="search" value="search=${param.search }" />
</c:if>


<div class="text-center">
	<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }" >
			<li><a href="/admin/notice/list&${category}&${search}">&larr;</a></li>
		</c:if>

		
		<%-- 이전 페이징 리스트로 가기 --%>
		<c:choose>
			<c:when test="${paging.startPage gt paging.pageCount }">
				<li><a href="/admin/notice/list?curPage=${paging.startPage - paging.pageCount }&${category}&${search}">&laquo;</a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a>&laquo;</a></li>
			</c:otherwise>
		</c:choose>
		
		
		<%-- 이전 페이지로 가기 --%>
		<%-- 첫 페이지면 금지 표시 --%>
		<c:if test="${paging.curPage!=1 }">
			<li><a href="/admin/notice/list?curPage=${paging.curPage }&${category}&${search}">&lt;</a></li>
		</c:if>
		
		
		<%-- 페이징 리스트 --%>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }" step="1">
			<c:choose>
				<c:when test="${i } = ${paging.curPage }">
					<li class="active"><a href="/admin/notice/list?curPage=${i }&${category}&${search}">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/admin/notice/list?curPage=${i }&${category}&${search}">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		

		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage!=paging.totalPage }">
			<li><a href="/admin/notice/list?curPage=${paging.curPage+1 }&${category}&${search}">&gt;</a></li>
		</c:if>
		

		<%-- 다음 페이징 리스트로 가기 --%>
		<c:choose>
			<c:when test="${paging.endPage } != ${paging.totalPage }">
				<li><a href="/admin/notice/list?curPage=${paging.startPage + paging.pageCount }&${category}&${search}">&raquo;</a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a>&raquo;</a></li>
			</c:otherwise>
		</c:choose>


		<%-- 마지막 페이지로 가기 --%>
		<c:if test="${paging.curPage!=paging.totalPage }">
			<li><a href="/admin/notice/list?curPage=${paging.totalPage }&${category}&${search}">&rarr;</a></li>
		</c:if>
		
	</ul>
</div>