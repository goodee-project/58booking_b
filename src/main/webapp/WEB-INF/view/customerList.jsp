<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 고객 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
 	<div>업체 고객 목록</div>
 	<table>
 		<thead>
 			<tr>
 				<th>고객아이디</th>
 				<th>고객이름</th>
 				<th>
 					<c:if test="${orderKind != 'bookingCountASC'}"><a href="${pageContext.request.contextPath}/company/customerList?currentPage=${currentPage}&orderKind=bookingCountASC">예약건수</a></c:if>
 					<c:if test="${orderKind == 'bookingCountASC'}"><a href="${pageContext.request.contextPath}/company/customerList?currentPage=${currentPage}&orderKind=bookingCountDESC">예약건수</a></c:if>
 				</th>
 				<th>
 					<c:if test="${orderKind != 'cancelCountASC'}"><a href="${pageContext.request.contextPath}/company/customerList?currentPage=${currentPage}&orderKind=cancelCountASC">취소/환불건수</a></c:if>
 					<c:if test="${orderKind == 'cancelCountASC'}"><a href="${pageContext.request.contextPath}/company/customerList?currentPage=${currentPage}&orderKind=cancelCountDESC">취소/환불건수</a></c:if> 				
 				</th>
 				<th>			
 					<c:if test="${orderKind != 'reviewCountASC'}"><a href="${pageContext.request.contextPath}/company/customerList?currentPage=${currentPage}&orderKind=reviewCountASC">리뷰건수</a></c:if>
 					<c:if test="${orderKind == 'reviewCountASC'}"><a href="${pageContext.request.contextPath}/company/customerList?currentPage=${currentPage}&orderKind=reviewCountDESC">리뷰건수</a></c:if>
 				</th>
 				<th>		
 					<c:if test="${orderKind != 'bookingTotalPriceASC'}"><a href="${pageContext.request.contextPath}/company/customerList?currentPage=${currentPage}&orderKind=bookingTotalPriceASC">누적사용금액</a></c:if>
 					<c:if test="${orderKind == 'bookingTotalPriceASC'}"><a href="${pageContext.request.contextPath}/company/customerList?currentPage=${currentPage}&orderKind=bookingTotalPriceDESC">누적사용금액</a></c:if>
 				</th>
 				<th>회원등급</th>
 			</tr>
 		</thead>
 		<tbody>
 			<c:forEach var="m" items="${list}">	
	 			<tr>
	 				<td>${m.customerId}</td>
	 				<td>${m.customerName}</td>
	 				<td>${m.bookingCount}</td>
	 				<td>${m.cancelCount}</td>
	 				<td>${m.reviewCount}</td>
	 				<td>${m.bookingTotalPrice}</td>
	 				<td>${m.customerRank}</td>
	 			</tr>
 			</c:forEach>
 		</tbody>
 	</table>
 	<!-- 페이징 -->
 		<!-- 이전 -->
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${startPage-10}&orderKind=${orderKind}">&laquo;</a>
		</c:if>
		<!-- 1~10 -->
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i == currentPage}">
				<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${i}&orderKind=${orderKind}">${i}</a>
			</c:if>
			<c:if test="${i != currentPage}">
				<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${i}&orderKind=${orderKind}">${i}</a>
			</c:if>
		</c:forEach>
        <!-- 다음 -->
		<c:if test="${currentPage+10 < lastPage}">
			<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${startPage+10}&orderKind=${orderKind}">
				<span>&raquo;</span>
			</a>
		</c:if>
</body>
</html>