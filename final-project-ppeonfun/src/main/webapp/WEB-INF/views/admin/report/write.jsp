<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#search").click(function(){
		var child;
		child = window.open("/admin/report/search", "_blank", "height:500px, width:500px");	
	})
	
	
});

</script>

<style type="text/css">
label{
	display: block;
}
</style>

<div id="content">
	<div class="container">
		<h3>신고 등록</h3>
		<form action="/admin/report/write" method="post">
		<div class="row">
			<div class="col-lg-12">
			    <label class="control-label text-left" for="pName">프로젝트 제목</label>
			    <div class="input-group">
			      <input type="text" class="form-control" id="pName" name="pName" placeholder="프로젝트를 검색하세요" readonly/>
			      <span class="input-group-btn">
			        <button id="search" class="btn btn-primary" type="button">검색</button>
			      </span>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			
		</div>
		
		<div class="form-group">
		  <label class="control-label text-left" for="pNo">프로젝트 번호</label>
		  <input type="text" class="form-control" id="pNo" name="pNo" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="mFounderNo">개설자번호</label>
		  <input type="text" class="form-control" id="mFounderNo" name="mFounderNo" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="mName">개설자이름</label>
		  <input type="text" class="form-control" id="mName" name="mName" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="mNick">개설자닉네임</label>
		  <input type="text" class="form-control" id="mNick" name="mNick" readonly/>
		</div>	
		<div class="form-group">
		  <label class="control-label text-left" for="mReporterNo">신고자 번호</label>
		  <input type="text" class="form-control" id="mReporterNo" name="mReporterNo" value="${mNo }" readonly/>
		</div>
		<div class="form-group">
		  <label class="control-label text-left" for="repContent">신고내용</label>
		  <textarea class="form-control" id="repContent" name="repContent" rows="5" ></textarea>
		</div>
		
		<div class="form-group">
			 <label class="control-label text-left" for="repManagerContent">관리자 의견</label>
			 <textarea class="form-control" id="repManagerContent" name="repManagerContent" rows="5"></textarea>
		</div>

		
		<div class="form-group text-left">
			<button type="submit" class="btn btn-info">신고등록</button>
			<a href="/admin/report/list"><button type="button" class="btn btn-primary">돌아가기</button></a>
		</div>
		
		
		
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>