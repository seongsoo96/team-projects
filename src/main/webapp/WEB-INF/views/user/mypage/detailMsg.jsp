<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.divChatRoomName {text-align:center; margin-top:10px; padding-bottom:10px; font-size:16px; border-bottom:1px solid black;}

.divDOtherNick {font-size:15px; margin:10px 0 0 4%;}
.divDMyNick {font-size:15px; margin:10px 4% 0 0; text-align:right;}

.divDOtherMsg {border:2px solid #ccc; width:43%; margin-left:4%; float:left; padding:5px 10px;}
.divDMyMsg {border:2px solid #4EE2EC; width:43%; margin-right:4%; float:right; padding:5px 10px;}
.divFloat::after {content:""; display:block; clear:both;}

.divOtherTime {font-size:12px; margin-left:40%;}
.divMyTime {font-size:12px; text-align:right; margin-right:40%;}
</style>
<div class="divChatRoomName">${detailMsg[0].CR_NAME }</div>
<c:forEach var="detail" items="${detailMsg }">
	<%-- 내가 보낸 메시지 --%>
	<c:if test="${detail.M_NO eq mNo }">
		<div class="divDMyNick">${detail.M_NICK }</div>
		<div class="divFloat"><div class="divDMyMsg">${detail.MSG_CONTENT }</div></div>
		<div class="divMyTime"><fmt:formatDate value="${detail.MSG_TIME }" pattern="HH:mm"/></div>
	</c:if>
	
	<%-- 상대방이 보낸 메시지 --%>
	<c:if test="${detail.M_NO ne mNo }">
		<div class="divDOtherNick">${detail.M_NICK }</div>
		<div class="divFloat"><div class="divDOtherMsg">${detail.MSG_CONTENT }</div></div>
		<div class="divOtherTime"><fmt:formatDate value="${detail.MSG_TIME }" pattern="HH:mm"/></div>
	</c:if>
</c:forEach>

