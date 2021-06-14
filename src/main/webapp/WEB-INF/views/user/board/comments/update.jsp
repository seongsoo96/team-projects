<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#hidden{
  visibility : hidden;
}

</style>

  <div id="update">
 <c:forEach items="${updatecomtlist}" var="c">
  
    <label id="hidden" name="commentNo" >${c.C_NO }</label>
     <label>${c.M_NICK }
      <font size="2" color="lightgray"><fmt:formatDate value="${c.C_CREATE_DATE}" pattern="yy-MM-dd HH:mm:ss" /></font>
     </label>
    <label class="comment-txt">
    <textarea id="content" name="content" rows="4" cols="70">${c.C_CONTENT }</textarea>
    </label>
    <label class="pop-layer">
      <c:if test="${sessionScope.mNo eq c.M_NO}">
        <button id="comdelete"  onclick="deletecomment(${c.C_NO})" >삭제</button><br>
        <button id="comdeupdate" onclick="updatecomment(${c.C_NO})" >수정</button> 
      </c:if>
    </label>
 </c:forEach>
  </div>