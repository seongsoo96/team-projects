<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="requstUri" value="${requestScope['javax.servlet.forward.request_uri']}"></c:set> 
<c:set var="uri" value="${fn:split(requstUri,'/')}"></c:set>
<script type="text/javascript">
$(document).ready(function() {
	<c:forEach var="info" items="${uri }" varStatus="url">
	console.log("${info }");
	console.log("${url.count}");
	<c:if test="${url.count eq 3 }">
		<c:choose>
			<c:when test="${info eq 'requirement'}">$( '#requirement' ).addClass( 'active' )</c:when>
			<c:when test="${info eq 'information'}">$( '#information' ).addClass( 'active' )</c:when>
			<c:when test="${info eq 'story'}">$( '#story' ).addClass( 'active' )</c:when>
			<c:when test="${info eq 'reward'}">$( '#reward' ).addClass( 'active' )</c:when>
			<c:when test="${info eq 'maker'}">$( '#maker' ).addClass( 'active' )</c:when>
			<c:when test="${info eq 'alarm'}">$( '#alarm' ).addClass( 'active' )</c:when>
		</c:choose>
	</c:if>
</c:forEach>
});
</script>

<style type="text/css">
#pagination-wrap2{
  min-width:20px;
  margin-left: auto; 
  margin-right: auto;
  height:15px;
  position:relative;
  text-align:center;
}

#pagination-wrap2 ul {
  width:100%;
}

#pagination-wrap2 ul li{
  margin: 0 20px;
  display: inline-block;
  width:20px;
  height:15px;
  border-radius:50%;
  background:#4EE2EC;
  opacity:0.5;
  position:relative;
  top:0;
  cursor:pointer;
}

#pagination-wrap2 ul li.active{
  width:30px;
  height:20px;
  top:3px;
  opacity:1;
  box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}
</style>
    
<div id="pagination-wrap2">
		<ul>
			<a href="/admin/open/requirement?pNo=${project.pNo }"><li id="requirement"></li></a>
			<a href="/admin/open/information?pNo=${project.pNo }"><li id="information"></li></a>
			<a href="/admin/open/story?pNo=${project.pNo }"><li id="story"></li></a>
			<a href="/admin/open/reward?pNo=${project.pNo }"><li id="reward"></li></a>
			<a href="/admin/open/maker?pNo=${project.pNo }"><li id="maker"></li></a>
			<a href="/admin/open/alarm?pNo=${project.pNo }"><li id="alarm"></li></a>
	     </ul>
</div>