<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script type="text/javascript" src="/resources/js/mainPage.js"></script>
<style type="text/css">
#realTimeRanking{


}
</style>

<script type="text/javascript">
$(document).ready(function() {
	setInterval(function() {
		$.ajax({
			type: "get"
			, url: "/user/rank/realtime"
			, dataType: "json"
			, data: {}
			, success: function(res){
				console.log("success")
				console.log(res);
				console.log(res.list[0].pNo);

				$("#rank1").attr("href","story?pNo="+res.list[0].pNo);
				$("#rank2").attr("href","story?pNo="+res.list[1].pNo);
				$("#rank3").attr("href","story?pNo="+res.list[2].pNo);
				$("#rank4").attr("href","story?pNo="+res.list[3].pNo);
				$("#rank5").attr("href","story?pNo="+res.list[4].pNo);
				$('#rank1').text(res.list[0].iTitle);
				$('#rank2').text(res.list[1].iTitle);
				$('#rank3').text(res.list[2].iTitle);
				$('#rank4').text(res.list[3].iTitle);
				$('#rank5').text(res.list[4].iTitle);
				$("#rank1").next().text(res.list[0].rate*100+"%")
				$("#rank2").next().text(res.list[1].rate*100+"%")
				$("#rank3").next().text(res.list[2].rate*100+"%")
				$("#rank4").next().text(res.list[3].rate*100+"%")
				$("#rank5").next().text(res.list[4].rate*100+"%")
				
			}
			, error: function() {
				console.log("error");
			}
		});
	}, 5000)
	
	
})
</script>
<script type="text/javascript">
function pagingSelect(pagingNumber) {
	$.ajax({
		
		type: "get"
		, url: "/main/ajax"
		, dataType: "html"
		, data: {
			curPage: pagingNumber
		}
		, success: function(res){
			console.log("success")
			console.log(pagingNumber)
			$("#targetAjax").html(res);
			
		}
		, error: function() {
			console.log("error");
		}
	});
}
</script>
<section>
<div id="wrapper-main">
      <div id="slider-wrap">
          <ul id="slider">
          	 <c:forEach items="${list2 }" var="info">
          	 <li class="text-center">
                <div>
                    <h3>${info.iTitle }</h3>
                    <span>${info.iCategory }</span>
                </div>  
				<c:choose>
				<c:when test = "${fn:contains(info.iStoredName, 'test') or fn:contains(info.iStoredName, 'search')}">
					<a href="/story?pNo=${info.pNo }"><img src="/resources/img/logo.png" style="width: 400px; height: 400px; margin: 0 auto;"></a>
				</c:when>
				<c:otherwise>
					<a href="/story?pNo=${info.pNo }"><img src="/upload/information/${info.iStoredName }"/></a>
				</c:otherwise>
			</c:choose>
             </li>
          	 </c:forEach>
          </ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <span id="moveProject" class="moveProject"><i class="fas fa-info-circle fa-2x"></i></span>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>     
      </div>
   </div>
</section>
<section id="wrapper-section">
<div id="targetAjax" class="left">
	<c:forEach items="${list }" var="info">
		<div>
			<c:choose>
				<c:when test = "${fn:contains(info.iStoredName, 'test') or fn:contains(info.iStoredName, 'search')}">
					<a href="/story?pNo=${info.pNo }"><img src="/resources/img/subLogo.png" style="width:200px; height:150px;"/></a>
				</c:when>
				<c:otherwise>
					<a href="/story?pNo=${info.pNo }"><img src="/upload/information/${info.iStoredName }" style="width:200px; height:150px;"/></a>
				</c:otherwise>
			</c:choose>
			<p>${info.iTitle }</p>
		</div>
	</c:forEach>
	
	<div id="pagination-wrap2">
			<ul>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
			<c:if test="${paging.curPage eq page }">
				<a onclick="pagingSelect(${page})"><li class="active"></li></a>
			</c:if>
			<c:if test="${paging.curPage ne page }">
				<a onclick="pagingSelect(${page})"><li></li></a>
			</c:if>
			</c:forEach>
            </ul>
    </div>
</div>
<div id="realTimeRanking" class="right">
	<h3>실시간 랭킹</h3>
	<ol>
		<li><a id="rank1" href="https://www.google.com/">랭킹 1</a><p>4231% 푸드</p></li>
		<li><a id="rank2" href="https://www.google.com/">랭킹 2</a><p>1231% 가전</p></li>
		<li><a id="rank3" href="https://www.google.com/">랭킹 3</a><p>331% 전기</p></li>
		<li><a id="rank4" href="https://www.google.com/">랭킹 4</a><p>231% 푸드</p></li>
		<li><a id="rank5" href="https://www.google.com/">랭킹 5</a><p>1111% 푸드</p></li>
	</ol>
</div>
	
</section>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
