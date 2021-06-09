<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<c:forEach items="${rewardList }" var="reward">
	<div class="rewardItem">
		<p style="display:inline-block; float:left;">리워드가격:${reward.reMoney }</p>
		<p style="display:inline-block; float:right;">수량:${reward.reLimitQuantity }</p>
		<p style="margin-top:35px; text-align:left; font-weight: bold;">${reward.reTitle }</p>
		<textarea style="text-align:left; font-weight: lighter; width:230px; height:60px;" readonly>${reward.reContext }</textarea>
		<p style="text-align:left;">옵션: ${reward.reOption }</p>
		<textarea style="text-align:left; font-weight: lighter; width:230px; height:60px;" readonly>${reward.reOptionContext }</textarea>
		<p style="text-align:left;">배송비:${reward.reDeliveryMoney }원</p>
		<button type="button" name="delete" style="float: right;" class="btn btn-danger" onclick="deleteReward(${reward.reNo})">삭제</button>
	</div>
</c:forEach>