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
				let arr = []; //업체 휴무일 확인용
				let productArr = [];
			  	
			    var calendarEl = document.getElementById('calendar');
			    new Promise( (succ, fail)=>{
			        $.ajax({
			        url: "/58booking_b/productOffday?productNo=${productNo}",  
			        type: "get",
		        	success: function(result){
				        		 $.each(result, function(index, item) {
				        			 productArr.push(item.start);
				        			 let comOffday = item.title +" "+ item.start+"<br>"
				 		  		    $('#productOff').append(comOffday);
							  		});
						        }
			    	});
			    }).then((arg) =>{  
			        $.ajax({
			            url: '/58booking_b/companyOffday',
			            type: "get",
			        	success: function(result){
			        		 $.each(result, function(index, item) {
			        			 productArr.push(item.start);
			        			 let comOffday = item.title +" "+ item.start+"<br>"
			 		  		    $('#productOff').append(comOffday);
						  		});
					        }
			        });

			    });
			    
			 	// 기업 휴무일 가져오기 
			    var request = $.ajax({   			
					 method: 'get',
					 url: "/58booking_b/productOffday?productNo=${productNo}"
			    });
			    request.done(function(data){
			    	// 원래 휴무를 배열에 넣고 시작
			  	  $.each(data, function(index, item) {
			  		  arr.push(item.start);
			  		  let comOffday = item.title +" "+ item.start+"<br>"
 		  		      $('#productOff').append(comOffday);
			  		});
			    	
				    var calendar = new FullCalendar.Calendar(calendarEl, {
				      initialView: 'dayGridMonth'
				      , selectable: true
				      , events: data // 휴무일 넣어주기
				      , eventClick: function(info) {
					    	  $("#calendarModal").modal("show"); // modal 나타내기
				    	  }
				    
				      , dateClick: function(info){ // 버튼 클릭 시 이벤트 추가 모달
				    	  if(!arr.includes(info.dateStr)){ // 휴무일 배열에 없으면 실행
				    		  $("#calendarModal").modal("show"); // modal 나타내기
				    		  $("#calendar_start_date").attr("value", info.dateStr); // 모달에 클릭 날짜값
	                             //console.log(info.dateStr);
	                            $("#addCalendar").on("click",function(){  // modal 추가 버튼 클릭 시
	                                // 유효성검사
	                                var start_date = $("#calendar_start_date").val();
	                                var content = $("#calendar_content").val();
	                            	console.log(content);
	                                if(content != null && content != ""){
	                                	var obj = {
	                                        "title" : content,
	                                        "start" : start_date
	                                    }
	                                    // console.log(obj);
	                                	let productOffday = content +" "+ start_date+"<input type='hidden' name='productOffdayDate' value='"+start_date+"'> <input type='hidden' name='productOffdayMemo' value='"+content+"''>"+"<br>"
	                                    console.log(productOffday);
	                                    $('#productOff').append(productOffday);
	    		    		  			$("#calendar_content").val(""); // 모달에 클릭 날짜값
	                                    arr.push(info.dateStr);
		                                calendar.addEvent(obj);
	                                }
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
					$('#btn').click(function() {
						// 유효성 검사
						if($('#productName').val() == '') {
							alert('상품명을 입력해주세요');
							$('#productName').focus();
							return;
						} else if($('#productOptionName').val() == '') {
							alert('옵션명을 입력해주세요');
							$('#productOptionName').focus();
							return;
						} else if($('#productOptionMemo').val() == '') {
							alert('옵션 설명을 입력해주세요');
							$('#productOptionMemo').focus();
							return;
						} else if($('#productOptionPrice').val() == '') {
							alert('옵션가격을 입력해주세요');
							$('#productOptionPrice').focus();
							return;
						} else if($('#productPrice').val() == '') {
							alert('가격을 입력해주세요');
							$('#productPrice').focus();
							return;
						} else if($('#productMinPeople').val() == '') {
							alert('최소인원을 입력해주세요');
							$('#productMinPeople').focus();
							return;
						} else if($('#productMaxPeople').val() == '') {
							alert('최대인원을 입력해주세요');
							$('#productMaxPeople').focus();
							return;
						} 
						$('#addForm').submit();
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
	        <li class="breadcrumb-item active">Product One</li>
	      </ol>
	      <form id="addForm" method="post" action="${pageContext.request.contextPath}/company/productModify">
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-file"></i>상품상세보기</h2>
				</div>
				<!-- /row-->
				<c:forEach var="p" items="${list}">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>상품명</label>
								<input type="text" class="form-control" name="productName" id="productName" value="${p.productName}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>가격</label>
								<input type="text" class="form-control" placeholder="상품가격" name="productPrice" id="productPrice" value="${p.productPrice}">
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<c:if test="${img != null}">
								<c:forEach var="i" items="${img}">
									<img src="${pageContext.request.contextPath}/upload/product/${i.productImg}">
								</c:forEach>
							</c:if>
						
						</div>
					</div>
				</div>
				
			</div>
			<!-- /box_general-->
			
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-map-marker"></i>세부사항</h2>
				</div>
				<c:forEach var="p" items="${list}">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>최소 인원</label>
								<input type="text" class="form-control" name="productMinPeople" id="productMinPeople" value="${p.productMin}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>최대 인원</label>
								<input type="text" class="form-control"  name="productMaxPeople" id=productMaxPeople value="${p.productMax}">
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- /row-->
			</div>
			<!-- /box_general-->
			
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-clock-o"></i>상품 휴무</h2>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div id='calendar'></div>
							
					</div>
					<div class="col-md-6">
						<h4><i class="fa fa-clock-o"></i>상품휴무일</h4>
						<div id="productOff">
							
						</div>
					</div>
				</div>
			</div>
			<!-- /box_general-->
			
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-dollar"></i>옵션</h2>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h6>option</h6>
						<table id="pricing-list-container" style="width:100%;">
							<tr class="pricing-list-item">
								<td>
									<c:forEach var="o" items="${option}">
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="옵션명" name="productOptionName" id="productOptionName" value="${o.optionName}">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="설명" name="productOptionMemo" id="productOptionMemo" value="${o.optionMemo}">
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<input type="text" class="form-control"  placeholder="가격" name="productOptionPrice" id="productOptionPrice" value="${o.optionPrice}">
												</div>
											</div>
											<div class="col-md-2 d-flex align-items-center">
												<div class="form-group">
													<a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>
												</div>
											</div>
										</div>
									</c:forEach>
								</td>
							</tr>
						</table>
						<a href="#0" class="btn_1 gray add-pricing-list-item"><i class="fa fa-fw fa-plus-circle"></i>옵션추가</a>
						</div>
				</div>
				<!-- /row-->
			</div>
			<!-- /box_general-->
			</form>
			<p><a class="btn_1 medium" id="btn" >Save</a></p>
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
		<!-- modal 추가 -->
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
	                <div class="modal-body">
	                    <div class="form-group">
	                        <label for="taskId" class="col-form-label">휴무사유</label>
	                        <input type="text" class="form-control" id="calendar_content" name="calendar_content" value="">
	                        <label for="taskId" class="col-form-label">시작 날짜</label>
	                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date" value="" readonly="readonly">
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-warning" data-dismiss="modal" id="addCalendar">추가</button>
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
