<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<style type="text/css">
hr{
	margin-top:80px;
}
.fa-plus{
	color:#4EE2EC;
}
#projectWrite{
	cursor: pointer;
}

/* 테이블 디자인 */
.usertable {
	margin-bottom: 20px;
	max-width: 100%;
	width: 100%;
}

tr {
	border-radius: 10px;
	height: 35px;
}

th, td {
	border-bottom: 1px solid #f6f6f6;
	text-align: center;
}

th {
	background-color: #C4FFFF;
}

.anbody1 {
	margin: 0 auto;
	text-align: left !important;
	width: 1070px;
}

/* 검색 디자인 */
.search {
	border-color: snow;
	height: 30px;
	width: 200px;
}

.searchBtn {
	background-color: #C4FFFF;
	border: none;
	height: 30.5px;
	margin-left: -4px;
	width: 50px;
}
.dropbox {
	border-color: ivory;
	height: 30px;
	margin: 0px 5px;
	width: 100px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#userRegister").click(function(){
		var result = confirm('사용자를 등록 하시겠습니까?');
		if(result){
			$(location).attr("href", "/admin/user/register");
		}
	})	
	
	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})
	
	$('#change').click(function(){
		var mNick = $('#nick').val()
		var mNo = $('#no').val()
		$(location).attr("href", "/admin/user/update?mNick="+mNick+"&mNo="+mNo);
	})
	
	$('#delete').click(function(){
		var result = confirm('사용자를 삭제 하시겠습니까?');
		var mNo = $('#no').val()
		if(result){
			$(location).attr("href", "/admin/user/delete?mNo="+mNo);
		}
	})
	
	
})
function view(m_no){
		console.log("현재 클릭한 m_no 값 : " + m_no)

		$.ajax({
				type: "get"
				, url: "/admin/user/view"
				, data: {
					"m_no" : m_no,
				}
				, dataType: "html"
				, success: function(res){
					console.log("성공")
					console.log(res)
					
					
					$('.modal-body').empty()
					$('.modal-body').append(res)
					
					
					
				}
				, error: function(){
					console.log("error")
				}
			})
	
}
</script>

<style>
th {
	text-align: center;
}
</style>

<div id="content">

<!-- <div class=""> -->
	
	<h1 class="pull-left">사용자 관리 &nbsp;<a id="userRegister"><i style="cursor: pointer;" class="fas fa-plus"></i></a></h1>
	<hr>
	
	<div class="anbody1">
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">사용자 정보</h4>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button id="delete" type="button" class="btn btn-danger">삭제</button>
	        <button id="change" type="button" class="btn btn-primary">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<form action="/admin/user/list" class="pull-left">
	<div id="search">
		<select name="category" class="dropbox">
			<option value="m_name">이름</option>
			<option value="m_id">아이디</option>
			<option value="m_nick">닉네임</option>
		</select>
		
		<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요">
		<button class="searchBtn">검색</button>
	</div>
	</form>
	
	<br><br>
	<table class="usertable">
		<thead>
			<tr>
				<th style="width: 10%">번호</th>
				<th style="width: 10%; padding-left:10px;">이름</th>
				<th style="width: 10%">아이디</th>
				<th style="width: 15%">닉네임</th>
				<th style="width: 20%">생년월일</th>
				<th style="width: 30%">이메일</th>
				<th style="width: 15%">신고</th>
			</tr>
		</thead>
		
<!-- 			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"> -->
<!-- 			  Launch demo modal -->
<!-- 			</button> -->
		<tbody>
		<c:forEach items="${list }" var="user">
			<tr>
				<td style="padding-left:10px;">${user.M_NO }</td>
				<td><a style="cursor: pointer;" data-toggle="modal" data-target="#myModal" onclick="view(${user.M_NO})">${user.M_NAME }</a></td>
				<td>${user.M_ID }</td>
				<td>${user.M_NICK }</td>
				<td><fmt:formatDate value="${user.M_BIRTH }" pattern="yy-MM-dd"/></td>
				<td>${user.M_EMAIL }</td>
				<td>${user.M_CAUTION }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
<!-- 	<a href="/member/main"><button>메인으로</button></a> -->
<!-- 	<div id="btnBox"> -->
<!-- 		<button id="btnMain" class="btn btn-primary">메인으로</button> -->
<%-- 		<c:if test="${not empty login }"> --%>
<!-- 			<button id="btnWrite" class="btn btn-primary">글쓰기</button> -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${empty login }"> --%>
<!-- 			<button id="btnWrite" class="btn btn-primary disabled">글쓰기</button> -->
<%-- 		</c:if> --%>
<!-- 	</div> -->
	
	<span class="pull-left">total : ${paging.totalCount }</span>
	<div class="clearfix"></div>
	
	</div>
	
<c:if test="${paging.totalPage > 1 }">
	<c:import url="/WEB-INF/views/admin/user/ppeonfunpaging.jsp" />   
</c:if>     
	
</div><!-- #content -->
<!-- </div> -->


<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>