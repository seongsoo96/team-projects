<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<label class="comment_comment_nick">${mNick }</label><br>
<label class="comment_comment_content">${cmtss.csContent }</label><br>
<label class="comment_comment_date">
<fmt:formatDate value="${cmtss.csCreateDate }" pattern="yyyy.MM.dd HH:mm" /></label>
<label id="#comment${cmtss.csNo }" class="btn-example pull-right" onclick="comment_layer_data(${cc.csNo })">…</label>
<div id="comment${cmtss.csNo }" class="comment-pop-layer">
	<div class="comment-pop-container">
		<div class="comment-pop-conts">
			<c:if test="${cmtss.mNo eq sessionScope.mNo }">
				<label class="pop-btn" onclick="CmtCmtUpdateForm(${cmtss.csNo }, '${mNick }', '${cmtss.csContent }')">수정</label><br>
				<label class="pop-btn" onclick="CmtCmtdelete(${cmtss.csNo }, ${bNo })">삭제</label>
			</c:if>
			<c:if test="${cmtss.mNo ne sessionScope.mNo }">
				<label class="pop-btn" onclick="">신고</label>
			</c:if>
		</div>
	</div>
</div>