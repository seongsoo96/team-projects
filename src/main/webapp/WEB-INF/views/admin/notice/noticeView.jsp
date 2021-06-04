<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<link rel="stylesheet" href="/resources/css/adminNotice.css" type="text/css">

<script type="text/javascript">
$(document).ready(function(){
	$("#recommend").click(function(){
		console.log("recommend")
		
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
		
	
})
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
		<div class="comment_list">
			<c:forEach var="c" items="${clist }">
				
			</c:forEach>
		</div>
	</div>
	
	<div class="btnbox">
		<c:if test="${viewBoard.M_NO eq sessionScope.mNo}">
			<button class="viewbtn" onclick="location.href='/admin/notice/update?bNo=${viewBoard.B_NO}'">수정</button>
			<button class="viewbtn" onclick="location.href='/admin/notice/delete?bNo=${viewBoard.B_NO}'">삭제</button>
		</c:if>
	<button class="viewbtn" onclick="history.go(-1)">목록</button>
	</div>

</div> <%-- anbody end --%>

</div> <%-- content end --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
