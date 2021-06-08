<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<link rel="stylesheet" href="/resources/css/search.css">


<script type="text/javascript">


var cnt = 9
function viewMore(cp, k){
// 	console.log("더보기 버튼 클릭")
// 	console.log("파라미터 curPage : " + cp)
// 	console.log("파라미터 keyword : " + k)
	
		$.ajax({
			type: "get"
			, url: "/search/more"
			, data: {
				"curPage" : cp+1,
				"keyword" : k
			}
			, dataType: "html"
			, success: function(res){
				console.log("성공")
				console.log(res.searchList)
				$('.SearchList').append(res)
				
				cnt = cnt + 9
// 				console.log("cnt : " + cnt)
// 				console.log("${paging.totalCount} : " + ${paging.totalCount} )
// 				console.log("cnt + 1 : " + cnt+1)
				var totalCount = ${paging.totalCount}
				
				if(cnt < totalCount) {
					$('.listCount').text(cnt)
					$('#btnViewMore').remove()
				} else {
					$('#btnViewMore').remove()
					$('.listCount').text(totalCount)
					$('#btnViewMore').prop("disabled", true)
				}

				
			}
			, error: function(){
				console.log("error")
			}
		})
	
}

$(document).ready(function() {
	
	//카테고리 필터 클릭
	$(".filterbtn").click(function(){
		$(this).toggleClass('filter_clicked')
		
		if($(this).hasClass('filter_clicked')){
			$(this).css('border-color', '#00c4c4')
			$(this).next().prop("checked", true)
		} else {
			$(this).next().prop("checked", false)
			$(this).css('border-color', '#fff')
		}
	})
	
	//필터 초기화
	$('#reset').click(function(){
		$('.filterbtn').removeClass('filter_clicked')
		
		if($('.filterbtn').hasClass('filter_clicked')){
			$('.filterbtn').css('border-color', '#00c4c4')
		} else {
			$('.filterbtn').css('border-color', '#fff')
		}
	})
	
	//필터 적용하기
	$('#submit').click(function(){
		
	})
	
	
	//필터 모달 열기
	$(".filter_open").click(function(){
		$(".SearchBox_shadow").removeClass("hidden");
	})
	
	//필터 모달 닫기
	$(".filter_close").click(function(){
		$(".SearchBox_shadow").addClass("hidden");
	})
	
	
// 	//더보기 클릭
// 	$("#btnViewMore").click(function(){
// 		console.log("더보기 버튼 클릭")
		

// 	})
	
})
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
						"필터"
					</button>
				</div>
				<div class="filter_list">
					<div class="filter_item">
						"달성률 25%~100%"
						<button>x</button>
					</div>
					<div class="filter_item">
						"달성률 25%~100%"
						<button>X</button>
					</div>
					<div class="filter_item">
						"달성률 25%~100%"
						<button>x</button>
					</div>
				</div>
			</div><!-- .SearchBox_filter_area -->
		</div><!-- .SearchBox_inner -->
		<div class="SearchBox_shadow h"><!-- hidden 추가할것 -->
			<div class="filter_modal">
				<div class="filter_modal_header">
					<div class="modal_close_btn_wrap">
						<span>필터</span>
						<button class="filter_close"><i class="icon close">X</i></button>
					</div>
					<hr>
					<div class="modal_filter_list">
						<div></div>
					</div>
				</div>
			<div class="filter_modal_content">
					<div class="filter_box">
						<p>카테고리</p>
						<ul id="#filter_category">
							<li>
								<button class="filterbtn">테크・가전</button>
								<input type="checkbox" name="category" value="1" class="" />
							</li>
							<li>
								<button class="filterbtn">패션・잡화</button>
								<input type="checkbox" name="category" value="2" class="" />
							</li>
							<li>
								<button class="filterbtn">뷰티</button>
								<input type="checkbox" name="category" value="3" class="" />
							</li>
							<li>
								<button class="filterbtn">운동</button>
								<input type="checkbox" name="category" value="4" class="" />
							</li>
							<li>
								<button class="filterbtn">홈리빙</button>
								<input type="checkbox" name="category" value="5" class="" />
							</li>
							<li>
								<button class="filterbtn">여행</button>
								<input type="checkbox" name="category" value="6" class="" />
							</li>
							<li>
								<button class="filterbtn">교육</button>
								<input type="checkbox" name="category" value="7" class="" />
							</li>
							<li>
								<button class="filterbtn">공연</button>
								<input type="checkbox" name="category" value="8" class="" />
							</li>
<!-- 							<li><button class="filterbtn">패션・잡화</button></li> -->
<!-- 							<li><button class="filterbtn">뷰티</button></li> -->
<!-- 							<li><button class="filterbtn">운동</button></li> -->
<!-- 							<li><button class="filterbtn">홈리빙</button></li> -->
<!-- 							<li><button class="filterbtn">여행</button></li> -->
<!-- 							<li><button class="filterbtn">교육</button></li> -->
<!-- 							<li><button class="filterbtn">공연</button></li> -->
						</ul>
						<div>
							<input type="checkbox" name="category" value="2" class="form-control hidden" />
							<input type="checkbox" name="category" value="3" class="form-control hidden" />
							<input type="checkbox" name="category" value="4" class="form-control hidden" />
							<input type="checkbox" name="category" value="5" class="form-control hidden" />
							<input type="checkbox" name="category" value="6" class="form-control hidden" />
							<input type="checkbox" name="category" value="7" class="form-control hidden" />
							<input type="checkbox" name="category" value="8" class="form-control hidden" />
						</div>
					</div>
					
				<div class="slider_wrap">
					<div class="slider_box">
						<p class="slider_title"></p>
						<div class="slider_box_item">
							<div class="rc-slider rc-slider-with-marks">
								<div class="rc-slider-rail"></div>
							</div>
						</div>
					</div>
				</div><!-- .slider_wrap -->
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
			<p>프로젝트 <span>${paging.totalCount }</span>개</p>
			<div class="SearchList_result_wrap">
				<c:forEach items="${searchList }" var="list">
					<div class="SearchList_result_project">
						<a href="#">
							<img class="project_img" alt="테스트" src="/resources/img/test6.jpg">
							<p>
								<strong class="project_title">${list.P_NAME }</strong>
								<small class="project_info">
									<span>${list.I_CATEGORY }</span>
									<span>${list.M_NO }</span>
								</small>
							</p>
						</a>
						<div class="project_status_wrap">
							<div class="goal_bar"><span></span></div>
							<div class="project_status_info">
								<div class="project_status_info_box">
									<strong class="project_funded_percent">${list.FUNDED_PERCENT }%</strong>
									<em class="project_funded_money">${list.FUNDEND_MONEY }</em>
								</div>
								<em class="project_deadline"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></em>
							</div>
						</div>
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
					<button id="btnViewMore" type="button" class="view_more button less" onclick="viewMore(${paging.curPage}, '${keyword }')">
						더보기
						<em class="listCount">9</em>
						<em>/${paging.totalCount }</em>
						<i class="icon expand_more"></i>
					</button>
				</c:otherwise>
			</c:choose>
			
		</div><!-- .SearchList -->
	</div><!-- .SearchList_wrap -->
</div>

				



<c:import url="/WEB-INF/views/layout/footer.jsp"/>
<%-- 			<button id="btnViewMore" type="button" class="view_more button less" onclick="viewMore(${paging.curPage}, '${keyword }')"> --%>
<!-- 				더보기 -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${paging.totalCount < 9 }"> --%>
<%-- 						<em>${paging.totalCount }</em> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<em class="listCount">9</em> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 				<em>/${paging.totalCount }</em> --%>
<!-- 				<i class="icon expand_more"></i> -->
<!-- 			</button> -->