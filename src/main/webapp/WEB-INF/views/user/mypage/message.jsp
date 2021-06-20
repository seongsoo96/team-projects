<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<style type="text/css">
/* 대화 상세 조회 */
.divDetailMsg {border:2px solid black; float:right; width:48%; height:565px; overflow-x:hidden; overflow-y:auto;}

/* 대화 목록 */
.divChatList {margin:20px 0; width:50%; height:105px;}
.divChatList img {width:100px; height:100px;}
.divChatList .divOtherNick {position:relative; top:-100px; left:120px; font-size:16px; font-weight:600; margin-top:10px;}
.divChatList .divMsgContent {position:relative; top:-80px; left:120px; font-size:14px;}
.pagingLoc {position:relative;}

/* 대화 상세 조회 버튼 */
.divMsgContent button {background:none; border:none; text-decoration:underline;}

/* 메시지 입력 */
.divInputMsg {background-color:black; height:40px; width:48%; padding:6px 0; position:relative; right:-52%;}
.divInputMsg button {margin:0 12px;  background:black; color:#4EE2EC; border:none; border-radius:3px;}
.divInputMsg button:hover {border:1px solid white;}
.divInputMsg input {width: 76%; border:1px solid black; border-radius:3px; margin-left:10%;}

/* 모달 메시지 스타일 */
.modalMsg {font-size:16px; margin-bottom:20px;}
</style>

<div class="container" style="margin-bottom:5%;">

	<!-- 메시지 알림 모달창: 메시지 전송 실패 -->
	<div class="modal fade" id="failSendMsgModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body form-inline">
					<div class="form-group text-center" style="width:100%;">
						<div class="modalMsg">메시지 전송을 실패했습니다.</div>
						<button type="button" class="btn" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메시지 알림 모달창: 메시지 불러오기 실패 -->
	<div class="modal fade" id="failReadMsgModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body form-inline">
					<div class="form-group text-center" style="width:100%;">
						<div class="modalMsg">메시지를 불러오는데 실패했습니다.</div>
						<button type="button" class="btn" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="divFundMenu">
		<h2 style="display:inline-block">메시지</h2>
	</div>
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
				<c:choose>
					<c:when test="${fn:contains(clist.MY_STORED_NAME, 'test') or ('member.png' eq clist.MY_STORED_NAME) }">
						<img src="/resources/img/member.png">
					</c:when>
					<c:otherwise>
						<img src="/upload/profile/${clist.MY_STORED_NAME }">
					</c:otherwise>
				</c:choose>
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
			<c:if test="${not cStatus.last }"><hr style="width:50%;"></c:if>
		</c:forEach>
	
		<!-- 메시지 입력창 -->
		<div class="divInputMsg"
			<c:if test="${fn:length(chatList) eq 1}">style="top:439px"</c:if>
			<c:if test="${fn:length(chatList) eq 2}">style="top:293px"</c:if>
			<c:if test="${fn:length(chatList) eq 3}">style="top:147px"</c:if>
		>
			<!-- <button type="button" id="btnAttachFile" style="display:none;"><span class="glyphicon glyphicon-picture"></span></button> -->
			<input type="file" id="inputMsgFile" accept="image/*" style="display:none;" />
			<input type="text" id="inputMsgContent" placeholder="메시지를 입력하세요"/>
			<span><button type="button" id="btnSendMsg"><i class="far fa-paper-plane"></i></button></span>
		</div>
		
		<c:if test="${paging.totalPage > 1 }">
			<c:import url="/WEB-INF/views/admin/project/paging.jsp"/>
		</c:if>
	</c:if>
</div>
<script type="text/javascript">
$(document).ready(function() {
	//메시지 상세 조회 hide
	$(".divDetailMsg").hide()
	$(".divInputMsg").hide()
	
	//종이비행기 아이콘 클릭 시 메시지 전송
 	$("#btnSendMsg").click(function() {
 		
 		var msgContent = $("#inputMsgContent").val()
 		if(msgContent == '') {
 			$("#failSendMsgModal").modal('toggle')
 			return false
 		}
 		
		$.ajax({
			type:'post'
			, url: '/user/mypage/message/send'
			, data: {'crNo': $("#crNo").val(), 'msgContent': msgContent}
			, dataType: 'json'
			, success: function(res) {
				console.log("성공", res)
				
				if(res.isSended) {
					$("#inputMsgContent").val("")
					getDetailMsg($("#crNo").val())
				}
			}
			, error: function() {
				console.log("메시지 전송 실패")
				$("#failSendMsgModal").modal('toggle')
			}
		})
	}) 
	
	//파일 첨부 아이콘 클릭 시 파일 첨부
	$("#btnAttachFile").click(function() {
		$("#inputMsgFile").click()
	})
	
	
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
			$(".divInputMsg").show()
		}
		, error: function() {
			console.log("실패")
			$("#failReadMsgModal").modal('toggle')
		}
	})
}
</script>
<!-- <script type="text/javascript">
function attachFile(detailMsg) {
	console.log(detailMsg)
}
</script> -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>