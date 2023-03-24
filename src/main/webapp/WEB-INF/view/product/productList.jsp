<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="Ansonika">
		<title>예약 | 상품</title>
		
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
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				// 예약번호, 상태
				let productNo  = '';
				let open = '';
				
				// 비공개->공개 처리
				$('.deleteBtn').click(function(){
					productNo = $(this).data('id');
					open = $(this).data('open');
					//console.log(productNo + " : " + open );
					
					// vo로 POST
					$.ajax({    			
						 type: 'POST',
						 url: "/58booking_b/company/modifyProduct",
						 data: {"productNo" : productNo, "productOpen" : open},
						 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						 success: function(data) {
							 alert(open + "로 변경 완료");
							 document.location.reload(); // 승인완료 후 페이지리로드
						},
						error: function(jqXHR, textStatus, errorThrown) {
							alert("ERROR");
						},
					});
				});
				
				// 비공개->공개 처리
				$('.approveBtn').click(function(){
					productNo = $(this).data('id');
					open = $(this).data('open');
					// console.log(productNo + " : " + open );
					
					// vo로 POST
					$.ajax({    			
						 type: 'POST',
						 url: "/58booking_b/company/modifyProduct",
						 data: {"productNo" : productNo, "productOpen" : open},
						 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						 success: function(data) {
							 alert(open + "로 변경 완료");
							 document.location.reload(); // 승인완료 후 페이지리로드
						},
						error: function(jqXHR, textStatus, errorThrown) {
							alert("ERROR");
						},
					});
				});
			
			});
		</script>
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
	          <a href="${pageContext.request.contextPath}/index">Dashboard</a>
	        </li>
	        <li class="breadcrumb-item active">상품목록</li>
	      </ol>
	      <div class="wrapper-grid">
	      	<div class="d-flex justify-content-end">
				<a class="btn_1 mb-3" href="${pageContext.request.contextPath}/company/addProduct">+ 예약상품 등록하기</a>
			</div>
			<div class="row">
				<c:forEach var="p" items="${list}">
					<div class="col-xl-3 col-lg-6 col-md-6" >
						<div class="box_general padding_bottom" style="height: 600px;">
							<div class="box_grid">
								<div class="wrapper">
									<div class="text-center sm">
										<c:choose>
									        <c:when test="${p.reviewRating > 3}">
									            &#11088;&#11088;&#11088;&#11088;
									        </c:when>
									        <c:when test="${p.reviewRating > 2}">
									            &#11088;&#11088;&#11088;
									        </c:when>
									        <c:when test="${p.reviewRating > 1}">
									            &#11088;&#11088;
									        </c:when>
									        <c:when test="${p.reviewRating > 0}">
									            &#11088;
									        </c:when>
									        <c:when test="${p.reviewRating == null}">
									        </c:when>
									    </c:choose>
										<div>
											<h5 class="text-center">
												<a href="${pageContext.request.contextPath}/company/productOne?productNo=${p.productNo}">${p.name}</a>
											</h5>
											<strong>${p.reviewCount}</strong> Reviews
											<br>
											<strong>${p.bookingCount}</strong>건 예약
											
										</div>
									</div>
								</div>
								<div class="text-center">
									<hr>
									<a href="${pageContext.request.contextPath}/company/productOne?productNo=${p.productNo}">
										<img src="${pageContext.request.contextPath}/upload/product/${p.img}" class="img-fluid" alt="" >
									</a>
									<div class="mt-2">
										<c:choose> 
											<c:when test="${p.open eq '공개'}">
												<a class="btn_1 gray approve approveBtn sm" data-id="${p.productNo}" data-open="비공개"><i class="fa fa-fw fa-times-circle-o"></i>공개중</a>
											</c:when> 
											<c:when test="${p.open eq '비공개'}">
												<a class="btn_1 gray delete deleteBtn" data-id="${p.productNo}" data-open="공개"><i class="fa fa-fw fa-times-circle-o"></i>비공개중</a>								
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
						<!-- /box_grid -->
					</div>
				</c:forEach>
			</div>
			<!-- /row -->
			<div class="d-flex justify-content-center">
				<nav aria-label="...">
					<ul class="pagination pagination-sm add_bottom_30">
						<li class="page-item disabled">
							<a class="page-link" href="" tabindex="-1">Previous</a>
						</li>
						<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/company/productList?currentPage=${i}">${i}</a>
							</li>
						</c:forEach>
						<li class="page-item">
						</li>
						<li class="page-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>
				<!-- /pagination-->
			</div>
		  </div>
		<!-- /wrapper-grid -->
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
