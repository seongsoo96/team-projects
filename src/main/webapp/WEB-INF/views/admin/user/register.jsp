<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	//모달을 전역변수로 선언
	var authNumber = false;
	var nickCheck = false;
	var idCheck = false;
	
    var modalContents = $(".modal-contents");
    var modal = $("#defaultModal");
    var regExPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 정규식
    $('.onlyAlphabetAndNumber').keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
        }
    });
    
    $(".onlyHangul").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
        }
    });

    $(".onlyNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        }
    });
    
    
    
    
    
    //------- 검사하여 상태를 class에 적용
    $('#id').keyup(function(event){
        
        var divId = $('#divId');
        
        if($('#id').val()!="" && idCheck){
        	divId.removeClass("has-error");
            divId.addClass("has-success");
        }else{
            divId.removeClass("has-success");
            divId.addClass("has-error");
        }
    });
    
    
    
	
	
    //------- validation 검사
    $( "form" ).submit(function( event ) {
        
        var divId = $('#divId');
        
        
        //아이디 검사
        if($('#id').val()==""){
            modalContents.text("아이디를 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divId.removeClass("has-success");
            divId.addClass("has-error");
            $('#id').focus();
            return false;
        }else{
            divId.removeClass("has-error");
            divId.addClass("has-success");
        }
        
        //아이디 중복 검사
        if(!idCheck){
        	modalContents.text("아이디 중복을 확인해주세요");
            modal.modal('show');
            divId.removeClass("has-success");
            divId.addClass("has-error");
            $('#id').focus();
            return false;
        }else{
            divId.removeClass("has-error");
            divId.addClass("has-success");
        }
        
      //아이디 중복 검사
        if(!nickCheck){
        	modalContents.text("닉네임 중복을 확인해주세요");
            modal.modal('show');
            divNickname.removeClass("has-success");
            divNickname.addClass("has-error");
            $('#nick').focus();
            return false;
        }else{
        	divNickname.removeClass("has-error");
        	divNickname.addClass("has-success");
        }
        
    
    });	
    
    
   	$("#btnIdCheck").click(function(){
   		var id = $("#id").val();
   		var divId = $('#divId');
	   	$.ajax({
	 		type: "post"
	 		, url: "/user/member/idCheck"
	 		, dataType: "json"
	 		, data: {
	 			mId: id
	 		}
	 		, success: function(res){
	 			
	 			console.log("success")
	 			console.log(id)
	 			console.log(res)
	 			idCheck= res.isId;
	 			console.log(idCheck);
	 			
	 			if(idCheck){
	 				divId.removeClass("has-error");
	 	            divId.addClass("has-success");
	 	            $("#id").attr("readonly", true);
	 			}else{
	 				divId.removeClass("has-success");
	 				divId.addClass("has-error");
	 			}
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});		
   	}) 
   	
   	
   		
   
    
})


</script>



<div id="content">
	<div id="register">
<!-- 		<div style="width:100px; height:100px; margin: 0 auto;"> -->
<!-- 			<img src="/resources/img/member.png" alt="..." class="img-circle" style="width:100%;"> -->
<!-- 		</div>${view.MY_STORED_NAME } -->
		
		<form action="/admin/user/register" method="post">
			<table style="margin: 0 auto;">
				<tr><td><h2 style="color: #C8386B;">특정 정보들은 임시로 저장됩니다.</h2></td></tr>
<!-- 				<tr> -->
<!-- 					<th>아이디</th> -->
<!-- 					<td> -->
<!-- 					<input type="text" id="id" name="mId" placeholder="아이디 입력"> -->
<!-- 					<button type="button" id="btnIdCheck" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;" >아이디 중복</button> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr class="form-group" id="divId">
                    <th>아이디</th>
                    <td style="width: 50%">
                        <input type="text" class="form-control onlyAlphabetAndNumber" style="display:inline-block; width:75%;" id="id" name="mId" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력" maxlength="30">
                    	<button type="button" id="btnIdCheck" class="btn btn-default" style="padding-top:5px; margin-bottom:5px; width:24%" >아이디 중복</button>
                    </td>
                </tr>
				<tr>
					<th>임시 비밀번호</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mPassword" value="1234"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input class="form-control" type="text" name="mName" placeholder="한글만 입력 가능합니다."></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input class="form-control" type="date" name="birth"></td>
				</tr>
				<tr>
					<th>임시 닉네임</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mNick" value="닉네임임임"></td>
				</tr>
				<tr>
					<th>임시 전화번호</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mPhone" value="01000000000"></td>
				</tr>
				<tr>
					<th>임시 이메일</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mEmail" value="hello123@gmail.com"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label class="radio-inline">
							<input type="radio" name="mGender" value="M" checked>남
						</label>
						<label class="radio-inline">
							<input type="radio" name="mGender" value="F">여
						</label>
					</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<label class="radio-inline">
							<input type="radio" name="mGrade" value="M">관리자
						</label>
						<label class="radio-inline">
							<input type="radio" name="mGrade" value="U" checked>사용자
						</label>
					</td>
				</tr>
				<tr>
					<th>은행</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mBank" value="임시은행"></td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mAccount" value="000000000"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mPost" value="00000"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mAddress" value="임시주소"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input class="form-control" readonly="readonly" type="text" name="mDetailAddress" value="임시상세주소"></td>
				</tr>
				<tr>
					<td><input readonly="readonly" type="hidden" name="mSocial" value="사이트"></td>
					<td><input readonly="readonly" type="hidden" name="mDeleteState" value="N"></td>
					<td><hr></td>
				</tr>
				<tr>
					<th>
						<a href="#" onClick="history.back()"><button type="button" class="btn">돌아가기</button></a>
					</th>
					<td>
						<button class="btn pull-right">등록</button>  
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />