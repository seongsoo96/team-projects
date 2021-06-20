<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="CmtCmtText" style="padding-bottom:10px; height:120px;">
	<div class="form-group col-lg-6">
		<textarea class="form-control" id="comment_comment_make" rows="2" placeholder="댓글을 남겨보세요" style="margin:10px 0px 0px 50px; resize:none;"></textarea>
		<div class="clearfix" style="text-align:right;">
			<button type="button" onclick="CmtssCancelAfterCmts(${cNo})" style="background-color: #f2f2f2; border: none; padding: 10px 30px 10px 0px; font-size: 11pt;">취소</button>
			<button type="button" onclick="CmtssInsertAfterCmts(${cNo})" style="background-color: #4EEDED; border: none; padding: 10px 50px 10px 0px; font-size: 11pt;">등록</button>
		</div>
	</div>
</div>