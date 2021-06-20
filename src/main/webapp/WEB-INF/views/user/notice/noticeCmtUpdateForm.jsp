<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="c" items="${cmtList }">
	<c:if test="${c.C_DELETE_STATE eq 'Y'}">
		<c:if test="${c.C_NO ne cmt.C_NO }">
			<div id="comment${c.C_NO }" class="comment">
				<label class="comment_nick">${c.M_NICK }</label><br>
				<label class="comment_content">${c.C_CONTENT }</label><br>
				<label class="comment_date"><fmt:formatDate value="${c.C_CREATE_DATE }" pattern="yyyy.MM.dd. HH:mm" /></label>
				<label class="create_commentss" onclick="CmtssInsertFormAfterCmts(${c.C_NO})">답글 쓰기</label>
				<label id="#layer${c.C_NO }" class="btn-example pull-right" onclick="layer_data(${c.C_NO})">…</label>
				<div id="layer${c.C_NO }" class="pop-layer">
					<div class="pop-container">
						<div class="pop-conts">
							<c:if test="${c.M_NO eq sessionScope.mNo }">
								<label class="pop-btn" onclick="CmtUpdateForm(${c.C_NO}, ${c.B_NO })">수정</label><br>
								<label class="pop-btn" onclick="Cmtdelete(${c})">삭제</label>
							</c:if>
							<c:if test="${c.M_NO ne sessionScope.mNo }">
								<label class="pop-btn" onclick="">신고</label>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${c.C_NO eq cmt.C_NO }">
			<div id="comment${c.C_NO }" class="comment">
				<div class="form-group">
					<label class="comment_nick">${c.M_NICK }</label>
					<textarea class="form-control" id="comment_updateContent" style="resize:none;">${c.C_CONTENT }</textarea>
					<div class="clearfix">
						<button class="okbtn-after-cmtupdate pull-right" onclick="updateCmt(${c.C_NO}, ${c.B_NO })">등록</button>
						<button class="cnbtn-after-cmtupdate pull-right" onclick="updateCmtCancel(${c.C_NO})">취소</button>
			    	</div>
			    </div>
			</div>
		</c:if>
	</c:if>
	<c:if test="${c.C_DELETE_STATE eq 'N'}">
		<div id="deletedCmt" class="deletedCmt">
			<label>삭제된 댓글입니다.</label>
		</div>
	</c:if>
	<div id="comment_comment_list" class="comment_comment_list">
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
									<label class="pop-btn" onclick="CmtCmtUpdateForm(${cc.CS_NO}, ${c.B_NO })">수정</label><br>
									<label class="pop-btn" onclick="CmtCmtdelete(${cc.CS_NO}, ${c.B_NO })">삭제</label>
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