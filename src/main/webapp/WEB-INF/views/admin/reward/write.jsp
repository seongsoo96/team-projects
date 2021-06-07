<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<script type="text/javascript">
var sel_file;
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
	
})

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

</style>
<div id="content">
	<c:import url="/WEB-INF/views/layout/adminProjectSlide.jsp"></c:import>
	<div class="container">
		<h1>리워드 설계</h1>
		
		<form action="/admin/reward/write" method="post" role="role">
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
								<input style="" type="number" id="reMoney" name="reMoney" min="1000" step="1000" class="form-control"/>
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
								<input type="number" id="reLimitQuantity" name="reLimitQuantity" class="form-control"/>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn" type="button" id="cancel" data-dismiss="modal">취소</button>
							<button class="btn" type="button" id="input" data-dismiss="modal">등록</button>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="pNo" value="${project.pNo }" />
			<div class="background-white form-group alert" role="alert">
				<label for="rContext">서포터에게 제공할 리워드 내용을 입력하세요. 서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터 서포터의 보다 빠른 펀딩을 유도할 수 있는 얼리버드 리워드까지 다양한 리워드를 구성하세요.</label>
				<button type="button" id="modal" class="btn btn-default">추가하기</button>
			</div>
			<div class="background-white form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                    	<button type="submit" class="btn btn-primary">저장하기</button>
                        <button type="button" class="btn btn-info" onclick="history.back()">돌아가기</button>
                        <button id="btnReset" type="reset" class="btn btn-danger">다시 입력하기</button>
                    </div>
            </div>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>