<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:forEach items="${cmtlist}" var="c">
  
  <tr>
    <td width="150"><div name="commentNo">${c.cNo }</div></td><br>
    <td width="150">
     <div>${detail.M_NICK }<br>
      <font size="2" color="lightgray"><fmt:formatDate value="${c.cCreateDate }" pattern="yy-MM-dd HH:mm:ss" /></font>
     </div>
    </td>
    <td width="550"><div id="content" name="content">${c.cContent }</div></td>
    <td>
      <c:if test="${sessionScope.mNo eq c.mNo }">
        <button id="comdelete"  >취소</button><br>
        <button id="comdeupdate" onclick="updatecomment(${c.cNo})" >수정</button> 
      </c:if>
    </td>
  </tr>

 </c:forEach>