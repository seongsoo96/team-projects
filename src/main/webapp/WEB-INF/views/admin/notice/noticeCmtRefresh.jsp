<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="comment_tab">
	<label style="font-size: 17pt; font-weight: 500;">댓글</label>&nbsp;&nbsp;
	<c:if test="${standard eq 'ASC'}">
		<label class="arrayDesc" style="font-weight: 500; cursor: pointer; color: black;" onclick='refreshList(${bNo}, "ASC")'>등록순</label>&nbsp;
		<label class="arrayAsc" style="font-weight: 400; cursor: pointer; color: silver;" onclick='refreshList(${bNo}, "DESC")'>최신순</label>&nbsp;
	</c:if>
	<c:if test="${standard eq 'DESC'}">
		<label class="arrayDesc" style="font-weight: 400; cursor: pointer; color: silver;" onclick='refreshList(${bNo}, "ASC" )'>등록순</label>&nbsp;
		<label class="arrayAsc" style="font-weight: 500; cursor: pointer; color: black;" onclick='refreshList(${bNo}, "DESC")'>최신순</label>&nbsp;
	</c:if>
	<label><img src="/resources/img/refresh.png" style="width: 20px; height: 20px; margin-bottom: 5px; cursor: pointer;" onclick='refreshList(${bNo},"${standard}")'></label>
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
			<%-- 대댓글 시작 --%>
			<c:forEach var="cc" items="${cclist }">
				<c:if test="${c.C_NO eq cc.C_NO }">
					<div id="comment_comment${cc.CS_NO }" class="comment_comment" style="margin-left: 50px;">
						<label class="comment_comment_nick">${cc.M_NICK }</label><br>
						<label class="comment_comment_content">${cc.CS_CONTENT }</label><br>
						<label class="comment_comment_date">
						<fmt:formatDate value="${cc.CS_CREATE_DATE }" pattern="yyyy.MM.dd HH:mm" /></label>
						<label class="create_commentss" onclick="CmtssInsertFormAfterCmtss(${cc.CS_NO }, ${cc.C_NO }, '${cc.M_NICK }')">답글 쓰기</label>
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
<div>
	<c:if test="${not empty sessionScope.mNo }">
		<label>${sessionScope.mNick }</label>
		<textarea id="comment_make" cols="178" rows="3" placeholder="댓글을 입력하세요"></textarea>
		<button id="comment_ok">완료</button>
	</c:if>
	<c:if test="${empty sessionScope.mNo }">
		<textarea id="comment_nologin" cols="178" rows="3" placeholder="로그인이 필요합니다"></textarea>
		<button disabled>완료</button>
	</c:if>
</div>