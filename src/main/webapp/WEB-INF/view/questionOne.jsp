<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<h3>문의사항 상세보기</h3>
		<table border="1">
			<c:forEach var="q" items="${list}">
				<tr>
					<th>제목</th>
					<td>${q.questionTitle}</td>
				</tr>
				<tr>
					<th>답변</th>
					<td>${q.questionMemo}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${q.questionCreatedate}</td>
				</tr>
           	</c:forEach>
		</table>
		
		<h3>답변보기</h3>
		<c:forEach var="q" items="${list}">
			<c:choose> 
				<c:when test="${q.answer == null}">
					<h3>문의사항 확인 중입니다.</h3>
					<a href="${pageContext.request.contextPath}/removeQuestion?questionNo=${q.questionNo}">삭제</a>
				</c:when> 
				<c:otherwise>
					<table border="1">
					<tr>
						<th>답변</th>
	               		<td>${q.answer}</td>
					</tr>
					<tr>
						<th>날짜</th>
	               		<td>${q.answerCreatedate}</td>
					</tr>
			</table>
				</c:otherwise> 
			</c:choose> 
			
       	</c:forEach>
	</body>
</html>