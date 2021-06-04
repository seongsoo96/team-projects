<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css" type="text/css">

<script type="text/javascript">
$(document).ready(function(){
	$("#recommend").click(function(){
		$.ajax({
			type: "GET"
			, url: "/admin/notice/recommend"
			, data: { bNo: ${viewBoard.B_NO} }
			, dataType: ""
			, success: function(res){
				$("#recommend").html(res)
			}
			, error: function(res){
				
			}
		})
		
	})
	
	$("#comment_ok").click(function(){
		$.ajax({
			type: "GET"
			, url: "/admin/notice/comment/insert"
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
	})
	
	$("#comment_nologin").click(function(){
		location.href="/user/member/loginForm"
	})
	
	
	$('.btn-example').click(function(){
        var $href = $(this).attr('id');
        layer_popup($href);
    });
	
})

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
				marginTop: -$elHeight+77 ,
				marginLeft: -$elWidth-410
			})
		} else {
			$el.css({top: 0, left: 0});
		}
        

		$(document).mouseup(function(){
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			return false;
		});
}

function updateForm(c_no){
	$.ajax({
		type: "GET"
		, url: "/admin/notice/comment/update"
		, data: {
			cNo : c_no
		}
		, dataType: ""
		, success: function(res){
			
		}
		, error: function(res){
			
		}
	})
}
	
function updateCmt(c_no){
	$.ajax({
		type: "POST"
		, url: "/admin/notice/comment/update"
		, data: {
			cNo : c_no
		}
		, dataType: ""
		, success: function(res){
			
		}
		, error: function(res){
			
		}
	
	})
}

function deleteCmt(cNo){
	
}
</script>

<div id="content">

<div class="back">
<a href="/admin/notice/list"><label class="backlist"> 공지사항 > </label></a>
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
	</div><br>
	
	<div class="viewContent" style="text-align: left;"><label>${viewBoard.B_CONTENT }</label></div>
	
	<div class="imgbox" style="text-align: left;">
		<c:forEach var="f" items="${flist }">
			<a href="/admin/notice/download?fileno=${f.bfFileno }">
			<img class="imgclick" src="/resources/upload/${f.bfStoredName }"></a>
		</c:forEach>
	</div>
	<br>
	
	<div class="CommentBox" style="text-align: left;">
		<div class="comment_tab">
			<label style="font-size: 17pt; font-weight: 500;">댓글</label>&nbsp;&nbsp;
			<label class="arrayDesc" style="font-weight: 400; cursor: pointer;">등록순</label>&nbsp;
			<label class="arrayAsc" style="font-weight: 400; cursor: pointer;">최신순</label>
		</div>
		<div id="comment_list" class="comment_list">
			<c:forEach var="c" items="${clist }" varStatus="stat">
				<div class="comment">
					<label class="comment_nick">${c.M_NICK }</label><br>
					<label class="comment_content">${c.C_CONTENT }</label><br>
					<label class="comment_date"><fmt:formatDate value="${c.C_CREATE_DATE }" pattern="yyyy.MM.dd. HH:mm" /></label>
					<label id="#layer${stat.index }" class="btn-example">…</label>
					<div id="layer${stat.index }" class="pop-layer">
						<div class="pop-container">
							<div class="pop-conts">
								<c:if test="${c.M_NO eq sessionScope.mNo }">
									<label class="pop-btn" onclick="updateForm(${c.C_NO})">수정</label><br>
									<label class="pop-btn" onclick="deleteCmt(${c.C_NO})">삭제</label>
								</c:if>
								<c:if test="${c.M_NO ne sessionScope.mNo }">
									<label class="pop-btn" onclick="">신고</label>
								</c:if>
							</div>
   						</div>
					</div>
				</div>
			</c:forEach>
		</div><br>
		<div>
			<c:if test="${not empty sessionScope.mNo }">
				<textarea id="comment_make" cols="178" rows="3" placeholder="댓글을 입력하세요"></textarea>
				<button id="comment_ok">완료</button>
			</c:if>
			<c:if test="${empty sessionScope.mNo }">
				<textarea id="comment_nologin" cols="178" rows="3" placeholder="로그인이 필요합니다"></textarea>
				<button disabled>완료</button>
			</c:if>
		</div>
	</div>
	
	<div class="btnbox">
		<c:if test="${viewBoard.M_NO eq sessionScope.mNo}">
			<button class="viewbtn" onclick="location.href='/admin/notice/update?bNo=${viewBoard.B_NO}'">수정</button>
			<button class="viewbtn" onclick="location.href='/admin/notice/delete?bNo=${viewBoard.B_NO}'">삭제</button>
		</c:if>
	<button class="viewbtn" onclick="location.href='/admin/notice/list'">목록</button>
	</div>

</div> <%-- anbody end --%>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
