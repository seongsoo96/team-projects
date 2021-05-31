<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.container {
    width: 980px;
}

.SearchBox_inner {
	padding: 75px 0 25px 0;
}

.SearchBox_title {
	margin-bottom : 36px;
/* 	coler: #1d2129; */
}

.SearchBox_title span {
	color: #babdc0;
}

.SearchList p {
    padding: 36px 0 16px;
    font-size: 17px;
    line-height: 1.65;
    color: #1d2129;
}

.SearchList p span {
    color: #00b2b2;
}

.SearchList_result_wrap {
	display: flex;
    flex-wrap: wrap;
    width: 100%;
    grid-row-gap: 40px;
    margin-bottom: 40px;
}

.SearchList_result_wrap .SearchList_result_project:nth-child(3n+1) {
	width: calc(33.33333% - 30px);
    margin-bottom: 30px;
    margin-left: 0px;
}

.SearchList_result_project {
    width: calc(33.33333% - 30px);
    margin-bottom: 30px;
    margin-left: 45px;
}

.SearchList_result_project .project_img {
    height: auto;
    width: 100%;
    object-fit: cover;
    height: 176px;
    margin-bottom: 10px;
    border-radius: 3px;
    display: block;
    background: #f0f2f5 50% 50%/cover;
}
.SearchList_result_project .project_title {
    font-size: 17px;
    font-weight: 500;
    color: rgba(0,0,0,.84);
    display: block;
    text-overflow: ellipsis;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    max-height: 48px;
    line-height: 24px;
    margin-bottom: 4px;
}

.SearchList_result_project .project_info {
	font-size: 13px;
    font-weight: 500;
    color: #90949c;
    display: block;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}

.SearchList_result_project .project_info small:nth-chile(2)::before {
	content: "|";
    color: #dadce0;
    margin: 0 5px;
    font-weight: 400;
}

.SearchList_result_project .project_status_wrap{
    height: 27px;
}

.SearchList_result_project .project_status_wrap .goal_bar {
    height: 3px;
    width: 100%;
    margin-bottom: 4px;
    background-color: #e6eaed;
    overflow: hidden;
}

.SearchList_result_project .project_status_wrap .goal_bar span {
    height: 3px;
    background-color: #00b2b2;
    display: block;
}

.SearchList_result_project .project_status_wrap .goal_bar span {
    height: 3px;
    background-color: #00b2b2;
    display: block;
}

.SearchList_result_project .project_status_wrap .project_status_info {
    display: flex;
    height: 20px;
    box-sizing: border-box;
}

.SearchList_result_project .project_status_wrap 
.project_status_info .project_status_info_box {
    width: calc(100% - 70px);
    box-sizing: border-box;
    white-space: nowrap;
}

.SearchList_result_project .project_status_wrap 
.project_status_info .project_status_info_box .project_funded_percent {
    font-size: 17px;
    font-weight: 500;
    color: #00b2b2;
}

.SearchList_result_project .project_status_wrap
.project_status_info .project_status_info_box .project_funded_money {
    font-size: 14px;
    font-weight: 500;
    color: #90949c;
}

.SearchList_result_project .project_status_wrap
.project_status_info .project_status_info_box .project_funded_money::before {
    content: "\B7";
    padding: 0 2px;
}
</style>


<div class="container">
	
	<div class="SearchBox_wrap">
		<div class="SearchBox_inner">
			<div class="clearfix"></div>
			<div class="SearchBox_title h1">${keyword } <span>검색결과</span></div>
			
			<div class="SearchBox_filter_area">
				<div class="button_wrap">
					<button class="filter_btn">
						<i class="icon" ::before></i>
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
			</div>
		</div>
		<div class="SearchBox_shadow hidden">
			<div class="filter_modal">
				<div class="filter_modal_header">
					<div class="modal_close_btn_wrap">
						<span>필터</span>
						<button><i class="icon close">X</i></button>
					</div>
					<div class="modal_filter_list">
						<div></div>
					</div>
				</div>
				<div class="filter_modal_content"></div>
				<div class="filter_modal_footer">
					<button class="reset">초기화</button>
					<button class="submit">적용하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<hr>

	<div class="SearchList_wrap">
		<div class="SearchList">
			<p>프로젝트 <span>${paging.totalCount }</span>개</p>
			<div class="SearchList_result_wrap">
				<c:forEach items="${searchList }" var="list">
					<div class="SearchList_result_project">
						<a href="#">
<!-- 							<div></div> -->
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
									<strong class="project_funded_percent">${list.FUNDED_PERCENT }</strong>
									<em class="project_funded_money">${list.FUNDEND_MONEY }</em>
								</div>
								<em class="project_deadline"><fmt:formatDate value="${list.I_END_DATE }" pattern="yy-MM-dd" /></em>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<button>
				더보기
				<em>"27""/""133"</em>
				<i class="icon expand-more"></i>
			</button>
		</div>
	</div>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>