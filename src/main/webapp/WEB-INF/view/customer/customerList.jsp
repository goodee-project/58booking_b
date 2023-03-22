<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Ansonika">
	<title>예약 | 고객 목록</title>

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
			$('#btn').click(function(){
				$('#form').submit();
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
	        <li class="breadcrumb-item active">고객 관리</li>
	      </ol>
		<!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>고객 목록</div>
        <div class="card-body">
          <div class="table-responsive">
          	<!-- 검색창 -->
          	<div class="add_top_30 add_bottom_30 d-flex justify-content-end">
	          	<form class="form-inline my-2 my-lg-0" method="get" action="${pageContext.request.contextPath}/company/customerList" id="form">
		            <div class="input-group">
		             <span class="styled-select w-25">
		              <select name="optionWord">
		              	<option value="id">아이디</option>
		              	<option value="name">이름</option>
		              </select>
		            </span>
		              <input class="form-control search-top col-6" type="text" placeholder="검색" name="searchWord">
		              <span class="input-group-btn">
		                <button class="btn btn-primary" type="button" id="btn">
		                  <i class="fa fa-search"></i>
		                </button>
		              </span>
		            </div>
	          	</form>
          	</div>
          	<!-- 테이블 -->
		 	<table class="table table-bordered add_bottom_30" width="100%" cellspacing="0">
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
		   </div>
		 	<!-- 페이징 -->
		 	<ul class="pagination pagination-sm add_bottom_30 justify-content-center">
				<!-- 이전 -->
				<c:if test="${currentPage <= 10}">
					<li class="page-item disabled">
						<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${startPage-10}&orderKind=${orderKind}&optionWord=${optionWord}&searchWord=${searchWord}" class="page-link">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage > 10}">
					<li class="page-item">
						<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${startPage-10}&orderKind=${orderKind}&optionWord=${optionWord}&searchWord=${searchWord}" class="page-link">&laquo;</a>
					</li>
				</c:if>
				<!-- 1~10 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage-1}">
					<c:if test="${i == currentPage}">
						<li class="page-item active">
							<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${i}&orderKind=${orderKind}&optionWord=${optionWord}&searchWord=${searchWord}" class="page-link">${i}</a>
						</li>
					</c:if>
					<c:if test="${i != currentPage}">
						<li class="page-item">
							<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${i}&orderKind=${orderKind}&optionWord=${optionWord}&searchWord=${searchWord}" class="page-link">${i}</a>
						</li>
					</c:if>
				</c:forEach>
			    <!-- 다음 -->
				<c:if test="${currentPage+10 < lastPage}">
					<li class="page-item">
						<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${startPage+10}&orderKind=${orderKind}&optionWord=${optionWord}&searchWord=${searchWord}"  class="page-link">&raquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage+10 >= lastPage}">
					<li class="page-item disabled">
						<a href="${pageContext.request.contextPath}/company/customerList?currentPage=${startPage+10}&orderKind=${orderKind}&optionWord=${optionWord}&searchWord=${searchWord}"  class="page-link">
							<span>&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
        </div>
       </div>
      </div>
     </div>
 	
		
	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="#0">Logout</a>
          </div>
        </div>
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