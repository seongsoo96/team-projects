<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/><br>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	//목록가기
  $("#btnList").click(function(){
	  $(location).attr("href","/user/board/list")
  })
  
  //수정하기
  $("#btnUpdate").click(function(){
	  $(location).attr("href","/user/board/update?bNo=" + ${detail.B_NO} )
  })	
  //삭제하기		
  $("#btnDelete").click(function(){
	  $(location).attr("href","/user/board/delete?bNo=" + ${detail.B_NO})
  })
  //추천하기
  $("#btnrecommend").click(function(){
	  $.ajax({
     	 type: "get"//요청 메소드
         ,url:"/user/board/recommend"//요청 URL
 	    ,data: {
 	    	 bNo : ${detail.B_NO }
 	    }//요청파라미터
 	    ,dateType: "json"//응답받은 데이터의 형식
 	    ,success:function(res){//AJAX성공 시 콜백함수
 	    	console.log("성공")
 	        console.log(res)//응답 데이터 확인s
 	    	
 	    	if(res.result){//추천 성공
 	    	  $("#btnrecommend").removeClass("btn-primary")
 	    	                    .addClass("btn-warning")
 	    	                    .html("추천 취소")
 	    	}else{
 	    		$("#btnrecommend").removeClass("btn-warning")
 	    		                  .addClass("btn-primary")
 	    		                  .html("추천")
 	    	}
 	      //추천수 적용
 	      $("#recommend").html(res.cnt);
 	    }
 	     ,error:function(){//AJAX 실패 시 콜백함수
 	    	 console.log("실패")
 	     }
 	 }) <!--end $.ajax -->
  })<!--$("#btnrecommend").click(function() -->
    
	  
	  //댓글 등록하기
	  $("#register").click(function(){
		 
		  $("#show").show()
		
		  $.ajax({
			 type: "post"
			 ,url:"/user/board/comments/insert"
		    ,data:{
		    	bNo : ${detail.B_NO }
		    	,cContent : $("#content").val()
		    }
			,dataType: "html"
		    ,success:function(res){
		    	console.log("성공")
		    	$("#registerComment textarea[name='content']").val("")
				listComment();
		    }	
			,error:function(res){
				console.log("실패")	
			}  
		  })<!--end $.ajax -->
		  
	  })<!-- end  $("register").click(function()-->
	
      //댓글 펼치기
	  $("#fold").click(function(){
		  listComment();
		  $("#show").toggle()
	  })
	  

})<!--$(document).ready(function() -->

//댓글 리스트 불러오기
function listComment() {
	
	 $.ajax({ 
		 type : "get"
		,url : "/user/board/comments/list"
		,data : {
			bNo : ${detail.B_NO}
		}
		,dataType: "html"
		,success:function(res){
			console.log("성공")
			console.log("성공@@@@@@@@@@@@@@@@@", res)
			$("#show").html(res)
		}
		,error:function(error,request,status){
			console.log("실패")
			console.log(error)
			console.log(request.status)
		} 
	 })<!--end  $.ajax-->
}

//댓글 삭제
function deletecomment(cNo){
	 
	
// 	console.log("#####",cNo);
	$("#comdelete").parent().parent().remove();
	 $.ajax({ 
		 type : "get"
		,url : "/user/board/comments/delete"
		,data : {
			"cNo" : cNo
		}
		,dataType: "json"
		,success:function(){
			console.log("성공")
			listComment();
		}
		,error:function(){
			console.log("실패")
		} 
	 })<!--end  $.ajax-->
}<!--end function deletecomment(cNo)-->
//댓글 수정하기
 function updatecomment(c_no){
	
	$.ajax({
		type: "post"
       ,url:"/user/board/comments/update"		
	   ,data : {
		    cNo : c_no
			,cContent:$("[data-commentNo='"+c_no+"'] .comment-txt textarea").val()
	   }	
	   ,dataType: "json"	
	   ,success:function(res){
		   listComment();
	   }
	   ,error:function(){
		   console.log("실패")
	   }
	})
}
  
</script>
<style type="text/css">
#show{
  display: none;
}

.imgfile{
width:300px;
hegiht:300px;
}
#hidden{
  visibility : hidden;
}
#register{
  background: #4978f4;
  border-radius: 3px;
  border:none;
  color:#fff;
  letter-spacing: -.5px;
  line-height: 30px;
}

</style>

<div class="container">
<h1>게시판 상세보기</h1>
<hr>

<table class="table table-striped table-hover">

<tr><td class="info">제목</td><td colspan="3" >${detail.B_TITLE}</td></tr>
<tr><td class="info">닉네임</td><td colspan="3">${detail.M_NICK }</td></tr>
<tr>
<td class="info">조회수</td><td colspan="3">${detail.B_HIT}</td>
<td class="info">추천수</td><td><div id="recommend" colspan="4">${detail.RECOMMEND_CNT}</div><td colspan="4"><button id="btnrecommend" class="btn btn-warning">추천</button></td>
</tr>
<tr><td class="info">작성일</td><td colspan="3"><fmt:formatDate value="${detail.B_CREATE_DATE}" pattern="yy-MM-dd HH:mm:ss"/></td></tr>
<tr><td class="info" colspan="4">내용</td></tr>
<tr><td colspan="4">${detail.B_CONTENT}</td></tr>

</table>

<c:if test="${not empty viewfile}">
<img src="/resources/upload/${viewfile.bfStoredName}" class="imgfile"><br><br>
<a href="/user/board/download?bfFileno=${viewfile.bfFileno }">${viewfile.bfOriginName }</a>
</c:if>
<c:if test="${empty viewfile}">
</c:if>


<div class="text-center">
 <button id="btnList" class="btn btn-primary">목록</button>
 <c:if test="${mNick eq detail.M_NICK }">
 <button id="btnUpdate" class="btn btn-info">수정</button>
 <button id="btnDelete" class="btn btn-danger">삭제</button>
 </c:if>
</div><hr><br>	

<c:if test="${not empty mNick }">
<table id="registerComment">
<tr>
 <td width="150">${mNick }</td>
 <td width="550"><textarea id="content" name="content" rows="4" cols="70" placeholder="내용을 작성하세요"></textarea></td>
 <td><button id="register">등록하기</button></td>
</tr>
</table><br><br>
</c:if>	
<c:if test="${empty mNick }">
<a href="/user/member/loginForm"><div>로그인 후 댓글 달기가 가능합니다</div></a>
</c:if><br><br>

<button class="btn btn-primary" id="fold" >댓글 펼치기</button> <br><br>

<div id="show">

</div>


</div><!-- end class="container"  -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>