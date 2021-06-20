<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script type="text/javascript" src="/resources/js/mainPage.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	var $div=$("#realTimeRanking").children("ol");
	
	console.log($div);
	$div.empty();
	
	$.ajax({
		type: "get"
		, url: "/user/rank/realtime"
		, dataType: "json"
		, data: {}
		, success: function(res){
			console.log("success")
			console.log(res);
			console.log(res.list[0].pNo);
			console.log(res.list.length);
			
			console.log("SUCCESS : ", $div);
			var $div=$("#realTimeRanking").children("ol");
			$div.empty();
			
			for (var i = res.list.length-1; 0 <= i; i--) {
				var $li=$("<li>", {css:{ 
					hegiht:"80px"},
					});
				var $a=$("<a>");
				$a.text(res.list[i].iTitle);
				var $p=$("<p>")
				$p.text(res.list[i].rate*100+"%")
				$a.attr("href","story?pNo="+res.list[i].pNo);
				
				$li.append($a);
				$li.append($p);
				
				
				/* $li.animate({
					"padding-top" : "20px",
	 				  }, 1500 ); */
	 			
				$div.append($li);
				
			}
			$( "#mover" ).slideToggle( "slow");
			$( "#mover" ).slideToggle( "slow");
		}
		, error: function() {
			console.log("error");
		}
	});
	
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
				console.log(res.list.length);
				
				console.log("SUCCESS : ", $div);
				var $div=$("#realTimeRanking").children("ol");
				$div.empty();
				
				for (var i = res.list.length-1; 0 <= i; i--) {
					var $li=$("<li>", {css:{ 
						hegiht:"80px"},
						});
					var $a=$("<a>");
					$a.text(res.list[i].iTitle);
					var $p=$("<p>")
					$p.text(res.list[i].rate*100+"%")
					$a.attr("href","story?pNo="+res.list[i].pNo);
					
					$li.append($a);
					$li.append($p);
					
					
					/* $li.animate({
						"padding-top" : "20px",
		 				  }, 1500 ); */
		 			
					$div.append($li);
					
				}
				$( "#mover" ).slideToggle( "slow");
				$( "#mover" ).slideToggle( "slow");
			}
			, error: function() {
				console.log("error");
			}
		});
	}, 60000)
	
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
				<c:when test = "${fn:length(info.iStoredName) < 20}">
					<a href="/story?pNo=${info.pNo }"><img src="/resources/img/${info.iStoredName }" style="width: 460px; height: 350px; margin: 0 auto;"></a>
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
				<c:when test = "${fn:length(info.iStoredName) < 20}">
					<a href="/story?pNo=${info.pNo }"><img src="/resources/img/${info.iStoredName }" style="width:200px; height:150px;"/></a>
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
	<ol id="mover">
		<li><a id="rank1" href="https://www.google.com/">랭킹 1</a><p>4231% 푸드</p></li>
		<li><a id="rank2" href="https://www.google.com/">랭킹 2</a><p>1231% 가전</p></li>
		<li><a id="rank3" href="https://www.google.com/">랭킹 3</a><p>331% 전기</p></li>
		<li><a id="rank4" href="https://www.google.com/">랭킹 4</a><p>231% 푸드</p></li>
		<li><a id="rank5" href="https://www.google.com/">랭킹 5</a><p>1111% 푸드</p></li>
	</ol>
</div>
	
</section>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
