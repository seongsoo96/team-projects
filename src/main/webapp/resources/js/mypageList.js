/**
 * 마이페이지 체크박스용 스크립트
 */
$(document).ready(function() {
	
	var categorybox = $("input:checkbox[type='checkbox']")
	
	/* 체크 박스 옵션 선택 시 */
 	categorybox.change(function() {
	
		//0번째 옵션(카테고리 전체) unchecked 및 css 수정
		categorybox.eq(0).attr({'checked':false, 'disabled':true})
		$("input:checkbox[type='checkbox']:eq(0)+label").css('color', '#ccc')
	})
	
	/* 검색 아이콘 클릭 시 카테고리 폼 데이터 전송*/
	 $("#btnSelectCategory").click(function() {
		 $("form").submit()
	 })
})
