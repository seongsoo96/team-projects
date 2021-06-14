<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">
/* 상단 메뉴 */
.fa-house-user {font-size:30px; position:relative; left:750px;}

/* 대화 상세 조회 */
.divDetailMsg {border:2px solid coral; float:right; width:48%; height:605px; overflow-x:hidden; overflow-y:scroll;}

/* 대화 목록 */
.divChatList {border:2px solid #CCC; margin:20px 0; width:50%; height:105px;}
.divChatList img {border:2px solid purple; width:100px; height:100px;}
.divChatList .divOtherNick {position:relative; top:-100px; left:120px; font-size:16px; font-weight:600; margin-top:10px;}
.divChatList .divMsgContent {position:relative; top:-80px; left:120px; font-size:14px;}
.pagingLoc {position:relative;}
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
		<!-- 메시지 상세보기 -->
		<div class="divDetailMsg">
		</div>
		
		<!-- 메시지 목록  -->
		<c:forEach var="clist" items="${chatList }" varStatus="cStatus">
			<div class="divChatList">
				<img src="/upload/profile/${clist.MY_STORED_NAME }">
			 	<div class="divOtherNick">${clist.M_NICK }</div>
			 	<div class="divMsgContent">
			 		<c:if test="${msgList[cStatus.index].M_NO eq mNo }">
			 		<span class="glyphicon glyphicon-circle-arrow-left" style="color:#4EE2EC;"></span>
			 		</c:if>
			 		<c:if test="${msgList[cStatus.index].M_NO ne mNo }">
			 		<span class="glyphicon glyphicon-circle-arrow-right" style="color:#ccc;"></span>
			 		</c:if>
					<button type="button" onclick="getDetailMsg(${msgList[cStatus.index].CR_NO})">
			 		${msgList[cStatus.index].MSG_CONTENT }
			 		</button>
			 	</div>
			</div>
		</c:forEach>
		<c:if test="${paging.endPage > 1 }">
			<c:import url="/WEB-INF/views/layout/paging.jsp"/>
		</c:if>
	</c:if>
</div>
<script type="text/javascript">
$(document).ready(function() {
	//메시지 상세 조회 hide
	$(".divDetailMsg").hide()
})
</script>
<script type="text/javascript">
function getDetailMsg(crNo) {
	$.ajax({
		type: 'post'
		, url: '/user/mypage/message'
		, data: {'crNo': crNo}
		, dataType: 'html'
		, success: function(res) {
			console.log("성공", res)
			
			$(".divDetailMsg").html(res)
			$(".divDetailMsg").show()
		}
		, error: function() { console.log("실패"), res}
	})
}
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>