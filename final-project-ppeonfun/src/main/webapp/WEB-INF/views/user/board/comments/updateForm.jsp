<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <script type="text/javascript">
 $(document).ready(function(){
	$("#comcancel").click(function(){
		  $(location).attr("href","/user/board/view")
	}) 
	 
 })
 
 </script>
 
 <style type="text/css">
 #textarea{
   width: 550px;
 }
 #beforecontent{
   border : 1px solid ;
   width:584px;
   height: 87px;
 }
 #hidden{
  visibility : hidden;
}
 </style>
    
<c:forEach items="${cmtlist}" var="c">
	  <div id="updateform${c.C_NO }">
	 	<c:if test="${c.C_NO eq cNo }">
		 <div>
    <label id="hidden" name="commentNo" >${c.C_NO }</label>
     <label>${c.M_NICK }
      <font size="2" color="lightgray"><fmt:formatDate value="${c.C_CREATE_DATE}" pattern="yy-MM-dd HH:mm:ss" /></font>
     </label>
    <label class="comment-txt">
    <textarea id="content" name="content" rows="4" cols="70">${c.C_CONTENT }</textarea>
    </label>
    <label class="pop-layer">
      <c:if test="${sessionScope.mNo eq c.M_NO}">
        <button id="comcancel">취소</button><br>
        <button id="comdeupdate" onclick="afterupdatecomment(${c.C_NO})" >수정</button> 
      </c:if>
    </label>
  </div>
		 </c:if>
	<c:if test="${c.C_NO ne cNo }">
		<div>
    <label id="hidden" name="commentNo" >${c.C_NO }</label>
     <label>${c.M_NICK }
      <font size="2" color="lightgray"><fmt:formatDate value="${c.C_CREATE_DATE}" pattern="yy-MM-dd HH:mm:ss" /></font>
     </label>
    <label id="beforecontent" name="content">${c.C_CONTENT }</label>
  </div>
	</c:if>
	  </div> 
 </c:forEach>