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
		<title>예약 | 예약상세보기</title>
		
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
		
		<!-- swiper -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		
		<script>
			$(document).ready(function(){
				new Swiper('.swiper-container', {

					// ★동적로딩 설정
					lazy : {
						loadPrevNext : true // 이전, 다음 이미지는 미리 로딩
					},

					// 페이징 설정
					pagination : {
						el : '.swiper-pagination',
						clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
					},

					// 네비게이션 설정
					navigation : {
						nextEl : '.swiper-button-next', // 다음 버튼 클래스명
						prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
					},
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
	        <li class="breadcrumb-item active">예약 상세보기</li>
	      </ol>
	      
	      <div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-user"></i>고객정보</h2>
			</div>
			
			<div class="list_general">
				<c:forEach var="b" items="${list}" varStatus="i">
					<c:if test="${i.index == 0}">
						<table class="">
							<tr>
								<td rowspan="3" width="30px"></td>
								<th>예약자</th>
								<td rowspan="3" width="100px"></td>
								<td>${b.cusName}</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${b.customerPh}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${b.cusEmail}</td>
							</tr>
						</table>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<!-- /box_general-->
      	<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-clock-o"></i>예약정보</h2>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<c:if test="${img != null}">
							<div>
								<div class="swiper-container">
								    <div class="swiper-wrapper">
										<c:forEach var="i" items="${img}">
								      		<div class="swiper-slide">
								      			<img width = 100% src="${pageContext.request.contextPath}/upload/product/${i.productImg}">
								      		</div>
										</c:forEach>
								   </div>
									<!-- 네비게이션 버튼 -->
									<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
									<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
								
									<!-- 페이징 -->
									<div class="swiper-pagination"></div>
								</div>
							</div>
						</c:if>
				    </div>
				</div>
				<div class="col-md-8 add_top_30">
					<div class="list_general">
						<c:forEach var="b" items="${list}" varStatus="i">
							<table class="">
								<c:if test="${i.index == 0}">
									<tr>
										<td rowspan="3" width="30px"></td>
										<th>방문일</th>
										<td rowspan="3" width="100px"></td>
										<td>${b.date}</td>
									</tr>
									<tr>
										<th>결제금액</th>
										<td>${b.price}원</td>
									</tr>
									<tr>
										<th>상품</th>
										<td>${b.productName}</td>
									</tr>
									<tr>
										<td rowspan="5" width="30px"></td>
										<th>옵션</th>
								</c:if>
									<c:if test="${i.index >= 0}">
											<td rowspan="3" width="100px"></td>
											<td>${b.oName}</td>
									</c:if>
									</tr>
							</table>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- /box_general-->
		
		<c:forEach var="b" items="${list}" varStatus="i">
			<c:if test="${i.index == 0 && b.cancleMemo != null}">
				<div class="box_general padding_bottom">
					<div class="header_box version_2">
						<h2><i class="fa fa-clock-o"></i>취소</h2>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>사유</label>
								<textarea style="height:100px;" class="form-control" readonly="readonly">${b.cancleMemo}</textarea>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
		<!-- /box_general-->
		
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
	                <form id="cancelForm" method="post" action="${pageContext.request.contextPath}/company/modifyBooking">
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
