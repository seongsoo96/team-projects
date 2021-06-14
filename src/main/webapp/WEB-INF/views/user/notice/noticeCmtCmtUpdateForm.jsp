<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<label class="comment_comment_nick">${mNick }</label><br>
<textarea id="comment_comment_updateContent" cols="167" rows="3">${cmtss.csContent }</textarea><br>
<div>
	<button class="okbtn-after-cmtupdate pull-right" onclick="CmtCmtUpdate(${cmtss.csNo}, '${mNick }')">수정</button>
	<button class="cnbtn-after-cmtupdate pull-right" onclick="CmtCmtUpdateCancel(${cmtss.csNo},'${mNick }')">취소</button>
</div>