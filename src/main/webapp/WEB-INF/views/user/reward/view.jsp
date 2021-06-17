<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	
	$("input[name=reward]").change(function(){
		if($(this).is(":checked")){
			 $(this).parents(".input-group").children().last().attr('type', 'number')
		}else{
			$(this).parents(".input-group").children().last().attr('type', 'hidden')
		}
		
	})
	
	$("#btnReward").click(function(){
		var len = $("input[name='reward']:checked").length;
		if(len<=0){
			alert("리워드를 하나라도 선택하세요");
			return false;
		}
		
		$("input:checkbox[name=reward]").each(function() {
			console.log(this.checked);
			if(!this.checked){ //체크 되지 않은 checkbox
				$(this).parents(".input-group").children().last().val('0');
			}
		});
		
		$('input:checkbox[name=reward]:not(checked)').attr("checked", true); 
		
		
		$("form").submit();
	})
	
    
})

</script>
<style type="text/css">
.circle{
	display:inline-block;
	width: 200px;
	heihgt: 200px;
	border-radius:50%;
	background:#FFFFFF;
	border: 1px dotted #000;
	font-size: 16px;
	text-align:center;
	line-height:200px;
	margin: 0 50px;
}
.active{
	background:#00d3d3;
	border: 1px solid #00d3d3;
}
.col-lg-12{
	margin-bottom: 50px;
}
</style>

<div class="container">

<div class="circle active">리워드선택</div>
<div class="circle">결제</div>
<div class="circle">결제완료</div>


<h3>리워드 선택</h3>
<form action="/user/payment/form" method="post">
<input type="hidden" name="pNo" value="${project.pNo }">
<c:forEach items="${list }" var="reward">
		<div class="col-lg-12">
			<div class="input-group">
				<span class="input-group-addon"> 
					<input type="checkbox" name="reward" value="${reward.reNo }" />
				</span> 
					<div class="form-control">${reward.reMoney }원 펀딩합니다.</div>
					<div class="form-control">${reward.reTitle }</div>
					<div class="form-control">${reward.reContext }</div>
					<input type="hidden" name="count" class="form-control" placeholder="개수 입력" min="0" value="0"/>
			</div>
			<!-- /input-group -->
		</div>

	</c:forEach>
	<div class="col-lg-12">
			<div class="input-group">
					<div class="form-control">추가 후원하기</div>
					<input type="number" name="suAddMoney" class="form-control" placeholder="추가 후원" min="0" value="0"/>
			</div>
			<!-- /input-group -->
		</div>
	
	<div class="input-group">
		<button type="button" id="btnReward" class="btn btn-info">결제하기</button>
		<a href="/story?pNo=${project.pNo }"><button type="button" class="btn btn-primary">돌아가기</button></a>
	</div>
</form>
</div>       
 <c:import url="/WEB-INF/views/layout/footer.jsp"/>