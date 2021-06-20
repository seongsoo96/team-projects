<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	
	
	$('#modal').click(function(e){
		e.preventDefault();
		$('#reward').modal("show");
	});
	$("#reOption").change(function(){
		  console.log($(this).val()); //value값 가져오기
		  if($(this).val()=='Basic'){
			  $("#reOptionDiv").css("display","none");
		  }else{
			  $("#reOptionDiv").css("display","block");
		  }
	});
	$("input[name='reDelivery']").change(function(){
		if($("input[name='reDelivery']:checked").val()=="N"){
			console.log('test1');
			$("#reDeliveryDiv").css("display","none");
			$("#reDeliveryMoney").val('0');
		}else{
			console.log('test2');
			$("#reDeliveryDiv").css("display","block");
		}
	});
	
	$("#inputAjax").click(function(){
		var reMoney = $("#reMoney").val();
		var reTitle = $("#reTitle").val();
		var reContext = $("#reContext").val();
		var reOption = $("#reOption").val();
		var reOptionContext = $("#reOptionContext").val();
		var reDelivery = $('input[name=reDelivery]:checked').val();
		var reDeliveryMoney = $("#reDeliveryMoney").val();
		var reLimitQuantity = $("#reLimitQuantity").val();
		var pNo = $("#pNo").val();
		$.ajax({
	 		type: "post"
	 		, url: "/user/maker/reward/ajax/write"
	 		, dataType: "html"
	 		, data: {
	 			pNo: pNo,
	 			reMoney: reMoney,
	 			reTitle: reTitle,
	 			reContext: reContext,
	 			reOption: reOption,
	 			reOptionContext: reOptionContext,
	 			reDelivery: reDelivery,
	 			reDeliveryMoney:reDeliveryMoney,
	 			reLimitQuantity:reLimitQuantity
	 		}
	 		, success: function(res){
	 			console.log("success")
	 			$("#reMoney").val('');
	 			$("#reTitle").val('');
	 			$("#reContext").val('');
	 			$("#reOption").val('');
	 			$("#reOptionContext").val('');
	 			$("#reDeliveryMoney").val('');
	 			$("#reLimitQuantity").val('');
	 			$("#rewardList").html(res);
	 			
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});
	})
	
})
function deleteReward(reNo) {
	$.ajax({
		type: "post"
		, url: "/user/maker/reward/ajax/delete"
		, dataType: "html"
		, data: {
			reNo: reNo
			,pNo: ${project.pNo }
		}
		, success: function(res){
			console.log("success")
			console.log(reNo)
			$("#rewardList").html(res);
			
		}
		, error: function() {
			console.log("error");
		}
	});
}
</script>
<style type="text/css">
.alert{
	width: 900px;
	float: right;
}
.background-white{
	background: #FFFFFF;
	color: #1E2227;
	font-size: 20px;
	text-align: left;
}
.form-control{
	display: inline-block;
	width: 75%;

}
.rewardItem{
	display:inline-block;
	float:left;
	width:250px;
	height:300px;
	margin-top:20px;
	margin-right:35px;
	border: 1px solid #ccc;
	box-shadow: 1px 1px 3px 1px #dadce0;
	padding: 10px 10px;

}

h1 {
	margin-left: 360px;
}
</style>
<div id="content" style="margin-bottom: 400px;">
	<c:import url="/WEB-INF/views/layout/userProjectSlide.jsp"></c:import>
	<div class="container">
		<h1>리워드 설계</h1>
		<div class="modal fade" id="reward" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">리워드 추가</h5>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">X</span>
							</button>
						</div>
						<div class="modal-body form-horizontal">
							<div class="form-group">
								<label for="reMoney" class="col-sm-2 control-label">금액:</label>
								<input type="number" id="reMoney" name="reMoney" min="1000" step="1000" class="form-control" value="0"/>
							</div>
							<div class="form-group">
								<label for="reTitle" class="col-sm-2 control-label">리워드명:</label>
								<input type="text" id="reTitle" name="reTitle" class="form-control"/>
							</div>
							<div class="form-group">
								<label for="reContext" class="col-sm-2 control-label">상세설명:</label>
								<textarea class="form-control" id="reContext" name="reContext" rows="3"></textarea>
							</div>
							<div class="form-group">
								<label for="reOption" class="col-sm-2 control-label">옵션:</label>
								<select class="form-control" id="reOption" name="reOption">
									<option value="Basic">옵션 없음</option>
									<option value="Select">선택 옵션(사이즈, 색상등)</option>
									<option value="Direct">직접 입력 옵션(각인, 메시지등 )</option>
								</select>
							</div>
							<div class="form-group" id="reOptionDiv" style="display:none;">
								<label for="reOptionContext" class="col-sm-2 control-label">옵션내용</label>
								<textarea class="form-control" id="reOptionContext" name="reOptionContext" rows="3"></textarea>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">배송조건:</label>
								<div class="radio">
								  <label class="col-sm-5">
								    <input type="radio" name="reDelivery" id="reDelivery1" value="N" checked>
								    배송이 필요없는 리워드입니다.
								  </label>
								</div>
								<div class="radio">
								  <label class="col-sm-5" style="margin-left:15.666667%;">
								    <input type="radio" name="reDelivery" id="reDelivery2" value="Y">
								    배송이 필요한 리워드입니다.
								  </label>
								</div>
							</div>
							<div class="form-group" id="reDeliveryDiv" style="display:none;">
								<label for="reDeliveryMoney" class="col-sm-2 control-label">배송금액</label>
								<input type="number" id="reDeliveryMoney" name="reDeliveryMoney" class="form-control" value="0"/>
							</div>
							
							<div class="form-group">
								<label for="reLimitQuantity" class="col-sm-2 control-label">제한수량</label>
								<input type="number" id="reLimitQuantity" name="reLimitQuantity" class="form-control" value="100"/>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn" type="button" id="cancel" data-dismiss="modal">취소</button>
							<button class="btn" type="button" id="inputAjax" data-dismiss="modal"
								 style="background-color:  #4EE2EC; color: white;">등록</button>
						</div>
					</div>
				</div>
			</div>
		
		<form action="/user/maker/reward/write" method="post" role="role">
			
			<input type="hidden" id="pNo" name="pNo" value="${project.pNo }" />
			<div class="background-white form-group alert" role="alert">
				<label for="rContext">서포터에게 제공할 리워드 내용을 입력하세요. 서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터 서포터의 보다 빠른 펀딩을 유도할 수 있는 얼리버드 리워드까지 다양한 리워드를 구성하세요.</label>
				<button type="button" id="modal" class="btn" 
					style="background-color: white; border-color: #4EE2EC;">추가하기</button>
			</div>
			<div id="rewardList" class="form-group alert" role="alert">
			<c:forEach items="${rewardList }" var="reward">
				<div class="rewardItem">
					<p style="display:inline-block; float:left;">리워드가격:${reward.reMoney }</p>
					<p style="display:inline-block; float:right;">수량:${reward.reLimitQuantity }</p>
					<p style="margin-top:35px; text-align:left; font-weight: bold;">${reward.reTitle }</p>
					<textarea style="text-align:left; font-weight: lighter; width:230px; height:60px;" readonly>${reward.reContext }</textarea>
					<p style="text-align:left;">옵션: ${reward.reOption }</p>
					<textarea style="text-align:left; font-weight: lighter; width:230px; height:60px;" readonly>${reward.reOptionContext }</textarea>
					<p style="text-align:left;">배송비:${reward.reDeliveryMoney }원</p>
					<button type="button" name="delete" style="float: right;" class="btn" onclick="deleteReward(${reward.reNo})">삭제</button>
				</div>
			</c:forEach>
			</div>
			<div class="background-white form-group" style="margin-left: 180px;">
                    <div class="col-lg-offset-2 col-lg-10">
                    	<button class="btn" style="background-color:  #4EE2EC; color: white;">저장하기</button>
                        <button type="button" class="btn" onclick="history.back()">돌아가기</button>
                    </div>
            </div>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>