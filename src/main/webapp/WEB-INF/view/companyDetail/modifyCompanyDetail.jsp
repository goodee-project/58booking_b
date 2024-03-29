<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Ansonika">
	<title>예약 | 업체 상세정보</title>
	
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
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>

	<script>
		// fullCalendar
		document.addEventListener('DOMContentLoaded', function() {
			let arr = [];
			let idx = 0;
			let previousOffday = [];	// 이전 휴무일
			let bookingDateArr = [];	// 수정일 이후 예약일
			//let check = true;
			
		  var calendarEl = document.getElementById('calendar');
		  var request = $.ajax({
		      url: "/58booking_b/offday"
		      , method: "GET"
		  });
		  // 이미 예약된 날짜
		  var bookingDate = $.ajax({
		      url: "/58booking_b/bookingDate"
		          , method: "GET"
		          , success:function(model){
		        	  for(let i = 0; i < model.length; i++){
		        		  bookingDateArr.push(model[i]);
		        	  }
		          }
		      });
		  request.done(function(data){
			  // 원래 휴무를 배열에 넣고 시작
			  $.each(data, function(index, item) {
				  previousOffday.push(item.start);
				// 나중에 hidden으로 바꾸기
			    	let offday = "<input type='hidden' name='companyOffdayDate' value='"+item.start+"' id='offday"+idx+"'>";
				    $('#targetCal').append(offday);
				    let reason = "<input type='hidden' name='companyOffdayMemo' value='"+item.title+"' id='reason"+idx+"'>";
				    $('#targetCal').append(reason);
				      
				    idx++;
				});
			  
			    var calendar = new FullCalendar.Calendar(calendarEl, {
			      locale: 'ko'
			      , dayMaxEventRows: 1
			      , initialView: 'dayGridMonth'
			      , selectable: true
			      , events: data
			      , dateClick: function(info) { 
		    		  // 예약 여부 확인
		    		  for(let i = 0; i < bookingDateArr.length; i++){
		    			  if(info.dateStr == bookingDateArr[i]){
		    				  alert('이미 예약되어 있는 날짜입니다. 예약 취소 후 휴무일로 지정해 주세요.');
		    				  //check = false;
		    				  return;
		    			  }
		    		  }
		    		  
			    	  // 휴무 사유 유효성 검사 후		    		  
			    	  if($('#memo').val().length < 1 || $('#memo').val().trim() == '' || $('#memo').val() == '정기휴무'){	
						alert('휴무 사유를 입력해 주세요.(정기휴무 제외)');
						//check = false;
			    		return;
			    	  }
			    	  
			    	  // 위에서 예약날짜 거르므로 조건 추가할 필요 없음
			    	  if(!arr.includes(info.dateStr)){
			    		  
				    	  calendar.addEvent({'title':$('#memo').val(), 'start': info.dateStr});
				    	  arr.push(info.dateStr);
				    	  
				    	    // 나중에 hidden으로 바꾸기
					    	offday = "<input type='hidden' name='companyOffdayDate' value='"+info.dateStr+"' id='offday"+idx+"'>";
						    $('#targetCal').append(offday);
						    reason = "<input type='hidden' name='companyOffdayMemo' value='"+$('#memo').val()+"' id='reason"+idx+"'>";
						    $('#targetCal').append(reason);
						      
						    idx++;
			    	  }else{
			    		  alert('이미 휴무일로 지정된 날입니다.');
			    	  }
			    	  
			      }
			      , eventClick: function(info){
			    	  info.event.remove();
			    	  let filtered = arr.filter((element) => element !== info.event.startStr);	// 특정 요소 삭제
			      	  arr = filtered;
			    	  // 이 페이지에서 새롭게 휴무 추가
			    	  if(idx > 0){
				    	  for(let i = 0; i < idx+1; i++){
				    		  if(info.event.startStr == $('#offday'+i).val()){
					    		  $('#offday'+i).val('');
					    		  $('#reason'+i).val('');
				    		  }
				    	  }	    		  
			    	  }
			    	  /* console.log(workingIdx+"<====workingIdx");
			    	  if(workingIdx > 0){
			    		  for(let i = 0; i < workingIdx+1; i++){
				    		  if(info.event.startStr == $('#workingday'+i).val()){
					    		  $('#workingday'+i).val('');
				    		  }
				    	  }	   
			    	  } */
			    	  
			    	  let filteredPO = [];
			    	  
			    	  // 삭제할 날 == 이전에 휴무일이었지만 해제한 날(정기휴무 제외)
			    	  if(previousOffday.includes(info.event.startStr)){	
			    		  filteredPO = previousOffday.filter((element) => element !== info.event.startStr);	// 특정 요소 삭제
			    		  previousOffday = filteredPO;
			    		  
			    		  console.log(previousOffday);
			    		  
			    		  let workingday = "<input type='hidden' name='companyWorkingdayDate' value='"+info.event.startStr+"' id='workingday'>";
						  $('#targetCal').append(workingday);
			    	  }
			      }
			    });
			    
				calendar.render();
		  });
		});
	</script>
	
	<script>
		// 부가 서비스
		let length = ${addtionalServiceLength};
		console.log(length);
		
		$(function() {
			for(let i = 0; i < length; i++){
			  $('.serviceBtn'+i).click(function(){
			    if($(this).hasClass('btn-secondary')){
			    	$(this).removeClass('btn-secondary');
			    	$(this).addClass('btn-primary');
			    	$('#serviceCheckBox'+i).prop("checked", true);
			    	return;
			    }
			    if($(this).hasClass('btn-primary')) {
			    	$(this).removeClass('btn-primary');
			    	$(this).addClass('btn-secondary');
			    	$('#serviceCheckBox'+i).prop("checked", false);
			    }
			    
			  });
			}
		});
		
		// 정기휴무 요일
		$(function() {
			for(let i = 1; i < 8; i++){
			  $('.dayofweekBtn'+i).click(function(){
			    if($(this).hasClass('btn-secondary')){
			    	$(this).removeClass('btn-secondary');
			    	$(this).addClass('btn-primary');
			    	$('#dayofweekCheckBox'+i).prop("checked", true);
			    	return;
			    }
			    if($(this).hasClass('btn-primary')) {
			    	$(this).removeClass('btn-primary');
			    	$(this).addClass('btn-secondary');
			    	$('#dayofweekCheckBox'+i).prop("checked", false);
			    }
			    
			  });
			}
		});
		
		$(document).ready(function(){

			$('#btn').click(function(){
				// 유효성 검사 필요없음
				$('#form').submit();
			});
			
		});
	</script>
	
	<style>
		.selectBox{
			float: left; 
		}
		
		.parent{
		 position: relative;
		}
		 
		.child{
		 position: absolute;
		 bottom: 0;
		}
	</style>
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
		        <li class="breadcrumb-item active">업체 상세정보</li>
		      </ol>
		      
		      <div class="box_general">
				<form method="post" action="${pageContext.request.contextPath}/company/modifyCompanyDetail" id="form">
					<!-- 업체 유형 -->
					<div class="row py-5 pl-5 pr-5">
						<div class="col-md-12">
							<div class="form-group">
								<label>업체 유형</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<div>업체 유형은 변경할 수 없습니다.</div>
							</div>
						</div>
					</div>
				 	<div class="row pl-5 pr-5 parent">
						<!-- 운영 시간 -->
						<div class="col-md-6">
							<div class="form-group">
								<div>
							 		<label>운영 시간</label>
								</div>
						 		<div class="styled-select selectBox col-md-4">
							 		<select name="am_pm">
							 			<option value="am" <c:if test="${ampm[0] eq 'am'}">selected</c:if>>오전</option>
							 			<option value="pm" <c:if test="${ampm[0] eq 'pm'}">selected</c:if>>오후</option>
							 		</select>
							 	</div>
							 		<!-- 00~23 -->
							 	<div class="styled-select selectBox col-md-8">
							 		<select name="openTime" id="openTime">
							 			<option>개장시간</option>
							 			<c:forEach var="i" items="${timetable}">
							 				<option <c:if test="${i eq openTime}">selected</c:if>>${i}</option>
							 			</c:forEach>
							 		</select>
							 	</div>
							 	<div class="text-center">
							 		~
						 		</div>
							 	<div class="styled-select selectBox col-md-4">
							 		<select name="am_pm">
							 			<option value="am" <c:if test="${ampm[1] eq 'am'}">selected</c:if>>오전</option>
							 			<option value="pm" <c:if test="${ampm[1] eq 'pm'}">selected</c:if>>오후</option>
							 		</select>
							 	</div>
							 	<div class="styled-select selectBox col-md-8">
							 		<select name="closeTime" id="closeTime">
							 			<option>마감시간</option>
							 			<c:forEach var="i" items="${timetable}">
							 				<option <c:if test="${i eq closeTime}">selected</c:if>>${i}</option>
							 			</c:forEach>
							 		</select>
							 	</div>
						 	</div>
						</div>
					 	<!-- 휴무일 요일-->
				 		<div class="col-md-6">
							<div class="form-group">
					 			<label>휴무일</label>
							 	<div class="child">
							 		<div>정기휴무일(년 단위)</div>
							 		<div style="display:none">
							 			<input type="checkbox" name="dayofweek" value="2" <c:if test="${days[1]}">checked</c:if> id="dayofweekCheckBox2">월
								 		<input type="checkbox" name="dayofweek" value="3" <c:if test="${days[2]}">checked</c:if> id="dayofweekCheckBox3">화
								 		<input type="checkbox" name="dayofweek" value="4" <c:if test="${days[3]}">checked</c:if> id="dayofweekCheckBox4">수
								 		<input type="checkbox" name="dayofweek" value="5" <c:if test="${days[4]}">checked</c:if> id="dayofweekCheckBox5">목
								 		<input type="checkbox" name="dayofweek" value="6" <c:if test="${days[5]}">checked</c:if> id="dayofweekCheckBox6">금
								 		<input type="checkbox" name="dayofweek" value="7" <c:if test="${days[6]}">checked</c:if> id="dayofweekCheckBox7">토
								 		<input type="checkbox" name="dayofweek" value="1" <c:if test="${days[0]}">checked</c:if> id="dayofweekCheckBox1">일
							 		</div>
							 		
							 		<button type="button" <c:if test="${days[1]}">class="btn btn-primary my-1 dayofweekBtn2"</c:if> <c:if test="${!days[1]}">class="btn btn-secondary my-1 dayofweekBtn2"</c:if>>월</button>
							 		<button type="button" <c:if test="${days[2]}">class="btn btn-primary my-1 dayofweekBtn3"</c:if> <c:if test="${!days[2]}">class="btn btn-secondary my-1 dayofweekBtn3"</c:if>>화</button>
							 		<button type="button" <c:if test="${days[3]}">class="btn btn-primary my-1 dayofweekBtn4"</c:if> <c:if test="${!days[3]}">class="btn btn-secondary my-1 dayofweekBtn4"</c:if>>수</button>
							 		<button type="button" <c:if test="${days[4]}">class="btn btn-primary my-1 dayofweekBtn5"</c:if> <c:if test="${!days[4]}">class="btn btn-secondary my-1 dayofweekBtn5"</c:if>>목</button>
							 		<button type="button" <c:if test="${days[5]}">class="btn btn-primary my-1 dayofweekBtn6"</c:if> <c:if test="${!days[5]}">class="btn btn-secondary my-1 dayofweekBtn6"</c:if>>금</button>
							 		<button type="button" <c:if test="${days[6]}">class="btn btn-primary my-1 dayofweekBtn7"</c:if> <c:if test="${!days[6]}">class="btn btn-secondary my-1 dayofweekBtn7"</c:if>>토</button>
							 		<button type="button" <c:if test="${days[0]}">class="btn btn-primary my-1 dayofweekBtn1"</c:if> <c:if test="${!days[0]}">class="btn btn-secondary my-1 dayofweekBtn1"</c:if>>일</button>
							 	</div>
							 </div>
						</div>
					</div>
					
					<div class="row py-5 pl-5 pr-5">
					 	<!-- 부가 서비스 -->
						<div class="col-md-6">
							<div class="form-group">
						 		<label>부가 서비스</label>
						 		<div>
							 		<c:forEach var="i" items="${addtionalService}" varStatus="status">
							 			<div style="display:none">
							 				<input type="checkbox" name="additionService" value="${i}" id="serviceCheckBox${status.index}" <c:if test="${additionService.contains(i)}">checked</c:if>>${i}
							 			</div>
							 			
							 			<!-- 기존 서비스-> 분홍 -->
							 			<c:if test="${additionService.contains(i)}">
								 			<button type="button" class="btn btn-primary col-md-3 my-1 serviceBtn${status.index}">${i}</button>
							 			</c:if>
							 			<!-- 기존 서비스x-> 회색 -->
							 			<c:if test="${!additionService.contains(i)}">
								 			<button type="button" class="btn btn-secondary col-md-3 my-1 serviceBtn${status.index}">${i}</button>
							 			</c:if>
							 		</c:forEach>
							 	</div>
							 </div>
					 	</div>
					 	<!-- 휴무일 -->
						 	<div class="col-md-5">
								<div class="form-group">
								 	<div id='calendar'>
								 	</div>
								 	<div class="my-1">
								 		<input type="text" id="memo" class="form-control" placeholder="휴무 사유를 입력하세요.">
								 	</div>
								 	<div id="targetCal">
								 	</div>
						 		</div>
						 	</div>
			 		
					 	<div class="col-md-12 my-5 text-center">
							 <button type="button" id="btn" class="btn btn-primary">수정</button>
						</div>
					</div>
					
			 	</form>
			 </div>
		  </div>
	  </div>
	  
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