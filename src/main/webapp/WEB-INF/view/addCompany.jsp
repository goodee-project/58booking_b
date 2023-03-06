<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체가입</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<body>
	<h2>업체가입</h2>
	<form action="${pageContext.request.contextPath}/addCompany" method="post" id="addForm">
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
			<tr>
				<th>COMPANY NAME</th>
				<td>
					<input type="text" id="name" name="companyName">
				</td>
			</tr>
			<tr>
				<th>CEO NAME</th>
				<td>
					<input type="text" id="ceo" name="companyCeo">
				</td>
			</tr>
			<tr>
				<th>Address</th>
				<td>
					<input type="text" id="address" name="companyAddress">
				</td>
			</tr>
			<tr>
				<th>Phone</th>
				<td>
					<input type="text" id="phone" name="companyPhone">
				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>
					<input type="text" id="email" name="companyEmail">
				</td>
			</tr>
			<tr>
				<th>Bank</th>
				<td>
					<input type="text" id="bank" name="companyBank">
				</td>
			</tr>
			<tr>
				<th>Account</th>
				<td>
					<input type="text" id="account" name="companyAccount">
				</td>
			</tr>
			<tr>
				<th>Company Number</th>
				<td>
					<input type="text" id="number" name="companyNumber">
				</td>
			</tr>
			<tr>
				<th>Info Agree</th>
				<td>
					<label>
						<input type="radio" id="agree" class="agree" name="agree" value="동의">약관 동의
					</label>
					<label>
						<input type="radio" id="agree" class="agree" name="agree" value="미동의">약관 미동의
					</label>
				</td>
			</tr>
			<tr>
				<th>Latitude</th>
				<td>
					<input type="number" id="la" name="companyLatitude">
				</td>
			</tr>
			<tr>
				<th>Longtitude</th>
				<td>
					<input type="number" id="long" name="companyLongtitude">
				</td>
			</tr>
		</table>
		<button type="button" id="addBtn">가입</button>
	</form>
</body>
</html>