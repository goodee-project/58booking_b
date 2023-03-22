<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Ansonika">
<title>예약 | 전체통계</title>
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
				<li class="breadcrumb-item active">전체 통계</li>
			</ol>
			
			<!-- 본문 입력 -->
			
			<!-- 상위 항목 : 목록별 건수 -->
			<div class="row">
				<!-- 신규건수(대기) -->
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card dashboard o-hidden bg-success h-100">
						<div class="card-body">
							<div class="text-center">
								<h5>신규예약</h5>
								<br>
								<h2 class="text-white">${bookingMap.newBooking} 건</h2>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 확정건수(확정) -->
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card dashboard o-hidden bg-success h-100">
						<div class="card-body">
							<div class="text-center">
								<h5>예약확정</h5>
								<br>
								<h2 class="text-white">${bookingMap.confirmedBooking} 건</h2>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 방문완료건수(완료) -->
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card dashboard o-hidden bg-success h-100">
						<div class="card-body">
							<div class="text-center">
								<h5>방문완료</h5>
								<br>
								<h2 class="text-white">${bookingMap.finishedBooking} 건</h2>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 취소 및 환불건수 -->
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card dashboard o-hidden bg-success h-100">
						<div class="card-body">
							<div class="text-center">
								<h5>취소</h5>
								<br>
								<h2 class="text-white">${bookingMap.canceledBooking} 건</h2>
							</div>
						</div>
					</div>
				</div>
			</div><!-- 상위 항목 끝 -->
			
			<!-- 중간 항목 : 전체 별점(별점별 건수), 인기상품 순위, 별점 높은 상품 순위 -->
			<div class="row">
				<!-- 전체 별점(별점별 건수) -->
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card o-hidden h-100">
						<table class="table table-borderless text-center">
							<tr>
								<td colspan="2" class="pt-4 pb-4">
									<h2>총 ${starRatingMap.totalAvg} 점</h2>
								</td>
							</tr>
							<tr>
								<th class="w-50">전체평가건수</th>
								<th>${starRatingMap.totalCnt} 건</th>
							</tr>
							<c:forEach items="${starRatingList}" var="list">
								<tr>
									<c:if test="${list.starRating == 5}">
										<td class="rating">
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
										</td>
									</c:if>
									<c:if test="${list.starRating == 4}">
										<td class="rating">
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star"></i>
										</td>
									</c:if>
									<c:if test="${list.starRating == 3}">
										<td class="rating">
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star"></i>
											<i class="fa fa-fw fa-star"></i>
										</td>
									</c:if>
									<c:if test="${list.starRating == 2}">
										<td class="rating">
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star"></i>
											<i class="fa fa-fw fa-star"></i>
											<i class="fa fa-fw fa-star"></i>
										</td>
									</c:if>
									<c:if test="${list.starRating == 1}">
										<td class="rating">
											<i class="fa fa-fw fa-star yellow"></i>
											<i class="fa fa-fw fa-star"></i>
											<i class="fa fa-fw fa-star"></i>
											<i class="fa fa-fw fa-star"></i>
											<i class="fa fa-fw fa-star"></i>
										</td>
									</c:if>
									<td>${list.cnt} 건</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				
				<!-- 인기상품 -->
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card o-hidden h-100">
						<table class="table table-borderless text-center">
							<tr>
								<td colspan="2" class="pt-4 pb-4">
									<h2>인기상품</h2><!-- 구매 건수 많은 순 -->
								</td>
							</tr>
							<tr>
								<td>1위</td>
								<td>40건</td>
							</tr>
							<tr>
								<td>2위</td>
								<td>40건</td>
							</tr>
							<tr>
								<td>3위</td>
								<td>40건</td>
							</tr>
							<tr>
								<td>4위</td>
								<td>40건</td>
							</tr>
							<tr>
								<td>5위</td>
								<td>40건</td>
							</tr>
						</table>
					</div>
				</div>
				
				<!-- 평점순 -->
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card o-hidden h-100">
						<table class="table table-borderless text-center">
							<tr>
								<td colspan="2" class="pt-4 pb-4">
									<h2>평점 순</h2><!-- 평점 높은 순 -->
								</td>
							</tr>
							<tr>
								<td>1위</td>
								<td>40건</td>
							</tr>
							<tr>
								<td>2위</td>
								<td>40건</td>
							</tr>
							<tr>
								<td>3위</td>
								<td>40건</td>
							</tr>
							<tr>
								<td>4위</td>
								<td>40건</td>
							</tr>
							<tr>
								<td>5위</td>
								<td>40건</td>
							</tr>
						</table>
					</div>
				</div>
			</div><!-- 중간 항목 끝 -->
			
			<!-- 전체크기 박스 -->
			<div class="box_general">
			</div><!-- 전체크기 박스 끝 -->
			
		</div><!-- 본문 끝 -->
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