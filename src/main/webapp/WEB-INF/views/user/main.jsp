<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script type="text/javascript" src="/resources/js/mainPage.js"></script>

<section>
<div id="wrapper-main">
      <div id="slider-wrap">
          <ul id="slider">
             <li>
                <div>
                    <h3>Slide #1</h3>
                    <span>Sub-title #1</span>
                </div>  
				<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/960a96/000?text=11111" ></a>
             </li>
             <li>
                <div>
                    <h3>Slide #2</h3>
                    <span>Sub-title #2</span>
                </div>
				<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/D27328/000?text=22222"></a>
             </li>
             
             <li>
                <div>
                    <h3>Slide #3</h3>
                    <span>Sub-title #3</span>
                </div>
				<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/FF607F/000?text=33333"></a>
             </li>
             
             <li>
                <div>
                    <h3>Slide #4</h3>
                    <span>Sub-title #4</span>
                </div>
				<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444"></a>
             </li>
             
             <li>
                <div>
                    <h3>Slide #5</h3>
                    <span>Sub-title #5</span>
                </div>
				<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/0064CD/000?text=55555"></a>
             </li>
             
             
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
<div class="left">
	<div>
	<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/FF607F/000?text=11111" width="200" height="150"></a>
	<p>제목1</p>
	</div>
	<div>
	<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/D27328/000?text=22222" width="200" height="150"></a>
	<p>제목2</p>
	</div>
	<div>
	<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/FF607F/000?text=33333" width="200" height="150"></a>
	<p>제목3</p>
	</div>
	<div>
	<a href="https://www.google.com/"><img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444" width="200" height="150"></a>
	<p>제목4</p>
	</div>
	<div id="pagination-wrap2">
            <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            </ul>
    </div>
</div>
<div id="realTimeRanking" class="right">
	<h3>실시간 랭킹</h3>
	<ol>
		<li><a href="https://www.google.com/">랭킹 1</a><p>4231% 푸드</p></li>
		<li><a href="https://www.google.com/">랭킹 2</a><p>1231% 가전</p></li>
		<li><a href="https://www.google.com/">랭킹 3</a><p>331% 전기</p></li>
		<li><a href="https://www.google.com/">랭킹 4</a><p>231% 푸드</p></li>
		<li><a href="https://www.google.com/">랭킹 5</a><p>1111% 푸드</p></li>
	</ol>
</div>
	
</section>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
