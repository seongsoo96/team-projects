<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.side_list{
	position: absolute;
	top:35px;
	left:0;
	bottom: 0;
	border-top: 1px solid #ccc;
	width: 200px;
	height: 500px;
	font-size: 20px;
	line-height:0px;
}
.side_link{
	display: block;
	text-decoration:none;
	text-align:center;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	padding: 40px 0;
	border-bottom: 1px solid #ccc;
	
}
.background{
	background: #4EE2EC;
	color: #FFFFFF;
	
}
.title{
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	height: 60px;
}
.title > h3{
	margin-top: 0px;
}
</style>
    
<div class="side_list">
	<div class="title">
		<h3>${name }의<br>프로젝트 번호:${project.pNo}</h3>
	</div>
	<a href="#" class="side_link background">펀딩준비</a>
	<a href="#" class="side_link">새소식</a>
	<a href="#" class="side_link">오픈예정</a>
	<a href="#" class="side_link">서포터</a>
	<a href="#" class="side_link">펀딩현황</a>
</div>