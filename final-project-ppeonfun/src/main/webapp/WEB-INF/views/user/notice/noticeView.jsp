<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp" />

<link rel="stylesheet" href="/resources/css/userNotice.css" type="text/css">

<script type="text/javascript">
$(document).ready(function(){
	$("#recommend").click(function(){
		$.ajax({
			type: "GET"
			, url: "/user/notice/recommend"
			, data: { bNo: ${viewBoard.B_NO} }
			, dataType: ""
			, success: function(res){
				$("#recommend").html(res)
			}
			, error: function(res){
				
			}
		})
	})

	
	$("#comment_nologin").click(function(){
		location.href="/user/member/loginForm"
	})
	
})


function comment_ok(){
	$.ajax({
		type: "GET"
		, url: "/user/notice/comment/insert"
		, data: {
			cContent: $("#comment_make").val(),
			bNo : ${viewBoard.B_NO },
			mNo : ${sessionScope.mNo }
		}
		, dataType: ""
		, success: function(res){
			$("#comment_list").html(res);
			$("#comment_make").val('');
		}
		, error: function(res){
			
		}
	})
}

function deleteBoard(){
	
	var test = confirm("정말로 삭제하시겠습니까?");
	
	if(test == true){
		location.href='/user/notice/delete?bNo='+${viewBoard.B_NO}
	} else {
		return
	}
}

/* 댓글 새로고침 기능 시작 */
function refreshList(b_no, array){
	$.ajax({
		type: "GET"
		, url: "/user/notice/comments/refresh"
		, data: {
			bNo: b_no
			, standard: array
		}
		, dataType: "html"
		, success: function(res){
			$("#CommentBox").html(res)
		}
		, error: function(res){
			
		}
	})
}
/* 댓글 새로고침 기능 끝 */

/* 댓글 수정, 삭제, 신고 버튼 팝업기능 시작 */
function layer_data(c_no){
	var classname = "#layer"+c_no;
	var $href = classname;
    layer_popup($href);
}

function layer_popup(el){
	var $el = $(el);    //레이어의 id를 $el 변수에 저장
	var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

	isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	var $elWidth = ~~($el.outerWidth()),
		$elHeight = ~~($el.outerHeight()),
		docWidth = $(document).width(),
		docHeight = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
		if ($elHeight < docHeight || $elWidth < docWidth) {
			$el.css({
				marginTop: -$elHeight+64 ,
				marginLeft: $elWidth+465
			})
		} else {
			$el.css({top: 0, left: 0})
		}
		
		
		$(document).mouseup(function(){
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 팝업 바깥 부분을 클릭하면 레이어가 닫힌다.
			return false;
		})
}
/* 댓글 수정, 삭제, 신고 버튼 팝업기능 끝 */

/* 대댓글 수정, 삭제, 신고 버튼 팝업기능 시작 */
function comment_layer_data(cs_no){
	var classname = "#comment"+cs_no;
	var $href = classname;
    comment_layer_popup($href);
}

function comment_layer_popup(el){
	var $el = $(el);    //레이어의 id를 $el 변수에 저장
	var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

	isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	var $elWidth = ~~($el.outerWidth()),
		$elHeight = ~~($el.outerHeight()),
		docWidth = $(document).width(),
		docHeight = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
		if ($elHeight < docHeight || $elWidth < docWidth) {
			$el.css({
				marginTop: -$elHeight+64 ,
				marginLeft: $elWidth+440
			})
		} else {
			$el.css({top: 0, left: 0})
		}
        
		
		$(document).mouseup(function(){
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 팝업 바깥 부분을 클릭하면 레이어가 닫힌다.
			return false;
		})
}
/* 대댓글 수정, 삭제, 신고 버튼 팝업기능 끝 */

/* 댓글 수정 폼 출력 기능 시작 */
function CmtUpdateForm(c_no, b_no){
	$.ajax({
		type: "GET"
		, url: "/user/notice/comment/update"
		, data: {
			cNo : c_no,
			bNo : b_no
		}
		, dataType: ""
		, success: function(res){
			$("#comment_list").html(res)
		}
		, error: function(res){
			
		}
	})
}
/* 댓글 수정 폼 출력 기능 끝 */

/* 댓글 수정 기능 시작 */
function updateCmt(c_no, b_no){
	$.ajax({
		type: "POST"
		, url: "/user/notice/comment/update"
		, data: {
			cNo : c_no,
			bNo : b_no,
			cContent: document.getElementById("comment_updateContent").value
		}
		, dataType: ""
		, success: function(res){
			$("#comment_list").html(res)
		}
		, error: function(res){
			
		}
	
	})
}
/* 댓글 수정 기능 끝 */

/* 댓글 수정 취소 기능 시작 */
function updateCmtCancel(c_no){
	$.ajax({
		type: "GET"
		, url: "/user/notice/comment/updateCancel"
		, data: {
			cNo: c_no
		}
		, dataType: "HTML"
		, success: function(res){
			$("#comment"+c_no).html(res);
		}
		, error: function(res){
			
		}
	})
}
/* 댓글 수정 취소 기능 끝 */

/* 댓글 삭제 기능 시작 */
function Cmtdelete(c_no, b_no){
	$.ajax({
		type: "GET"
		, url: "/user/notice/comment/delete"
		, data: {
			cNo : c_no,
			bNo : b_no
		}
		, dataType: ""
		, success: function(res){
			$("#comment_list").html(res);
			refreshHeart();
		}
		, error: function(res){
			
		}
	
	})
}
/* 댓글 삭제 기능 끝 */

/* 댓글에서 "답글쓰기" 버튼 누르면 나오는 대댓글 폼 삽입 시작 */
function CmtssInsertFormAfterCmts(c_no){
	$("#additoryDiv").remove();
	$("#CmtCmtText").remove();
		
	$.ajax({
		type: "GET"
		, url: "/user/notice/comments/insert"
		, data: {
			cNo: c_no
			, bNo: ${viewBoard.B_NO}
		}
		, dataType: "html"
		, success: function(res){
			$("#comment"+c_no).append(res)
		}
		, error: function(res){
			
		}
	})
}
/* 댓글에서 "답글쓰기" 버튼 누르면 나오는 대댓글 폼 삽입 끝 */

/* 댓글 하단 "답글 쓰기" 클릭 시 대댓글 삽입 시작 */
function CmtssInsertAfterCmts(c_no){
	var text = document.getElementById('comment_comment_make').value;
	
	$.ajax({
		type: "POST"
		, url: "/user/notice/comments/insert"
		, data: {
			cNo: c_no
			, mNo: ${sessionScope.mNo}
			, csContent: text
			, bNo : ${viewBoard.B_NO}
		}
		, dataType: ""
		, success: function(res){
			$("#comment_list").html(res);
		}
		, error: function(res){
			
		}
	})
}

/* 댓글 하단 "답글 쓰기" 클릭 시 대댓글 삽입 끝 */

/* 댓글 하단 "답글 쓰기" 클릭 후 취소 시작 */
function CmtssCancelAfterCmts(c_no){
	$("#CmtCmtText").remove();
}
/* 댓글 하단 "답글 쓰기" 클릭 후 취소 끝 */

/* 대댓글 하단 "답글쓰기" 버튼 클릭 시 대댓글 폼 삽입 시작 */
function CmtssInsertFormAfterCmtss(cs_no, c_no, m_nick){
	$.ajax({
		type: "GET"
		, url: "/user/notice/commentss/insert"
		, data: {
			csNo: cs_no
			, cNo: c_no
			, mNick: m_nick
		}
		, dataType: "html"
		, success: function(res){
			$("#CmtCmtText").remove();
			$("#additoryDiv").remove();
			$("#comment_comment"+cs_no).append(res);
		}
		, error: function(res){
			
		}
	})
}
/* 대댓글 하단 "답글쓰기" 버튼 클릭 시 대댓글 폼 삽입 끝 */

/* 대댓글 하단 "답글쓰기" 폼에서 등록 시작 */
function CmtCmtInsert(cs_no, c_no, m_nick){
	$.ajax({
		type: "POST"
		, url: "/user/notice/commentss/insert"
		, data: {
			csNo: cs_no
			, cNo: c_no
			, mNo: ${sessionScope.mNo }
			, csContent: $("#comment_comment_insertContent").val()
			, bNo: ${viewBoard.B_NO }
		}
		, dataType: ""
		, success: function(res){
			$("#comment_list").html(res);
			refreshHeart();
		}
		, error: function(res){
			
		}
	
	})
}
/* 대댓글 하단 "답글쓰기" 폼에서 등록 끝 */

/* 대댓글 하단 "답글쓰기" 폼에서 취소 시작 */
function CmtCmtInsertCancel(cs_no, m_nick){
	$.ajax({
		type: "GET"
		, url: "/user/notice/commentss/insertcancel"
		, data: {
			csNo: cs_no
			, mNick: m_nick
			, bNo: ${viewBoard.B_NO }
		}
		, dataType: "html"
		, success: function(res){
			$("#comment_comment"+cs_no).html(res);
		}
		, error: function(res){
			
		}
	})
} 
 
/* 대댓글 하단 "답글쓰기" 폼에서 취소 끝 */

/* 대댓글 수정 폼 출력 시작 */
function CmtCmtUpdateForm(cs_no, m_nick, cs_content){
	$("#additoryDiv").remove();
	$("#CmtCmtText").remove();
	
 	$.ajax({
 		type: "GET"
 		, url: "/user/notice/commentss/update"
 		, data: {
 			csNo: cs_no
 			, mNick: m_nick
 			, csContent: cs_content
 			, bNo: ${viewBoard.B_NO}
 		}
 		, dataType: "html"
 		, success: function(res){
 			$("#comment_list").html(res);
 		}
 		, error: function(res){
 			
 		}
 	})
}
/* 대댓글 수정 폼 출력 끝 */

/* 대댓글 수정 시작 */
function CmtCmtUpdate(cs_no, m_nick){
	var text = document.getElementById("comment_comment_updateContent").value;
	
	$.ajax({
		type: "POST"
		, url: "/user/notice/commentss/update"
		, data: {
			csNo: cs_no
			, csContent: text
			, mNick: m_nick
			, bNo: ${viewBoard.B_NO}
		}
		, dataType: "html"
		, success: function(res){
			$("#comment_comment"+cs_no).html(res);
		}
		, error: function(res){
			
		}
	})
}
/* 대댓글 수정 끝 */
 
 
/* 대댓글 수정 폼 출력 후 취소 시작 */
function CmtCmtUpdateCancel(){
	$.ajax({
		type: "GET" 
		, url: "/user/notice/commentss/updatecancel"
		, data: {
			bNo: ${viewBoard.B_NO}
		}
		, dataType: "html"
		, success: function(res){
			$("#comment_comment"+cs_no).html(res);
		}
		, error: function(res){
			
		}
	})
}
/* 대댓글 수정 폼 출력 후 취소 끝 */

/* 대댓글 우측 버튼 누를 시 로그인 한 유저가 대댓글 작성자와 같으면 수정,삭제 버튼이 나온다 */
/* 삭제버튼을 누를 시 대댓글 삭제 시작 */
function CmtCmtdelete(cs_no, b_no){
	$.ajax({
		type: "GET"
		, url: "/user/notice/commentss/delete"
		, data: {
			csNo: cs_no
			, bNo: b_no
		}
		, dataType: ""
		, success: function(res){
			$("#comment_list").html(res);
			refreshHeart();
		}
		, error: function(res){
			
		}
	})
}
/* 삭제버튼을 누를 시 대댓글 삭제 끝 */

/* 댓글 삽입 혹은 삭제를 할 시 우상단의 총 댓글수 초기화 시작 */
function refreshHeart(){
	$.ajax({
		type: "GET"
		, url: "/admin/notice/refreshHeart"
		, data: {
			bNo: ${viewBoard.B_NO}
		}
		, dataType: "json"
		, success: function(res){
			$("#heart").html(res.heart);
		}
		, error: function(res){
			
		}
	})
}
/* 댓글 삽입 혹은 삭제를 할 시 우상단의 총 댓글수 초기화 끝 */
</script>

<div id="content">

<div class="back">
<a href="/user/notice/list"><label class="backlist"> 공지사항 > </label></a>
</div>

<div class="anbody">

	<div style="text-align: left;"><label class="viewTitle">${viewBoard.B_TITLE }</label></div>
	<div style="text-align: left;"><label>${viewBoard.M_NICK }</label></div>
	<div class="CdAndHit" style="text-align: left;"><label>
		<fmt:formatDate value="${viewBoard.B_CREATE_DATE }" type="both" pattern="yyyy.MM.dd. HH:mm" />
		</label>&nbsp;&nbsp;&nbsp;
		<label class="HitLabel">조회 ${viewBoard.B_HIT }</label>
		<c:if test="${chkRec }">
			<label id="recommend" style="cursor: pointer;"><span style="color: red;">&nbsp;&#x2764;</span>&nbsp;추천&nbsp;${rec }</label>
		</c:if>
		<c:if test="${not chkRec }">
			<label id="recommend" style="cursor: pointer;"><span>&nbsp;&#x2764;</span>&nbsp;추천&nbsp;${rec }</label>
		</c:if>
		<a href="#CommentBox" class="total_comments_btn pull-right" style="color: black;"><img class="total_comments" src="/resources/img/comments_icon.png" style="width: 25px; height: 25px;">&nbsp;댓글&nbsp;&nbsp;<label id="heart">${viewBoard.COMMENTS + viewBoard.COMMENTSS }</label></a>
	</div><br>
	
	<div class="viewContent" style="text-align: left;"><label>${viewBoard.B_CONTENT }</label></div>
	
	<div class="imgbox" style="text-align: left;">
		<c:forEach var="f" items="${flist }">
			<a href="/user/notice/download?fileno=${f.bfFileno }">
			<img class="imgclick" src="/resources/upload/${f.bfStoredName }"></a>
		</c:forEach>
	</div>
	<br>
	
	<div id="CommentBox" class="CommentBox" style="text-align: left;">
		<div class="comment_tab">
			<label style="font-size: 17pt; font-weight: 500;">댓글</label>&nbsp;&nbsp;
			<label class="arrayDesc" style="font-weight: 500; cursor: pointer; color: black;" onclick="refreshList(${viewBoard.B_NO}, 'ASC')">등록순</label>&nbsp;
			<label class="arrayAsc" style="font-weight: 400; cursor: pointer; color: silver;" onclick="refreshList(${viewBoard.B_NO}, 'DESC')">최신순</label>&nbsp;
			<label><img src="/resources/img/refresh.png" style="width: 20px; height: 20px; margin-bottom: 5px; cursor: pointer;" onclick="refreshList(${viewBoard.B_NO}, '${standard}')"></label>
		</div>
		<div id="comment_list" class="comment_list">
			<%-- 댓글 시작 --%>
			<c:forEach var="c" items="${clist }">
				<c:if test="${c.C_DELETE_STATE eq 'Y'}">
					<div id="comment${c.C_NO }" class="comment">
						<label class="comment_nick">${c.M_NICK }</label><br>
						<label class="comment_content">${c.C_CONTENT }</label><br>
						<label class="comment_date">
						<fmt:formatDate value="${c.C_CREATE_DATE }" pattern="yyyy.MM.dd. HH:mm" /></label>
						<label class="create_commentss" onclick="CmtssInsertFormAfterCmts(${c.C_NO})">답글 쓰기</label>
						<label id="#layer${c.C_NO }" class="btn-example pull-right" onclick="layer_data(${c.C_NO})">…</label>
						<div id="layer${c.C_NO }" class="pop-layer">
							<div class="pop-container">
								<div class="pop-conts">
									<c:if test="${c.M_NO eq sessionScope.mNo }">
										<label class="pop-btn" onclick="CmtUpdateForm(${c.C_NO}, ${c.B_NO })">수정</label><br>
										<label class="pop-btn" onclick="Cmtdelete(${c.C_NO}, ${c.B_NO })">삭제</label>
									</c:if>
									<c:if test="${c.M_NO ne sessionScope.mNo }">
										<label class="pop-btn" onclick="">신고</label>
									</c:if>
								</div>
	   						</div>
						</div>
					</div>
				</c:if>
				<c:if test="${c.C_DELETE_STATE eq 'N'}">
					<div id="deletedCmt" class="deletedCmt">
						<label>삭제된 댓글입니다.</label>
					</div>
				</c:if>
				<div id="comment_comment_list" class="comment_comment_list">
					<div class="test"></div>
					<%-- 대댓글 시작 --%>
					<c:forEach var="cc" items="${cclist }">
						<c:if test="${c.C_NO eq cc.C_NO }">
							<div id="comment_comment${cc.CS_NO }" class="comment_comment" style="margin-left: 50px;">
								<label class="comment_comment_nick">${cc.M_NICK }</label><br>
								<label class="comment_comment_content">${cc.CS_CONTENT }</label><br>
								<label class="comment_comment_date">
								<fmt:formatDate value="${cc.CS_CREATE_DATE }" pattern="yyyy.MM.dd HH:mm" /></label>
								<label id="#comment${cc.CS_NO }" class="btn-example pull-right" onclick="comment_layer_data(${cc.CS_NO })">…</label>
								<div id="comment${cc.CS_NO }" class="comment-pop-layer">
									<div class="comment-pop-container">
										<div class="comment-pop-conts">
											<c:if test="${cc.M_NO eq sessionScope.mNo }">
												<label class="pop-btn" onclick="CmtCmtUpdateForm(${cc.CS_NO }, '${cc.M_NICK }', '${cc.CS_CONTENT }')">수정</label><br>
												<label class="pop-btn" onclick="CmtCmtdelete(${cc.CS_NO }, ${c.B_NO })">삭제</label>
											</c:if>
											<c:if test="${cc.M_NO ne sessionScope.mNo }">
												<label class="pop-btn" onclick="">신고</label>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div><br>
		
		<c:if test="${not empty sessionScope.mNo }">
		<div class="row">
  			<div class="col-lg-12">
			<label for="comment_make">${sessionScope.mNick }</label>
    			<div class="input-group">
					<textarea class="form-control" id="comment_make" rows="2" placeholder="댓글을 입력하세요" style="resize:none;"></textarea>
      				<span class="input-group-btn" style="vertical-align:bottom;">
						<button class="btn" id="comment_ok" onclick="comment_ok()">완료</button>
      				</span>
		    	</div><!-- .input-group -->
		  	</div><!-- .col-lg-12 -->
		 </div><!-- .row -->
		</c:if>
	</div>
	
	<div class="btnbox" style="margin:30px 0;">
		<c:if test="${viewBoard.M_NO eq sessionScope.mNo}">
			<button class="viewbtn" onclick="location.href='/user/notice/update?bNo=${viewBoard.B_NO}'">수정</button>
			<button class="viewbtn" onclick="deleteBoard()">삭제</button>
		</c:if>
	<button class="viewbtn" onclick="location.href='/user/notice/list'">목록</button>
	</div>

</div> <%-- anbody end --%>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
