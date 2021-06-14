<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach items="${list }" var="info">
		<div>
			<c:choose>
				<c:when test = "${fn:contains(info.iStoredName, 'test') or fn:contains(info.iStoredName, 'search')}">
					<a href="/story?pNo=${info.pNo }"><img src="/resources/img/subLogo.png" width="200" height="150"/></a>
				</c:when>
				<c:otherwise>
					<a href="/story?pNo=${info.pNo }"><img src="/upload/${info.iStoredName }" width="200" height="150"/></a>
				</c:otherwise>
			</c:choose>
			<p>${info.iTitle }</p>
		</div>
	</c:forEach>
	
	<div id="pagination-wrap2">
			<ul>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
			<c:if test="${paging.curPage eq page }">
				<a onclick="pagingSelect(${page})"><li class="active"></li></a>
			</c:if>
			<c:if test="${paging.curPage ne page }">
				<a onclick="pagingSelect(${page})"><li></li></a>
			</c:if>
			</c:forEach>
            </ul>
    </div>