<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="cmt" items="${cmtList }">
	<div class="comment">
		<label class="comment_nick">${cmt.M_NICK }</label><br>
		<label class="comment_content">${cmt.C_CONTENT }</label><br>
		<label class="comment_date"><fmt:formatDate value="${cmt.C_CREATE_DATE }" pattern="yyyy.MM.dd. HH:mm" /></label>
	</div>
</c:forEach>