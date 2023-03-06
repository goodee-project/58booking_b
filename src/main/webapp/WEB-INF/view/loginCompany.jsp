<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체 로그인</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#loginBtn').click(function(){
			
			if($('#id').val() == ''){
				alert('아이디를 입력해주세요.');
				return;
			}
			
			if($('#pw').val() == ''){
				alert('비밀번호를 입력해주세요.');
				return;
			}
			
			$('#loginForm').submit();
		});
	});
</script>
</head>
<body>
	<h2>login company</h2>
	<form action="${pageContext.request.contextPath}/loginCompany" method="post" id="loginForm">
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" id="id" name="companyId">
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>
					<input type="password" id="pw" name="companyPw">
				</td>
			</tr>
		</table>
		<button type="button" id="loginBtn">company login</button>
	</form>
</body>
</html>