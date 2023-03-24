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
		<title>예약 | 상품관리</title>
		
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
		
		<!-- fullcalender -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
		<script>
			  document.addEventListener('DOMContentLoaded', function() {
				let arr = []; //휴무일 확인용
				let productArr = []; // 상품 휴무일 확인용
			  	
			    var calendarEl = document.getElementById('calendar');
			 	// 전체 휴무일 가져오기 
			    var request = $.ajax({   			
					 method: 'get',
					 url: "/58booking_b/offdayT?productNo=${productNo}"
			    });
			    request.done(function(data){
			    	// 원래 휴무를 배열에 넣고 시작
			  	  $.each(data, function(index, item) {
			  		  arr.push(item.start);
			  		});
			    	
				    var calendar = new FullCalendar.Calendar(calendarEl, {
				      initialView: 'dayGridMonth'
				      , selectable: true
				      , events: data // 휴무일 넣어주기
				      , dateClick: function(info){ // 버튼 클릭 시 이벤트 추가 모달
				    	  if(!arr.includes(info.dateStr)){ // 휴무일 배열에 없으면 실행
				    		  $("#calendarModal").modal("show"); // modal 나타내기
				    		  $("#calendar_start_date").attr("value", info.dateStr); // 모달에 클릭 날짜값
	                             //console.log(info.dateStr);
	                            $("#addCalendar").on("click",function(){  // modal 추가 버튼 클릭 시
	                                // 유효성검사
	                                $('#offdayAddForm').submit();
	                            });
				    	  }else{
				    		  alert('이미 휴무일로 지정된 날입니다.');
				    	  }
                        }
				    
				    });
					calendar.render();
			    });
			});
			  
		  $(document).ready(function(){
			  	// 휴무일 수정
			  	$(".btn_2").click(function(){
					offdayNo = $(this).data('id');
					date = $(this).data('date');
					title = $(this).data('title');
					$("#offdayNo").val(offdayNo);
					$("#offdayTitle").val(title);
					$("#offday").val(date);
			 	});
			  	$("#modifyCalendar").click(function(){
			  		console.log('휴무일 수정 폼 클릭');
					$('#offdayModifyForm').submit();
			 	});
			  	
			  	// 옵션 수정
			  	$(".btn_4").click(function(){
					$("#productOptionNo").val($(this).data('id'));
					$("#productOptionMemo").val($(this).data('memo'));
					$("#productOptionPrice").val($(this).data('price'));
					$("#productOptionName").val($(this).data('name'));
      		 		console.log($(this).data('id'));
			 	});
      		 	$("#modifyOption").click(function(){
					$('#optionModifyForm').submit();
			 	});
      		 	
				// 옵션추가
      		 	$("#optionAddBtn").click(function(){
					$('#optionAddForm').submit();
			 	});
				
				$('#btn').click(function() {
					$('#modifyForm').submit();
					alert("수정완료");
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
	        <li class="breadcrumb-item active">Product details</li>
	      </ol>
	      <div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-user"></i>Product details</h2>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<c:if test="${img != null}">
							<div>
								<c:forEach var="i" items="${img}">
									<img src="${pageContext.request.contextPath}/upload/product/${i.productImg}" width="200px">
								</c:forEach>
							</div>
						</c:if>
				    </div>
				</div>
				<c:forEach var="p" items="${list}">
				<div class="col-md-8 add_top_30">
					<form id="modifyForm" method="post" action="${pageContext.request.contextPath}/company/productModify">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>상품명</label>
									<input type="text" class="form-control" name="productName" id="productName" value="${p.productName}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>상품가격</label>
									<input type="text" class="form-control" name="productPrice" id="productPrice" value="${p.productPrice}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>공개여부</label>
									<select class="form-control" name="productOpen">
										<c:choose> 
											<c:when test="${p.open eq '공개'}">
												<option selected="selected" value="공개">공개</option>
												<option value="비공개">비공개</option>
											</c:when> 
											<c:when test="${p.open eq '비공개'}">
												<option value="공개">공개</option>
												<option selected="selected" value="비공개">비공개</option>
											</c:when>
										</c:choose> 
									</select>
								</div>
							</div>
						</div>
						<!-- /row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>최소인원</label>
									<input type="text" class="form-control" name="productMinPeople" id="productMinPeople" value="${p.productMin}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>최대인원</label>
									<input type="text" class="form-control" name="productMaxPeople" id=productMaxPeople value="${p.productMax}">
									<input type="hidden" class="form-control" name="productNo" value="${p.productNo}">
								</div>
							</div>
						</div>
						<div class="col-md-12 mb-3 text-center">
							<a class="btn_1 medium" id="btn">수정</a>
						</div>
					</form>
					<!-- /row-->
					
					<div class="row">
						<div class="col-md-12">
							<div class="box_general padding_bottom">
								<div class="header_box version_2">
									<h2>Option</h2>
									<a class="btn_1" data-toggle='modal' data-target='#optionAdd'>옵션추가</a>
								</div>
								<table class="" id="pricing-list-container" style="width:100%;">
									<c:forEach var="o" items="${option}">
										<tr>
											<td>${o.optionName}</td>
											<td>${o.optionMemo}</td>
											<td>${o.optionPrice}</td>
											<td>
												<a class='btn_4' id='modifyBtn' data-toggle='modal' data-target='#optionModify' data-id="${o.optionNo}" data-name="${o.optionName}" data-memo="${o.optionMemo}" data-price="${o.optionPrice}"><i class='fa fa-fw fa-pencil'></i></a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<!-- /row-->
				</div>
				</c:forEach>
			</div>
		</div>
		
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-clock-o"></i>Product Offday</h2>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div id='calendar'></div>
							
					</div>
					<div class="col-md-6">
						<h5><i class="fa fa-clock-o"></i>상품휴무일 수정</h5>
						<c:forEach var="off" items="${offday}">
							<div class="tags">
								${off.memo}	${off.offday}	 			
								<a class='btn_2' id='modifyBtn' data-toggle='modal' data-target='#offdayModify' data-id="${off.offdayNo}" data-date="${off.offday}" data-title="${off.memo}"><i class='fa fa-fw fa-pencil'></i></a>
								<a class="btn_3 delete" href="${pageContext.request.contextPath}/company/produtOffdayRemove?productNo=${productNo}&productOffdayNo=${off.offdayNo}"><i class="fa fa-fw fa-remove"></i></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /box_general-->
		  </div>
		  <!-- /.container-fluid-->
	   	</div>
	    <!-- /.container-wrapper-->
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
	   
		<!-- 휴무일 추가 modal -->
	    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">휴무일을 입력하세요.</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <form id="offdayAddForm" method="post" action="${pageContext.request.contextPath}/company/produtOffdayAdd">
	                <div class="modal-body">
	                    <div class="form-group">
	                        <label for="taskId" class="col-form-label">휴무사유</label>
	                        <input type="text" class="form-control" id="calendar_content" name="productOffdayMemo">
	                        <label for="taskId" class="col-form-label">날짜</label>
	                        <input type="date" class="form-control" id="calendar_start_date" name="productOffdayDate" value="" readonly="readonly">
	                        <input type="hidden" class="form-control" id="calendar_start_date" name="productNo" value="${productNo}">
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-warning" data-dismiss="modal" id="addCalendar">추가</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
	                </div>
	    			</form>
	            </div>
	        </div>
	    </div>
	    
		<!-- 휴무일 수정 modal -->
	    <div class="modal fade" id="offdayModify" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">휴무일수정</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <form id="offdayModifyForm" method="post" action="${pageContext.request.contextPath}/company/produtOffdayModify">
		                <div class="modal-body">
		                    <div class="form-group">
		                        <label for="taskId" class="col-form-label">휴무사유</label>
		                        <input type="text" class="form-control" id="offdayTitle" name="productOffdayMemo" value="">
		                        <label for="taskId" class="col-form-label">날짜</label>
		                        <input type="date" class="form-control" id="offday" name="productOffdayDate" value="">
		                        <input type="hidden" class="form-control" id="offdayNo" name="productOffdayNo" value="">
		                        <input type="hidden" class="form-control" name="productNo" value="${productNo}">
		                    </div>
		                </div>
	                </form>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-warning" data-dismiss="modal" id="modifyCalendar">수정</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
	                </div>
	    
	            </div>
	        </div>
	    </div>
	    
		<!-- 옵션 수정 modal -->
	    <div class="modal fade" id="optionModify" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">옵션수정</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <form id="optionModifyForm" method="post" action="${pageContext.request.contextPath}/company/optionModify">
		                <div class="modal-body">
		                    <div class="form-group">
		                        <label for="taskId" class="col-form-label">이름</label>
		                        <input type="text" class="form-control" id="productOptionName" name="productOptionName" value="">
		                        <label for="taskId" class="col-form-label">설명</label>
		                        <input type="text" class="form-control" id="productOptionMemo" name="productOptionMemo" value="">
		                        <label for="taskId" class="col-form-label">가격</label>
		                        <input type="text" class="form-control" id="productOptionPrice" name="productOptionPrice" value="">
		                        <input type="hidden" class="form-control" id="productOptionNo" name="productOptionNo" value="">
		                        <input type="hidden" class="form-control" name="productNo" value="${productNo}">
		                    </div>
		                </div>
	                </form>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-warning" data-dismiss="modal" id="modifyOption">수정</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    
		<!-- 옵션 추가 modal -->
	    <div class="modal fade" id="optionAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">옵션추가</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <form id="optionAddForm" method="post" action="${pageContext.request.contextPath}/company/optionAdd">
		                <div class="modal-body">
		                    <div class="form-group">
		                        <label for="taskId" class="col-form-label">이름</label>
		                        <input type="text" class="form-control" id="productOptionName" name="productOptionName">
		                        <label for="taskId" class="col-form-label">설명</label>
		                        <input type="text" class="form-control" id="productOptionMemo" name="productOptionMemo">
		                        <label for="taskId" class="col-form-label">가격</label>
		                        <input type="text" class="form-control" id="productOptionPrice" name="productOptionPrice">
		                        <input type="hidden" class="form-control" name="productNo" value="${productNo}">
		                    </div>
		                </div>
	                </form>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-warning" data-dismiss="modal" id="optionAddBtn">추가</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
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
