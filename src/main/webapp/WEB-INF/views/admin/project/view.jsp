<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty project.pRequirements }">
	<c:choose>
		<c:when test="${project.pRequirements eq 'W' }"><c:set var="pRequirements" value="작성전" /></c:when>
		<c:when test="${project.pRequirements eq 'Y'}"><c:set var="pRequirements" value="작성완료" /></c:when>
		<c:when test="${project.pRequirements eq 'N' }"><c:set var="pRequirements" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:if test="${not empty project.pInformation }">
	<c:choose>
		<c:when test="${project.pInformation eq 'W' }"><c:set var="pInformation" value="작성전" /></c:when>
		<c:when test="${project.pInformation eq 'Y' }"><c:set var="pInformation" value="작성완료" /></c:when>
		<c:when test="${project.pInformation eq 'N' }"><c:set var="pInformation" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:if test="${not empty project.pStory }">
	<c:choose>
		<c:when test="${project.pStory eq 'W'}"><c:set var="pStory" value="작성전" /></c:when>
		<c:when test="${project.pStory eq 'Y'}"><c:set var="pStory" value="작성완료" /></c:when>
		<c:when test="${project.pStory eq 'N'}"><c:set var="pStory" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:if test="${not empty project.pReward }">
	<c:choose>
		<c:when test="${project.pReward eq 'W'}"><c:set var="pReward" value="작성전" /></c:when>
		<c:when test="${project.pReward eq 'Y'}"><c:set var="pReward" value="작성완료" /></c:when>
		<c:when test="${project.pReward eq 'N'}"><c:set var="pReward" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:if test="${not empty project.pMaker }">
	<c:choose>
		<c:when test="${project.pMaker eq 'W'}"><c:set var="pMaker" value="작성전" /></c:when>
		<c:when test="${project.pMaker eq 'Y'}"><c:set var="pMaker" value="작성완료" /></c:when>
		<c:when test="${project.pMaker eq 'N'}"><c:set var="pMaker" value="수정요청" /></c:when>
	</c:choose>
</c:if>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	var pRequirements = '${project.pRequirements}';
	var pInformation = '${project.pInformation}';
	var pStory = '${project.pStory}';
	var pReward = '${project.pReward}';
	var pMaker = '${project.pMaker}';
	var modalContents = $(".modal-contents");
	var modal = $("#defaultModal");
	
	
	
	console.log(pRequirements);
	console.log(pInformation);
	console.log(pStory);
	console.log(pReward);
	console.log(pMaker);
	console.log('${contextPath}');
	
	
	$("#projectSubmit").click(function(){
		if(pRequirements == 'Y' && pInformation=='Y' && pStory=='Y' && pReward=='Y' && pMaker=='Y'){
			console.log('작성완료')
			$(location).attr('href', '/admin/project/submit?pNo=${project.pNo}')
			
		}else{
			modalContents.text("프로젝트를 완성하세요");
		    modal.modal('show');
		}	
	})
	
	$("#btnApprove").click(function(){
		$(location).attr('href', '/admin/project/approve?pNo=${project.pNo}')
	})
	
	$("#btnReject").click(function(){
		modal.modal('show');
		var rejectDiv = $("#rejectDiv");
		var messageSubmit = $("#messageSubmit")
		rejectDiv.css("display","block");
		rejectDiv.attr("required", true);
		messageSubmit.css("display","block");
		
	})
	$("#messageClose").click(function(){
		var rejectDiv = $("#rejectDiv");
		rejectDiv.css("display","hidden");
		rejectDiv.attr("required", false);
	})
	
	$("#messageSubmit").click(function(){
		var rejectDiv = $("#rejectDiv");
		rejectDiv.css("display","hidden");
		rejectDiv.attr("required", false);
		$("form").submit();
	})
	
});

</script>

<style type="text/css">

.alert{
	width: 900px;
	float: right;
}
.btn-group{
	margin-left:240px;
	float: left;
}

.background-white{
	background: #FFFFFF;
	color: #1E2227;
	border: 1px solid #4EE2EC;
	font-size: 35px;
}

.fa-plus-square{
	margin-top:9px;
	color:#4EE2EC;
}
.state{
	color:#4EE2EC;
	font-size:12px;
}
.form-control{
	width:83%;
}

</style>

<div id="content">
<c:import url="/WEB-INF/views/layout/adminProjectSlide.jsp"></c:import>

<div class="container">
	<form action="/admin/project/reject" method="post">
	<input type="hidden" name="pNo" value="${project.pNo}">
	<div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body form-horizontal">
                            <p class="modal-contents"></p>
                            <div id="rejectDiv" class="form-group" style="display:none;">
								<label for="msgContent" class="col-sm-2 control-label">거부사유:</label>
								<textarea id="msgContent" name="msgContent" class="form-control" style="display: inline-block;"></textarea>
							</div>
                        </div>
                        <div class="modal-footer">
                        	<button id="messageSubmit" type="button" class="btn btn-default" data-dismiss="modal" style="display:none;">전송</button>
                            <button id="messageClose" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->	
		</form>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">기본요건&nbsp;<span class="state">${pRequirements}</span></span><a href="/admin/requirement/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">기본정보&nbsp;<span class="state">${pInformation}</span></span><a href="/admin/information/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">스토리&nbsp;<span class="state">${pStory}</span></span><a href="/admin/story/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">리워드&nbsp;<span class="state">${pReward}</span></span><a href="/admin/reward/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>
	<div class="alert background-white alert-info" role="alert"><span class="pull-left">메이커 정보&nbsp;<span class="state">${pMaker}</span></span><a href="/admin/maker/view?pNo=${project.pNo }"><i class="far fa-plus-square pull-right"></i></a></div>

	<div class="btn-group btn-group-lg" role="group">
		<c:if test="${project.mNo eq mNo}">
			<c:choose>
				<c:when test="${project.pState eq 'S' }">
					<button type="button" id="projectSubmit" class="btn" disabled
						style="background-color:  #4EE2EC; color: white;">승인 대기중</button>
				</c:when>
				<c:when test="${project.pState eq 'Y' }">
					<button type="button" id="projectSubmit" class="btn" disabled
						style="background-color:  #4EE2EC; color: white;">승인 완료</button>
				</c:when>
				<c:when test="${project.pState eq 'W' }">
					<button type="button" id="projectSubmit" class="btn"
						style="background-color:  #4EE2EC; color: white;">제출</button>
				</c:when>
			</c:choose>
			
		</c:if>
		<c:if test="${project.mNo ne mNo and project.pState eq 'S'}">
			<button type="button" id="btnApprove" class="btn btn-default">승인</button>
			<button type="button" id="btnReject" class="btn btn-default">거부</button>	
		</c:if>
		
	</div>
</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
