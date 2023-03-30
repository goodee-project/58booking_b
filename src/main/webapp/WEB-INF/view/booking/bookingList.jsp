<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="Ansonika">
		<title>예약 | 예약</title>
		
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
		<link href="${pageContext.request.contextPath}/resources/admin_section/css/date_picker.css" rel="stylesheet">
		<!-- Your custom styles -->
		<link href="${pageContext.request.contextPath}/resources/admin_section/css/custom.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				// 예약번호, 상태
				let bookingNo = '';
				let state = '';
				
				// 취소모달 값 전달
				$(".btn_1").click(function(){
					bookingNo = $(this).data('id');
					state = $(this).data('state');
					date = $(this).data('date');
					po = $(this).data('po');
					name = $(this).data('name');
					$("#bookingNo").val(bookingNo);
			 	    //console.log(bookingNo);
			 	    //console.log(state);
			 	});
				
				// 취소 폼 유효성 검사
				$('#cancelBtn').click(function() {
					// 유효성 검사
					if($('#cancelMemo').val() == '') {
						$('#msg').text('취소사유를 입력 해주세요');
						$('#cancleMemo').focus();
						return;
					} else {
						$('#msg').text('');
					}
					$('#cancelForm').submit();
				});
				
				// 예약 확정 처리
				$('.approveBtn').click(function(){
					bookingNo = $(this).data('id');
					state = $(this).data('state');
					
					// vo로 POST
					$.ajax({ // 컨트롤러와 통신	    			
						 type: 'POST',
						 url: "/58booking_b/company/modifyBooking",
						 data: {"bookingNo" : bookingNo, "bookingState" : state},
						 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						 success: function(data) {
							 alert("예약 승인 완료");
							 document.location.reload(); // 승인완료 후 페이지리로드
						},
						error: function(jqXHR, textStatus, errorThrown) {
							alert("ERROR");
						},
					});
				});
				
				// 정렬
				$('#orderby').change(function() {
					$('#orderbyForm').submit();
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
	          <a href="#">Dashboard</a>
	        </li>
	        <li class="breadcrumb-item active">Bookings list</li>
	      </ol>
			<div class="box_general">
				<div class="header_box">
					<h2 class="d-inline-block">Bookings list</h2>
			          <div class="styled-select short">
		          		<form id="orderbyForm" method="get" action="${pageContext.request.contextPath}/company/bookingList">
		  					<select name="order" id="orderby">
		  						<option>모두보기</option>
		  						<option value="예약확정">예약확정</option>
		  						<option value="예약승인대기">예약승인대기</option>
		  						<option value="방문완료">방문완료</option>
		  						<option value="취소">취소</option>
		  					</select>
		          		</form>
					</div>
					<input type="text" class="form-group form-control" placeholder="search" name="search" id="search">
				</div>
				
				<div class="list_general" >
					<ul>
						<c:forEach var="b" items="${list}">
							<li>
								<figure><img src="${pageContext.request.contextPath}/upload/product/${b.img}" alt=""></figure>
								<h4><a href="${pageContext.request.contextPath}/company/bookingOne?requestDate=${b.requestDate}&bookingDate=${b.date}&productNo=${b.productNo}">${b.productName}</a>
									<c:choose> 
										<c:when test="${b.state eq '예약확정'}">
											<i class="approved">확정</i>									
										</c:when> 
										<c:when test="${b.state eq '예약승인대기'}">
											<i class="pending">대기</i>									
										</c:when> 
										<c:when test="${b.state eq '취소'}">
											<i class="cancel">취소</i>									
										</c:when> 
										<c:when test="${b.state eq '방문완료'}">
											<i class="approved">완료</i>									
										</c:when> 
									</c:choose> 
								</h4>
								<ul class="booking_list">
									<li><strong>예약자 성함</strong> ${b.cusName}</li>
									<li><strong>예약자 연락처</strong> ${b.customerPh} - ${b.cusEmail}</li>
									<li><strong>예약상품</strong> ${b.productName}</li>
									<li><strong>방문일</strong> ${fn:substring(b.date,0,16)}</li>
									<li><strong>인원</strong> ${b.people}명</li>
									<li><strong>결제금액</strong> ${b.price}원</li>
								</ul>
								
								<ul class="buttons">
									<c:choose> 
										<c:when test="${b.state eq '예약확정'}">
											<li><a class="btn_1 gray delete" data-toggle="modal" data-target="#cancelModal" data-id="${b.bookingNo}" data-state="취소">
													<i class="fa fa-fw fa-times-circle-o"></i> Cancel
												</a>
											</li>										
										</c:when> 
										<c:when test="${b.state eq '예약승인대기'}">
											<li><a class="btn_1 gray approve approveBtn" id="approveBtn" data-id="${b.bookingNo}" data-state="예약확정"><i class="fa fa-fw fa-check-circle-o"></i> Approve</a></li>
											<li><a class="btn_1 gray delete" data-toggle="modal" data-target="#cancelModal" data-id="${b.bookingNo}"><i class="fa fa-fw fa-times-circle-o"></i> Cancel</a></li>									
										</c:when> 
										<c:when test="${b.state eq '취소' || b.state eq '방문완료'}">
										</c:when> 
									</c:choose> 
								</ul>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- /box_general-->
			<nav aria-label="...">
				<ul class="pagination pagination-sm add_bottom_30">
					<li class="page-item disabled">
						<a class="page-link" href="" tabindex="-1">Previous</a>
					</li>
					<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/company/bookingList?currentPage=${i}">${i}</a>
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
		  <!-- /container-fluid-->
	   	</div>
	    <!-- /container-wrapper-->
	    <footer class="sticky-footer">
	      <div class="container">
	        <div class="text-center">
	          <small>Copyright © PANAGEA 2021</small>
	        </div>
	      </div>
	    </footer>
	    <!-- Scroll to Top Button-->
	    <a class="scroll-to-top rounded" href="#page-top">
	      <i class="fa fa-angle-up"></i>
	    </a>
	    <!-- Booking/order Modal -->
	    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="client_detail_modalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="client_detail_modalLabel">예약 취소</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <form id="cancelForm" method="post" action="${pageContext.request.contextPath}/company/cancelBooking">
		                <div class="modal-body">
		                    <div class="row">
		                        <div class="col-md-6">
		                            <div class="form-group">
		                                <label>취소사유</label>
		                                <p id="msg" style="color: red;"></p>
		                                <input type="text" class="form-control" name="cancelMemo" id="cancelMemo">
		                                <input type="hidden" value="업체" name="cancelSubject">
		                                <input type="hidden" value="" name="bookingNo" id="bookingNo">
		                                <input type="hidden" value="취소" name="bookingState" id="bookingState">
		                            </div>
		                        </div>
		                    </div>
		                    <!-- /Row -->
		                </div>
		                <div class="modal-footer">
		                    <a class="btn btn-primary" id="cancelBtn">Save</a>
		                </div>
	                </form>
	            </div>
	        </div>
	    </div>

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
    <script src="${pageContext.request.contextPath}/resources/admin_section/vendor/bootstrap-datepicker.js"></script>
    <script>
    $('input.date-pick').datepicker();
    </script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/admin_section/js/admin.js"></script>
	
	</body>
</html>
