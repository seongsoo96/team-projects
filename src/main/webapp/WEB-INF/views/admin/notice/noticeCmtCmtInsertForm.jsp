<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="CmtCmtText" style="padding-bottom: 10px;">
	<textarea id="comment_comment_make" cols="170" rows="3" placeholder="댓글을 남겨보세요" 
		style="margin: 10px 0px 0px 50px;"></textarea>
	<input type="button" class="pull-right" onclick="CmtssInsertAfterCmts(${cNo})" 
		style="background-color: white; border: none; color: silver; 
		padding: 10px 50px 10px 0px; font-size: 11pt;" value="등록">
	<input type="button" class="pull-right" onclick="CmtssCancelAfterCmts(${cNo})"
		style="background-color: white; border: none; color: silver; 
		padding: 10px 30px 10px 0px; font-size: 11pt;" value="취소">
</div>