<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<label class="comment_nick">${c.M_NICK }</label><br>
<label class="comment_content">${c.C_CONTENT }</label><br>
<label class="comment_date">
<fmt:formatDate value="${c.C_CREATE_DATE }" pattern="yyyy.MM.dd. HH:mm" /></label>
<label class="create_commentss" onclick="CmtCmtInsertForm(${c.C_NO})">답글 쓰기</label>
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