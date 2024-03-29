<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Ansonika">
<title>예약 | 신고통계</title>
<!-- Favicons-->
<link rel="shortcut icon" href="img/favicon.ico" type="${pageContext.request.contextPath}/resources/admin_section/image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-144x144-precomposed.png">

<!-- GOOGLE WEB FONT -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- Bootstrap core CSS-->
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Main styles -->
<link href="${pageContext.request.contextPath}/resources/admin_section/css/admin.css" rel="stylesheet">
<!-- Icon fonts-->
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- Plugin styles -->
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/dropzone.css" rel="stylesheet">
<!-- WYSIWYG Editor -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_section/js/editor/summernote-bs4.css">
<!-- Your custom styles -->
<link href="${pageContext.request.contextPath}/resources/admin_section/css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body class="fixed-nav sticky-footer" id="page-top">

	<!-- Navigation-->
	<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
	<!-- /Navigation-->
	
	<div class="content-wrapper">
		<div class="container-fluid">
		
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/index">Home</a>
				</li>
				<li class="breadcrumb-item active">신고 통계</li>
			</ol>
			
			<!-- 본문 입력 -->
			<div class="box_general">
				<!-- 신고건수 -->
				<div class="mx-3 mb-3">
					<h3>신고 <span style="color:red; font-size:2rem;">${cnt}</span>건</h3>
				</div>

				<!-- 테이블 -->
				<table class="table text-center">
					<tr>
						<th class="w-25">예약상품명</th>
						<th class="w-50">신고내용</th>
						<th class="w-25">신고날짜</th>
					</tr>
					<c:if test="${fn:length(reportList) == 0}">
						<tr>
							<td colspan="3">받은 신고 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${fn:length(reportList) > 0}">
						<c:forEach items="${reportList}" var="r">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath}/company/productOne?productNo=${r.productNo}">${r.productName}</a>
								</td>
								<td class="text-left">${r.reportMemo}</td>
								<td>${r.createdate}</td>							
							</tr>
						</c:forEach>
					</c:if>
				</table>
				
				<!-- 페이징 -->
				<div class="pb-2 pt-1">
					<nav aria-label="...">
						<ul class="pagination pagination-sm add_bottom_30">
						
							<!-- 이전 -->
							<c:if test="${currentPage == 1}">
								<li class="page-item disabled">
									<a class="page-link">Previous</a>
								</li>
							</c:if>
							<c:if test="${currentPage > 1}">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/company/statistics/reportStatistics?currentPage=${currentPage-1}">Previous</a>
								</li>
							</c:if>
							
							<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
								<c:if test="${currentPage == i}">
									<li class="page-item disabled">
										<a class="page-link">${i}</a>
									</li>
								</c:if>
								<c:if test="${currentPage != i}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/company/statistics/reportStatistics?currentPage=${i}">${i}</a>
									</li>
								</c:if>
							</c:forEach>
							
							<!-- 다음 -->
							<c:if test="${lastPage == currentPage}">
								<li class="page-item disabled">
									<a class="page-link">Next</a>
								</li>
							</c:if>
							
							<c:if test="${lastPage > currentPage}">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/company/statistics/reportStatistics?currentPage=${currentPage+1}">Next</a>
								</li>
							</c:if>
							
						</ul>
					</nav>
				</div>
				
			</div><!-- 본문 끝 -->
		</div>
	</div>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/admin_section/js/admin.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery.magnific-popup.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/admin_section/js/admin.js"></script>
<!-- Custom scripts for this page-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/dropzone.min.js"></script>
</body>
</html>