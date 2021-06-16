<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		

<form action="${contextPath }" method="get">
	<div class="form-control divCheckbox">
		<input type="checkbox" name="category" id="default" value="전체" checked/>
		<label for="default"><span class="glyphicon glyphicon-ok" id="okicon"></span>카테고리 전체</label>
			
		<input type="checkbox" name="category" id="tech" value="테크/가전"/>
		<label for="tech"><span class="glyphicon glyphicon-ok" id="okicon"></span>테크/가전</label>

		<input type="checkbox" name="category" id="pet" value="반려동물"/>
		<label for="pet"><span class="glyphicon glyphicon-ok" id="okicon"></span>반려동물</label>
			
		<input type="checkbox" name="category" id="book" value="출판"/>
		<label for="book"><span class="glyphicon glyphicon-ok" id="okicon"></span>출판</label>
			
		<input type="checkbox" name="category" id="donate" value="기부/후원"/>
		<label for="donate"><span class="glyphicon glyphicon-ok" id="okicon"></span>기부/후원</label>
			
		<input type="checkbox" name="category" id="food" value="푸드"/>
		<label for="food"><span class="glyphicon glyphicon-ok" id="okicon"></span>푸드</label>

		<input type="checkbox" name="category" id="exercise" value="운동"/>
		<label for="exercise"><span class="glyphicon glyphicon-ok" id="okicon"></span>운동</label>
			
		<input type="checkbox" name="category" id="trip" value="여행"/>
		<label for="trip"><span class="glyphicon glyphicon-ok" id="okicon"></span>여행</label>
			
		<input type="checkbox" name="category" id="beauty" value="뷰티"/>
		<label for="beauty"><span class="glyphicon glyphicon-ok" id="okicon"></span>뷰티</label>
			
		<input type="checkbox" name="category" id="fashion" value="패션"/>
		<label for="fashion"><span class="glyphicon glyphicon-ok" id="okicon"></span>패션</label>
			
		<input type="checkbox" name="category" id="design" value="디자인소품"/>
		<label for="design"><span class="glyphicon glyphicon-ok" id="okicon"></span>디자인소품</label>

		<span><button type="button" id="btnSelectCategory"><i class="fas fa-search"></i></button></span>
	</div>
</form>