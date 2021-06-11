<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(document).ready(function(){
	$(".commentss").click(function(){
		
		$(this).nextAll(".commentssregister").toggleClass("showcommentss")
		
	})
})
//대댓글등록하기
function registerss( element ){
	var c_No = $(element).attr("data-cNo");
	
// 	console.log("@@@@@@",c_No)
	
	$.ajax({
		type:"post"
		,url:"/user/board/commentss/insert"
		,data : {
			cNo : c_No
			, csContent : $(element).prev().val()
		}
		,dataType : "html"
		,success:function(){
			console.log("성공")
			$(element).prev().val("")
			listComment();
		}
		,error:function(){
			console.log("실패")
		}
	})
}
//대댓글삭제하기
function deletecommentss(element){
// 	var c_No = $(element).attr("data-cNo");
	var cs_No = $(element).attr("data-csNo");
	console.log("@@@@@@12s", cs_No)
	
	$("#comcsdelete").parent().parent().remove();
	$.ajax({
		type:"get"
		,url:"/user/board/commentss/delete"
		,data:{
			csNo : cs_No
		}
		,dataType : "html"
		,success:function(){
			console.log("성공")
			listComment();
		}
		,error:function(){
			console.log("실패")
		}
	})
}
//대댓글수정하기
function updatecommentss(element){
	
	var cs_No = $(element).attr("data-csNo");
	console.log("댓글수정하기",cs_No)
	
	$.ajax({
	   type:"post"
	  ,url:"/user/board/commentss/update"
	  ,data:{
		  csNo : cs_No
		  ,csContent:$("[data-commetnssNo='"+cs_No+"'] .commentss-txt textarea").val()
	  }
	  ,dataType : "json"	
	  ,success:function(){
		console.log("성공")
		listComment();
	  }	
	  ,error:function(){
		console.log("실패")
	  }	
	})
	
	
	
}

</script>
<style type="text/css">

.registerssaa{
  background: #4978f4;
  border-radius: 3px;
  border:none;
  color:#fff;
  letter-spacing: -.5px;
  line-height: 30px;
}
.showcommentss{
 display : none;
}
#cshidden{
 visibility : hidden;
}

</style>

 <c:forEach items="${commentList}" var="c">
  
  <div  data-commentNo="${c.C_NO }">
    <div><label id="hidden" name="commentNo" >${c.C_NO }</label></div>
     <label><div>${c.M_NICK }</div>
      <font size="2" color="lightgray"><fmt:formatDate value="${c.C_CREATE_DATE}" pattern="yy-MM-dd HH:mm:ss" /></font>
     </label>
    <label class="comment-txt">
    <c:if test="${sessionScope.mNo eq c.M_NO}">
     <textarea id="content" name="content" rows="4" cols="70" >${c.C_CONTENT }</textarea>
    </c:if>
    <c:if test="${sessionScope.mNo ne c.M_NO}">
     <textarea id="content" name="content" rows="4" cols="70" readonly="readonly" >${c.C_CONTENT }</textarea>
    </c:if>
    </label>
    <label class="pop-layer">
      <c:if test="${sessionScope.mNo eq c.M_NO}">
        <button id="comdelete"  class="btn btn-danger" onclick="deletecomment(${c.C_NO})" >삭제</button><br>
        <button id="comdeupdate"  class="btn btn-info" onclick="updatecomment(${c.C_NO})" >수정</button> 
      </c:if>
    </label>
   </div>
   
    <button  class="btn btn-link commentss">답글 작성</button><br><br>
    <div class="commentssregister showcommentss">
       <div><label>닉네임</label></div>
       <textarea id="commentsscontent" name="commentsscontent" row="4" cols="60" placeholder="내용을 작성하세요"></textarea>
       <button class="registerssaa" onclick="registerss(this)" data-cNo="${c.C_NO}">등록</button>
    </div>
    
    <c:forEach items="${commentsslist }" var="cs">
     
  <c:if test="${c.C_NO eq cs.C_NO}">
      
   <div data-commetnssNo ="${cs.CS_NO}">
    <div><label>${cs.M_NICK}</label></div>
     <label class="commentss-txt">
       <c:if test="${cs.M_NO eq sessionScope.mNo }">
     	<textarea class="cscontent" >${cs.CS_CONTENT }</textarea>
       </c:if>
       <c:if test="${cs.M_NO ne sessionScope.mNo }">
         <div class="cscontent" >${cs.CS_CONTENT }</div>
       </c:if>
     </label>	
     	<c:if test="${cs.M_NO eq sessionScope.mNo }">
	     	<button id="comcsdelete"  class="btn btn-danger" onclick="deletecommentss(this)" data-csNo="${cs.CS_NO}">삭제</button>
        	<button id="comsupdate"  class="btn btn-info comcsdeupdate" onclick="updatecommentss(this)"  data-csNo="${cs.CS_NO}">수정</button> 
        </c:if>
   </div> 
  </c:if>
     
    
   </c:forEach>

   
 </c:forEach>
