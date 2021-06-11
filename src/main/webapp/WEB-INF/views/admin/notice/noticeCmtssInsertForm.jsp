<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="additoryDiv">
<label class="comment_comment_nick">${mNick }</label><br>
<textarea id="comment_comment_insertContent" cols="167" rows="3"></textarea><br>
<div>
	<button class="updateCompleteBtn pull-right" onclick="CmtCmtInsert(${cmtss.csNo}, ${cmtss.cNo }, '${mNick }')">등록</button>
	<button class="updateCancelBtn pull-right" onclick="CmtCmtInsertCancel(${cmtss.csNo},'${mNick }')">취소</button>
</div>
</div>