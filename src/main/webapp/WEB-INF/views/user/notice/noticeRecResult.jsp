<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${chkrec }">
	<span>&nbsp;&#x2764;</span>&nbsp;추천&nbsp;${rec }
</c:if>
<c:if test="${not chkrec }">
	<span style="color: red;">&nbsp;&#x2764;</span>&nbsp;추천&nbsp;${rec }
</c:if>