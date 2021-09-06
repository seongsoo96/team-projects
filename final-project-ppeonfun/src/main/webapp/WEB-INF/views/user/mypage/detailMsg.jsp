<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.divChatRoomName {text-align:center; background-color:black; color:white; font-size:16px; height:45px; padding-top:10px;}

.divDOtherNick {font-size:15px; margin:10px 0 0 4%;}
.divDMyNick {font-size:15px; margin:10px 4% 0 0; text-align:right;}

.divDOtherMsg {background-color:#e6e6e6; border-radius:3px; width:43%; margin-left:4%; float:left; padding:5px 10px;}
.divDMyMsg {background-color:#C4FFFF; border-radius:3px; width:43%; margin-right:4%; float:right; padding:5px 10px;}
.divFloat::after {content:""; display:block; clear:both;}

.divOtherTime {font-size:12px; margin-left:40%; margin-bottom:5px;}
.divMyTime {font-size:12px; text-align:right; margin-right:40%; margin-bottom:5px;}

</style>
<div class="divChatRoomName">${detailMsg[0].CR_NAME }</div>
	<input type="hidden" id="crNo" value="${detailMsg[0].CR_NO }"/>
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