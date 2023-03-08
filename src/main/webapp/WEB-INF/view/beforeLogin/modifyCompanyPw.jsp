<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체 비밀번호 변경</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#modiBtn').click(function(){
			if($('#newPw').val() == ''){
				$('#newPwMsg').text('새 비밀번호를 입력하세요.');
				$('#pwCkMsg').text('');
				return;
			}
			if($('#pwCk').val() == ''){
				$('#pwCkMsg').text('새 비밀번호 확인을 입력하세요.');
				$('#newPwMsg').text('');
				return;
			}
			if($('#pwCk').val() != $('#newPw').val()){
				$('#pwCkMsg').text('');
				$('#newPwMsg').text('');
				$('#msg').text('두 비밀번호가 일치하지 않습니다.');
				return;
			}
			
			$('#modiForm').submit();
			
		});
	});
</script>
</head>
<body>
	<h2>비밀번호 변경</h2>
	<form action="${pageContext.request.contextPath}/beforeLogin/modifyCompanyPw" method="post" id="modiForm">
		<input type="hidden" name="companyId" value="${id}">
		<input type="hidden" name="companyEmail" value="${email}">
		<table>
			<tr>
				<td><div id="msg" style="color:red;"></div></td>
			</tr>
			<tr>
				<th>새 비밀번호</th>
				<td>
					<input type="password" name="companyPw" id="newPw">
					<div id="newPwMsg" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<th>새 비밀번호 확인</th>
				<td>
					<input type="password" id="pwCk">
					<div id="pwCkMsg" style="color:red;"></div>
				</td>
			</tr>
		</table>
		<button type="button" id="modiBtn">변경</button>
	</form>
</body>
</html>