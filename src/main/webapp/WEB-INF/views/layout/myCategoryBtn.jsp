<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		

<div class="divCategoryWrap">
	<div class="divCategoryBox text-center">
		<button onclick="location.href='${contextPath}?category=전체'" id="default">
			<span class="spanIconWrap"><img src="/resources/img/subLogo.png"></span>
		</button>
		<button onclick="location.href='${contextPath}?category=테크/가전'" id="tech">
			<span class="spanIconWrap"><i class="fas fa-cogs"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=반려동물'" id="pet">
			<span class="spanIconWrap"><i class="fas fa-paw"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=출판'" id="book">
			<span class="spanIconWrap"><i class="fas fa-book"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=기부/후원'" id="donate">
			<span class="spanIconWrap"><i class="fas fa-hand-holding-heart"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=푸드'" id="food">
			<span class="spanIconWrap"><i class="fas fa-utensils"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=운동'" id="exercise">
			<span class="spanIconWrap"><i class="fas fa-dumbbell"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=여행'" id="trip">
			<span class="spanIconWrap"><i class="fas fa-car-side"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=뷰티'" id="beauty">
			<span class="spanIconWrap"><i class="fas fa-air-freshener"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=패션'" id="fashion">
			<span class="spanIconWrap"><i class="fas fa-tshirt"></i></span>
		</button>
		<button onclick="location.href='${contextPath}?category=디자인소품'" id="design">
			<span class="spanIconWrap"><i class="fas fa-pencil-ruler"></i></span>
		</button>
	</div>
	<div class="divCategoryLabel text-center">
		<label for="default">전체보기</label>
		<label for="tech">테크/가전</label>
		<label for="pet">반려동물</label>
		<label for="book">출판</label>
		<label for="donate">기부/후원</label>
		<label for="food">푸드</label>
		<label for="exercise">운동</label>
		<label for="trip">여행</label>
		<label for="beauty">뷰티</label>
		<label for="fashion">패션</label>
		<label for="design">디자인소품</label>
	</div>
</div>