<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#btn').click(function() {
					// 유효성 검사
					if($('#questionTitle').val() == '') {
						$('#msg').text('제목을 입력 해주세요');
						$('#questionTitle').focus();
						return;
					} else {
						$('#msg').text('');
					}
					if($('#questionMemo').val() == '') {
						$('#msg').text('내용을 입력 해주세요');
						$('#questionMemo').focus();
						return;
					} else {
						$('#msg').text('');
					}
					$('#questionForm').submit();
					alert('문의사항등록 완료');
				
				});
			});
		</script>
	</head>
	<body>
		<h3>문의사항 등록</h3>
		<form id="questionForm" method="post" action="${pageContext.request.contextPath}/addQuestion">
			<div>
 				<p id="msg" style="color: red;"></p>
			</div>
			<table border="1">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="questionTitle" id="questionTitle">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="50" name="questionMemo" id="questionMemo"></textarea>
					</td>
				</tr>
			</table>
			<button type="button"id="btn">등록</button>
		</form>
		
		<hr>
	
		<h3>문의사항 목록</h3>
		<table border="1">
			<thead>
				<tr>
					<th>제목</th>
					<th>날짜</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="q" items="${list}">
              		<tr>
                		<td>
                			<a href="">${q.questionTitle}</a>
                		</td>
                		<td>${fn:substring(q.createdate,0,10) }</td>
                		<td>
		               		<c:choose> 
								<c:when test="${empty q.questionComment}">
									<a href="${pageContext.request.contextPath}/removeQuestion?questionNo=${q.questionNo}">삭제</a>
								</c:when> 
								<c:otherwise>
									<p>답변완료</p>
								</c:otherwise> 
							</c:choose> 
						</td>
              		</tr>
             	</c:forEach>
			</tbody>
		</table>
		
        <a href="${pageContext.request.contextPath}/questionList?currentPage=${currentPage-1}"> < </a>
        <c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/questionList?currentPage=${i}">${i}</a>
		</c:forEach>
        <a class="page-link" href="${pageContext.request.contextPath}/questionList?currentPage=${currentPage+1}"> > </a>
	</body>
</html>