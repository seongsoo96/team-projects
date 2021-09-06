<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty paging.search }">
	<c:set var="searchParam" value="&search=${paging.search }" />
</c:if>

<c:if test="${not empty paging.category }">
	<c:set var="categoryParam" value="&category=${paging.category }" />
</c:if>

<div class="paging text-center">
	<ul class="pagination">

		<%-- 처음 페이지 버튼 --%>
		<%-- 첫 페이지가 아닐 때 버튼 노출 --%>
<%-- 		<c:if test="${paging.curPage ne 1 }"> --%>
<%-- 			<li><a href="?curPage=1${categoryParam} ${searchParam }"><span>&larr;</span></a></li> --%>
<%-- 		</c:if> --%>





		<%-- 이전 페이지 버튼 --%>
		<%-- 첫 페이지면 금지 표시 --%>
<%-- 		<c:if test="${paging.curPage ne 1 }"> --%>
<%-- 			<li><a href="?curPage=${paging.curPage-1 }${categoryParam}${searchParam }"> <span>&laquo;</span></a></li> --%>
<%-- 		</c:if> --%>
<%-- 		<c:if test="${paging.curPage eq 1 }"> --%>
<!-- 			<li class="disabled"><span>&laquo;</span></li> -->
<%-- 		</c:if> --%>


		<%-- 이전 페이징 리스트로 가기 --%>
		<c:choose>
			<c:when test="${paging.startPage gt paging.pageCount }">
				<li><%-- <li onclick="goPage(${paging.startPage - paging.pageCount },${category }, ${search }, ${orderby })"
					style="color: #4EEDED; margin: 0px 5px; cursor: pointer;">&lt;이전</li> --%>
				<a href="?curPage=${paging.startPage - paging.pageCount }&${category}&${search}"
				style="border: none; color: black; margin: 0px 5px;">&lt;이전</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>



		<%-- 페이징 번호 표시 --%>
		<%-- 현재 페이지 번호는 active 클래스 부여 -> 파랑 바탕 버튼 --%>
<%-- 		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page"> --%>
<%-- 			<c:if test="${paging.curPage eq page }"> --%>
<%-- 				<li class="active"><a href="?curPage=${page }${categoryParam}${searchParam }">${page }</a></li> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${paging.curPage ne page }"> --%>
<%-- 				<li><a href="?curPage=${page }${categoryParam}${searchParam }">${page }</a></li> --%>
<%-- 			</c:if> --%>
<%-- 		</c:forEach> --%>

		<%-- 페이징 리스트 --%>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }" step="1">
			<c:choose>
				<c:when test="${i eq paging.curPage }">
					<li><a href="?curPage=${i }&${category}&${search}&${orderby}"
					style="color: #4EEDED; margin: 0px 5px;">${i }</a></li>
					<%-- <li onclick="goPage(${i},${category }, ${search }, ${orderby })"
					style="color: #4EEDED; margin: 0px 5px; cursor: pointer;">${i }</li> --%>
				</c:when>
				<c:otherwise>
					<li><a href="?curPage=${i }&${category}&${search}&${orderby}"
					style="border: none; color: black; margin: 0px 5px;">${i }</a></li>
					<%-- <li onclick="goPage(${i},${category }, ${search }, ${orderby })"
					style="border: none; color: black; margin: 0px 5px; cursor: pointer;">${i }</li> --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>





		<%-- 다음 페이지 버튼 --%>
		<%-- 마지막 페이지면 동작 안함 --%>
<%-- 		<c:if test="${paging.curPage ne paging.totalPage }"> --%>
<%-- 			<li><a href="?curPage=${paging.curPage+1 }${categoryParam}${searchParam }"><span>&raquo;</span></a></li> --%>
<%-- 		</c:if> --%>
<%-- 		<c:if test="${paging.curPage eq paging.totalPage }"> --%>
<!-- 			<li class="disabled"><span>&raquo;</span></li> -->
<%-- 		</c:if> --%>
		
		
		<%-- 다음 페이징 리스트로 가기 --%>
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
				<li><a href="?curPage=${paging.startPage + paging.pageCount }&${category}&${search}"
				style="border: none; color: black; margin: 0px 5px;">다음 &gt;</a></li>
				<%-- <li onclick="goPage(${paging.startPage + paging.pageCount },${category }, ${search }, ${orderby })"
					style="color: #4EEDED; margin: 0px 5px; cursor: pointer;">다음&gt;</li> --%>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		
		
		
		<%-- 마지막 페이지 버튼 --%>
		<%-- 마지막 페이지가 아닐 때 버튼 노출 --%>
<%-- 		<c:if test="${paging.curPage ne paging.totalPage }"> --%>
<%-- 			<li><a href="?curPage=${paging.totalPage }${categoryParam}${searchParam }"><span>&rarr;</span></a></li> --%>
<%-- 		</c:if> --%>
	</ul>
</div>