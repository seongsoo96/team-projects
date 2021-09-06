<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
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
.searchProject{
	cursor:pointer;
}


</style>
<script type="text/javascript">

function searchProject(pNo){
	console.log(pNo);

	$.ajax({
	type: "get"
	, url: "/admin/report/search/project"
	, dataType: "json"
	, data: {
		pNo: pNo
	}
	, success: function(res){
		console.log("success")
		console.log(res);
		$("input[name=pNo]",opener.document).val(res.project.P_NO); // jQuery 방식 1
		$("input[name=mFounderNo]",opener.document).val(res.project.M_NO);
		$("input[name=pName]",opener.document).val(res.project.P_NAME);
		$("input[name=mName]",opener.document).val(res.project.M_NAME);
		$("input[name=mNick]",opener.document).val(res.project.M_NICK);
		self.close();
		
	}
	, error: function() {
		console.log("error");
	}
	
	
	
});	 
	
}	
</script>
</head>
<body>
<div class="container">
	
	<h2>프로젝트 검색하기</h2>
	<form action="/admin/report/search" method="get">
		<div id="search">
			<select class="dropbox" name="category">
				<option value="title">제목:</option>
				<option value="name">이름:</option>
				<option value="nick">닉네임</option>
			</select>
			<input type="text" id="search" class="search" name="search" placeholder="검색어를 입력해주세요"  />
			<button class="searchBtn">검색</button>
		</div>
		</form>
<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%; text-align:center;">번호</th>
		<th style="width: 30%; text-align:center;">프로젝트 제목</th>
		<th style="width: 10%; text-align:center;">이름</th>
		<th style="width: 10%; text-align:center;">닉네임</th>
		<th style="width: 20%; text-align:center;">생성날짜</th>
		<th style="width: 20%; text-align:center;">경고횟수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="project">
	<tr>	
		<td style="text-align:center;">${project.P_NO }</td>
		<td style="text-align:center;"><a class="searchProject" onclick="searchProject(${project.P_NO})">${project.P_NAME }</a></td>
		<td style="text-align:center;">${project.M_NAME }</td>
		<td style="text-align:center;">${project.M_NICK }</td>
		<td style="text-align:center;"><fmt:formatDate value="${project.P_CREATE_DATE }" pattern="yyyy-MM-dd" /></td>
		<td style="text-align:center;">${project.P_CAUTION }</td>		
	</tr>
</c:forEach>
</tbody>
</table>
<c:import url="/WEB-INF/views/admin/project/paging.jsp"></c:import> 



</div>
</body>
</html>