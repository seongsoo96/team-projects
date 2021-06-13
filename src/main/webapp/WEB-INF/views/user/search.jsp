<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<link rel="stylesheet" href="/resources/css/search.css">

<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<!-- <link rel="stylesheet" href="jqueryui/style.css"> -->


<script>
$(function() {
  $( "#slider-range1" ).slider({
    range: true,
    min: 0,
    max: 10000,
    values: [ 0, 10000 ],
    slide: function( event, ui ) {
      $( "#amount1" ).val( ui.values[ 0 ] + "%" + " - " + ui.values[ 1 ] + "%");
    }
  });
  $( "#amount1" ).val(  $( "#slider-range1" ).slider( "values", 0 ) + "%" +
    " - " + $( "#slider-range1" ).slider( "values", 1 ) + "%" );
});

$(function() {
  $( "#slider-range2" ).slider({
    range: true,
    min: 0,
    max: 1000000,
    values: [ 0, 1000000 ],
    slide: function( event, ui ) {
      $( "#amount2" ).val( ui.values[ 0 ] + "원 - " + ui.values[ 1 ] + "원" );
    }
  });
  $( "#amount2" ).val( $( "#slider-range2" ).slider( "values", 0 ) +
    "원 - " + $( "#slider-range2" ).slider( "values", 1 ) + "원" );
});


</script>


<script type="text/javascript">
$(document).ready(function() {
	
	
	//필터 클릭
	$(".filterbtn").click(function(){
// 		$(this).toggleClass('filter_clicked')
		
		if($(this).hasClass('filter_clicked')==false){
			$(this).addClass('filter_clicked')
			$(this).css('border-color', '#00c4c4')
			$(this).next().prop("checked", true)
			
			//모달 필터 리스트 추가
			$(".modal_filter_list").append(
				$('<div class="filtered_item">' 
						+ $(this).text()
						+ '<button class="item_remove_btn">'
							+ '<i class="icon close">X</i>'
						+ '</button>'	
				+ '</div>')
			)
		} else {
			$(this).removeClass('filter_clicked')
			$(this).next().prop("checked", false)
			$(this).css('border-color', '#fff')
			
			//모달 필터 리스트 제거
			$('div[class="filtered_item"]:contains("' + $(this).text() + '")').remove()
		}
		
		//모달 필터 리스트 X 클릭
		$('.item_remove_btn').click(function(){
			console.log("클릭")
			
			var filter = $(this).parent().text().slice(0, -1)
			console.log(filter)
			
			$('div[class="filtered_item"]:contains("' + filter + '")').remove()
			$('button:contains("' + filter + '")').next().prop("checked", false)
			$('button:contains("' + filter + '")').css('border-color', '#fff')
			$('button:contains("' + filter + '")').removeClass('filter_clicked')

		})
		
		
	})
	
	//필터 초기화
	$('#reset').click(function(){
		$('.filterbtn').removeClass('filter_clicked')
		$('.filterbtn').next().prop("checked", false)
		$('.filterbtn').css('border-color', '#fff')
		$(".modal_filter_list").empty()
		
		
	})
	
	//필터 적용하기
	$("#submit").click(function() {
		console.log("-------------필터 적용하기-----------------")
		console.log("------------------------------------------")
		console.log( "달성률 min : " + $( "#slider-range1" ).slider( "values", 0 ) );
		console.log( "달성률 max : " + $( "#slider-range1" ).slider( "values", 1 ) );
		console.log( "달성금액 min : " + $( "#slider-range2" ).slider( "values", 0 ) );
		console.log( "달성금액 max : " + $( "#slider-range2" ).slider( "values", 1 ) );
		
		var cp = 0
		
		$('.SearchList_result_wrap').empty();
		filterSubmit(cp);
		$('.SearchBox_shadow').addClass('hidden')
		
// 		var arrList = $('.filtered_item').get()
		
		//검색메인창 필터리스트 추가		
		var arrText = [];
		$(".filtered_item").each(function(idx){
			arrText[idx] = $(".filtered_item:eq(" + idx + ")").text().slice(0, -1)
		});
		
 		$(".filter_list").empty();
		for(var i=0; i<arrText.length; i++){
			$(".filter_list").append(
				$('<div class="filter_item">' 
						+ arrText[i]
						+ '<button class="filter_remove_btn"><i class="icon close">X</i></button>'	
				+ '</div>')
			)	
		}
		
		//검색메인창 필터리스트 삭제
		$(".filter_remove_btn").click(function(){
			console.log("클릭")
			
			var filter = $(this).parent().text().slice(0, -1)
			console.log(filter)
			
			$('div[class="filtered_item"]:contains("' + filter + '")').remove()
			$('div[class="filter_item"]:contains("' + filter + '")').remove()
			$('button:contains("' + filter + '")').next().prop("checked", false)
			$('button:contains("' + filter + '")').css('border-color', '#fff')
			$('button:contains("' + filter + '")').removeClass('filter_clicked')

			
			
			var cp = 0;
			$('.SearchList_result_wrap').empty();
			filterSubmit(cp);
		})
		
	})

	
	//필터 모달 열기
	$(".filter_open").click(function(){
		$(".SearchBox_shadow").removeClass("hidden");
	})
	
	//필터 모달 닫기
	$(".filter_close").click(function(){
		$(".SearchBox_shadow").addClass("hidden");
	})
	
	
})



var curPage=1
var totalPage = '${paging.totalPage}';
var totalCount = '${paging.totalCount}';
var keyword = '${param.keyword}';
var cnt = 9

function filterSubmit(cp){
// 	$("input[name='category']").change(function() {
		console.log("-------filterSubmit()----------")
		console.log("--------------------------------")
		console.log("전역변수 curPage : " + curPage)
		console.log("매개변수 cp : " + cp)
		
		//펀딩단계 필터
		var $step = $("input:checkbox[name='step']:checked");
		var map = $step.map(function() {
			return $(this).val();
		})
		var step = map.get().join(',');
		console.log("step : " + step);
		
		
		//펀딩 카테고리 필터
		var $category = $("input:checkbox[name='category']:checked");
		var map = $category.map(function() {
		   return $(this).val();
		});
		var category = map.get().join(",");
		console.log("values : " + category);
		
		var keyword = '${keyword}'
		var s1min = $( "#slider-range1" ).slider( "values", 0 )
		var s1max = $( "#slider-range1" ).slider( "values", 1 )
		var s2min = $( "#slider-range2" ).slider( "values", 0 )
		var s2max = $( "#slider-range2" ).slider( "values", 1 )
		
		if (cp === "" || cp === undefined || cp === null){
		//더보기만 눌렀을때
			console.log("더보기 누름")
			console.log("더보기만 눌렀을때 전역변수 curPage : " + curPage)
			
			if(curPage < 2 ){
				curPage++
			}
			
			var nextPage = curPage
			console.log("더보기만 눌렀을때 nextPage : " + nextPage)
			viewMore(nextPage, keyword, step, category, s1min, s1max, s2min, s2max)
		} else { 
		//필터 적용하기 눌렀을때 curPage는 무조건 0시작
			console.log("더보기 버튼 활성화")
			$('#btnViewMore').prop("disabled", false)
			console.log("필터 적용하기 누름")
			console.log("필터 적용 눌렀을때 전역변수 curPage : " + curPage)
			firstPage = 0
			console.log("필터 적용 눌렀을때 firstPage : " + firstPage)
			viewMore(firstPage, keyword, step, category, s1min, s1max, s2min, s2max)
		}
}


// function viewMore(curPage, keyword, step, category, s1min, s1max, s2min, s2max){
function viewMore(cp, keyword, step, category, s1min, s1max, s2min, s2max){
	console.log("-----------------viewMore-------------------")
	console.log("viewMore의 매개변수 cp : " + cp)
	
	//전역변수에 cp대입
	curPage = cp
	
	console.log("전역변수 curPage에 매개변수 cp 대입 : " + curPage)
	
	
	
	console.log("------------------------------------------")
		if(curPage>totalPage) {
			return false
		} else {
// 			curPage++
		}
// 	console.log("파라미터 curPage : " + curPage)
// 	console.log("파라미터 keyword : " + keyword)
// 	console.log("파라미터 step : " + step)
// 	console.log("파라미터 category : " + category)
// 	console.log("파라미터 s1min : " + s1min)
// 	console.log("파라미터 s1max : " + s1max)
// 	console.log("파라미터 s2min : " + s2min)
// 	console.log("파라미터 s2max : " + s2max)
		console.log("ajax 실행할 때 curPage : " + curPage)
		$.ajax({
			type: "get"
			, url: "/search/more"
			, data: {
				"curPage" : curPage,
				"keyword" : keyword,
				"step" : step,
				"category" : category,
				"s1min" : s1min,
				"s1max" : s1max,
				"s2min" : s2min,
				"s2max" : s2max,
			}
			, dataType: "html"
			, success: function(res){
				console.log("성공")
				
				console.log("---------searchMore.jsp 시작-------")
				//더보기 리스트 추가
				$('.SearchList_result_wrap').append(res)
				
// 				console.log("필터 적용 눌렀을때 대입 전 totalCount : " + totalCount)
				$('.totalCount').text(totalCount)
				
				//현재 페이지가 1일때
				if(curPage < 2){
					$('.listCount').text(listCount)
				}
				
				//listCount가 totalCount보다 작을때
				if(cnt < totalCount) {
// 					$('#btnViewMore').prop("disabled", false)
					$('.listCount').text(cnt)
					curPage++
				
				//listCount가 totalCount보다 클때	
				} else {
					$('.listCount').text(totalCount)
					console.log("더보기 버튼 비활성화")
					$('#btnViewMore').prop("disabled", true)
				}
				
			}
			, error: function(){
				console.log("error")
			}
		})
	
}



</script>

<div class="container">
	
	<div class="SearchBox_wrap">
		<div class="SearchBox_inner">
			<div class="clearfix"></div>
			<div class="SearchBox_title h1">${keyword } <span>검색결과</span></div>
			
			<div class="SearchBox_filter_area">
				<div class="button_wrap">
					<button class="filter_open">
						<i class="icon"></i>
						필터
					</button>
				</div>
				<div class="filter_list"></div>
			</div><!-- .SearchBox_filter_area -->
		</div><!-- .SearchBox_inner -->
		<div class="SearchBox_shadow hidden"><!-- hidden 추가할것 -->
			<div class="filter_modal">
				<div class="filter_modal_header">
					<div class="modal_close_btn_wrap">
						<span>필터</span>
						<button class="filter_close"><i class="icon close">X</i></button>
					</div>
					<div class="modal_filter_list"></div>
				</div>
			<hr>
			<div class="filter_modal_content">
				<div class="filter_box">
					<p>펀딩단계</p>			
					<ul id="#filter_step">
						<li>
							<button class="filterbtn">오픈예정</button>
							<input type="checkbox" name="step" value="a" />
						</li>
						<li>
							<button class="filterbtn">펀딩진행중</button>
							<input type="checkbox" name="step" value="b" />
						</li>
						<li>
							<button class="filterbtn">펀딩종료</button>
							<input type="checkbox" name="step" value="c" />
						</li>
					</ul>
					<hr>
					
					
					<p>카테고리</p>
					<ul id="#filter_category">
						<li>
							<button class="filterbtn">테크・가전</button>
							<input type="checkbox" name="category" value="'테크/가전'" class="" />
						</li>
						<li>
							<button class="filterbtn">반려동물</button>
							<input type="checkbox" name="category" value="'반려동물'" class="" />
						</li>
						<li>
							<button class="filterbtn">출판</button>
							<input type="checkbox" name="category" value="'출판'" class="" />
						</li>
						<li>
							<button class="filterbtn">기부・후원</button>
							<input type="checkbox" name="category" value="'기부/후원'" class="" />
						</li>
						<li>
							<button class="filterbtn">푸드</button>
							<input type="checkbox" name="category" value="'푸드'" class="" />
						</li>
						<li>
							<button class="filterbtn">운동</button>
							<input type="checkbox" name="category" value="'운동'" class="" />
						</li>
						<li>
							<button class="filterbtn">여행</button>
							<input type="checkbox" name="category" value="'여행'" class="" />
						</li>
						<li>
							<button class="filterbtn">뷰티</button>
							<input type="checkbox" name="category" value="'뷰티'" class="" />
						</li>
						<li>
							<button class="filterbtn">패션</button>
							<input type="checkbox" name="category" value="'패션'" class="" />
						</li>
						<li>
							<button class="filterbtn">디자인소품</button>
							<input type="checkbox" name="category" value="'디자인소품'" class="" />
						</li>
					</ul><!-- #filter_category -->
				</div><!-- .filter_box -->
					
				<div class="slider_wrap">
					<div class="slider_box">
						<p>달성률</p>
						<input type="text" id="amount1" style="border:0; color:#f6931f; font-weight:bold;">
						<div id="slider-range1"></div>
					<hr>
						<p>달성금액</p>
						<input type="text" id="amount2" style="border:0; color:#f6931f; font-weight:bold;">
						<div id="slider-range2"></div>
					</div>
				</div><!-- .slider_wrap -->
				<hr>
			</div><!-- .filter_modal_content -->
				<div class="filter_modal_footer">
					<button id="reset" class="reset btn">초기화</button>
					<button id="submit" class="submit btn">적용하기</button>
				</div>
			</div><!-- .filter_modal -->
		</div><!-- .SearchBox_shadow -->
	</div><!-- .SearchBox_wrap -->
	
	<hr>

	<div class="SearchList_wrap">
		<div class="SearchList">
			<p>프로젝트 <span class="totalCount">${paging.totalCount }</span>개</p>
			<div class="SearchList_result_wrap">
				<c:forEach items="${searchList }" var="list">
					<div class="SearchList_result_project">
						<a href="/story?pNo=${list.P_NO }">
							<img class="project_img" alt="테스트" src="/resources/img/${list.I_STORED_NAME }"><!-- ${list.I_STORED_NAME } -->
							<p>
								<strong class="project_title">${list.P_NAME }</strong>
								<small class="project_info">
									<span>${list.I_CATEGORY }</span>
									<span>${list.M_NO }</span>
								</small>
							</p>
						</a>
						
						<c:set var="now" value="<%=new java.util.Date() %>" />
						<c:set var="today"><fmt:formatDate value="${now}" pattern="yy-MM-dd" /></c:set>
						<c:set var="start_date"><fmt:formatDate value="${list.I_START_DATE }" pattern="yy-MM-dd" /></c:set>
						<c:set var="end_date"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></c:set>
						<fmt:parseDate value="${today }" var="todayDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${todayDate.time / (1000*60*60*24)}" integerOnly="true" var="tDate"></fmt:parseNumber>
						<fmt:parseDate value="${start_date }" var="strPlanDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="sDate"></fmt:parseNumber>
						<fmt:parseDate value="${end_date }" var="endPlanDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="eDate"></fmt:parseNumber>
						
						<c:choose>
							<c:when test="${start_date <= today && end_date >= today }">
								<div class="project_status_wrap">
									<div class="goal_bar"><span style="width:${list.FUNDED_PERCENT }% "></span></div>
									<div class="project_status_info">
										<div class="project_status_info_box">
											<strong class="project_funded_percent">${list.FUNDED_PERCENT }%</strong>
											<em class="project_funded_money">${list.FUNDED_MONEY }원</em>
										</div>
<%-- 										<em class="project_deadline"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></em> --%>
										<em class="project_deadline">${eDate - tDate }일 남음</em>
									</div>
								</div>
							</c:when>
							<c:when test="${start_date > today }">
								<div class="project_status_wrap_comingsoon">
									<fmt:formatDate value="${list.I_START_DATE }" pattern="MM" />/<fmt:formatDate value="${list.I_START_DATE }" pattern="dd" />(<fmt:formatDate value="${list.I_START_DATE }" pattern="E" />)
									<fmt:formatDate value="${list.I_START_DATE }" pattern="HH" />시<fmt:formatDate value="${list.I_START_DATE }" pattern="dd" />분
									오픈예정
								</div>
							</c:when>
							<c:when test="${end_date < today }">
								<div class="project_status_wrap">
									<div class="goal_bar"><span style="width:${list.FUNDED_PERCENT }% "></span></div>
									<div class="project_status_info">
										<div class="project_status_info_box">
											<strong class="project_funded_percent">${list.FUNDED_PERCENT }%</strong>
											<em class="project_funded_money">${list.FUNDED_MONEY }원</em>
										</div>
										<c:if test="${list.FUNDED_PERCENT >= 100 }">
											<em class="project_deadline">종료</em>
											<em class="project_success">성공</em>
										</c:if>
										<c:if test="${list.FUNDED_PERCENT < 100 }">
											<em class="project_deadline">종료</em>
											<em class="project_success">실패</em>
										</c:if>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
				</c:forEach>
			</div><!-- .SearchList_result_wrap -->
			
			<c:choose>
				<c:when test="${paging.totalCount < 9 }">
					<button id="btnViewMore" type="button" disabled="disabled" class="view_more button less" onclick="viewMore(${paging.curPage}, '${keyword }')">
						더보기
						<em>${paging.totalCount }/${paging.totalCount }</em>
						<i class="icon expand_more"></i>
					</button>
				</c:when>
				<c:otherwise>
					<button id="btnViewMore" type="button" class="view_more button less" onclick="filterSubmit()">
						더보기
						<em class="listCount">9</em>
						<em>/</em>
						<em class="totalCount">${paging.totalCount }</em>
						<i class="icon expand_more"></i>
					</button>
				</c:otherwise>
			</c:choose>
			
		</div><!-- .SearchList -->
	</div><!-- .SearchList_wrap -->
</div>

				


<c:import url="/WEB-INF/views/layout/footer.jsp"/>
