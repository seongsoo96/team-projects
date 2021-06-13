<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">
/* 상단 메뉴 */
.fa-house-user {font-size:30px; position:relative; left:750px;}

/* 대화 목록 */
.divChatList {border:2px solid #CCC; margin:20px 0; width:50%; height:105px;}
.divChatList img {border:2px solid purple; width:100px; height:100px;}
.divChatList .divOtherNick {position:relative; top:-100px; left:120px; font-size:16px;}
.divChatList .divMsgContent {position:relative; top:-80px; left:120px; font-size:14px;}
</style>

<div class="container">
	<h2 style="display:inline-block">메시지</h2>
	<span><a href="/user/mypage/home"><i class="fas fa-house-user"></i></a></span>
	<hr>
	
	<!-- 메시지 없는 경우 -->
	<c:if test="${empty chatList }">
		<div class="text-center" style="height:210px; margin-top:100px;">
			<h3>메시지 내역이 없습니다.</h3>
		</div>	
	</c:if>
	
	<!-- 메시지 있는 경우 -->
	<c:if test="${not empty chatList }">
		<c:forEach var="clist" items="${chatList }" varStatus="cStatus">
		<div class="divChatList">
			<img src="/upload/profile/${clist.MY_STORED_NAME }">
		 	<div class="divOtherNick">상대방 이름: ${clist.M_NICK }</div>
		 	<div class="divMsgContent">
		 		최근 메시지: ${msgContentList[cStatus.index] }
			 </div>
		</div>
		</c:forEach>
		<c:import url="/WEB-INF/views/layout/paging.jsp"/>
	</c:if>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>