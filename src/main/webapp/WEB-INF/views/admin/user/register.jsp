<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<div id="content">
	<div id="register">
<!-- 		<div style="width:100px; height:100px; margin: 0 auto;"> -->
<!-- 			<img src="/resources/img/member.png" alt="..." class="img-circle" style="width:100%;"> -->
<!-- 		</div>${view.MY_STORED_NAME } -->
		
		<form action="/admin/user/register" method="post">
			<table style="margin: 0 auto;">
				<tr><td>특정 정보들은 임시로 저장됩니다.</td></tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mId" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<th>임시 비밀번호</th>
					<td><input readonly="readonly" type="text" name="mPassword" value="1234"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mName" placeholder="한글만 입력 가능합니다."></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="mBirth" placeholder="생년월일"></td>
				</tr>
				<tr>
					<th>임시 닉네임</th>
					<td><input readonly="readonly" type="text" name="mNick" value="닉네임임임"></td>
				</tr>
				<tr>
					<th>임시 전화번호</th>
					<td><input readonly="readonly" type="text" name="mPhone" value="01000000000"></td>
				</tr>
				<tr>
					<th>임시 이메일</th>
					<td><input readonly="readonly" type="text" name="mEmail" value="hello123@gmail.com"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="mGender" value="M">남
						<input type="radio" name="mGender" value="W">여
					</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<input type="radio" name="mGrade" value="M">관리자
						<input type="radio" name="mGrade" value="U">사용자
					</td>
				</tr>
				<tr>
					<th>은행</th>
					<td><input readonly="readonly" type="text" name="mBank" value="임시은행"></td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td><input readonly="readonly" type="text" name="mAccount" value="000000000"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input readonly="readonly" type="text" name="mPost" value="00000"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input readonly="readonly" type="text" name="mAddress" value="임시주소"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input readonly="readonly" type="text" name="mDetailAddress" value="임시상세주소"></td>
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