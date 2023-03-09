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
	<title>예약 | 업체 등록</title>
	
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
	function changeType(value){
		let typeNo = value;
		console.log(typeNo);
		
		$.ajax({
			url:'/58booking_b/companyType'
			, type:'get'
			, data : {typeNo}
			, success:function(model){
				 $('#targetSel').children("option").remove();
				 $('#targetSel').append("<option>"+'==옵션선택=='+"</option>");	// 첫 번째 옵션 선택자리
				for(let i = 0; i < model.length ; i++){
					let option = '';
					if(model[i].parentNo == typeNo){
			        	option = "<option value='" + model[i].companyTypeNo + "'>" + model[i].companyTypeContent + "</option>";        
					}
			        //대상 셀렉트박스에 추가
			        $('#targetSel').append(option);
			   }
			}
		});
	}
	
	function selectKeyword(value){
		$('#targetSpan').html('');	// 바뀌면 초기화
		
		let keywordNo = value;
		//console.log(keywordNo);
		
		$.ajax({
			url:'/58booking_b/companyType'
			, type:'get'
			, data : {keywordNo}
			, success:function(model){
				for(let i = 0; i < model.length ; i++){
					if(model[i].parentNo == keywordNo){
						console.log(model[i].companyTypeContent+"<=======");
						$('#targetSpan').html($('#targetSpan').html() + model[i].companyTypeContent + ' ');        
					}
			   }
			}
		});
	}

	//function check(checkbox){
    //	if(checkbox.checked == true){
	//		console.log('클릭');
	//   		calendar.addEvent({'title':'정기휴무', 'start':'2023-03-22'});	    		
    //	}
    //}

  // fullCalendar
  document.addEventListener('DOMContentLoaded', function() {
	let arr = [];
	let idx = 0;
	
	
    var calendarEl = document.getElementById('calendar');
    var request = $.ajax({
        url: "/58booking_b/offday"
        , method: "GET"
    });
    request.done(function(data){
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      locale: 'ko'
	      , dayMaxEventRows: 1
	      , initialView: 'dayGridMonth'
	      , selectable: true
	      , events: data
	      , dateClick: function(info) { 
	    	  // 휴무 사유 유효성 검사 후		    		  
	    	  if($('#memo').val().length < 1 || $('#memo').val().trim() == ''){	
				alert('휴무 사유를 입력해 주세요.');
	    		return;
	    	  }
	    	  
	    	  if(!arr.includes(info.dateStr)){
		    	  calendar.addEvent({'title':$('#memo').val(), 'start': info.dateStr});
		    	  arr.push(info.dateStr);
		    	  
		    	    // 나중에 hidden으로 바꾸기
			    	let offday = "휴무일: "+"<input type='text' name='companyOffdayDate' value='"+info.dateStr+"' id='offday"+idx+"'>";
				    $('#targetCal').append(offday);
				    let reason = "휴무 사유: "+"<input type='text' name='companyOffdayMemo' value='"+$('#memo').val()+"' id='reason"+idx+"'>";
				    $('#targetCal').append(reason);
				      
				    idx++;
	    	  }
	    	  
		    	//date = info.dateStr
		    	//let input = prompt(date+"를 휴무일로 설정하시겠습니까? 휴무 사유를 작성해 주세요.");
		    	//// 취소 누르면 그냥 종료
		    	//if(input == null){
		    	//	return;
		    	//}
		    	//// 휴무 사유 유효성 검사
		    	//if(input.length < 1 || input.trim() == ''){
		    	//	alert('휴무 사유를 입력해 주세요');
		    	//	return;
		    	//}
		        //// ★★★휴무일로 설정하시겠습니까? 확인 누르면★★★
		        //let offday = "휴무일: "+"<input type='text' name='companyOffdayDate' value='"+date+"'>"
		        //$('#targetCal').append(offday);
		        //let memo = "휴무 사유: "+"<input type='text' name='companyOffdayMemo' value='"+input+"'>"
		        //$('#targetCal').append(memo);
	      }
	      , eventClick: function(info){
	    	  info.event.remove();
	    	  let filtered = arr.filter((element) => element !== info.event.startStr);	// 특정 요소 삭제
	      	  arr = filtered;
	    	  // 아래에 데이터가 추가되어 있다면
	    	  if(idx > 0){
		    	  for(let i = 0; i < idx+1; i++){
		    		  if(info.event.startStr == $('#offday'+i).val()){
			    		  $('#offday'+i).val('');
			    		  $('#reason'+i).val('');
		    		  }
		    	  }	    		  
	    	  }
	      }
	    });
   	
		calendar.render();
    });
  });
</script>

<script>
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
	        <li class="breadcrumb-item active">업체 등록</li>
	      </ol>
	      
			<form method="post" action="${pageContext.request.contextPath}/company/addCompanyDetail" id="form">
				<!-- 업체 유형 -->
				<div>
					<h3>업체 유형</h3>
					<!-- depth == 0 -->
					<select onchange="changeType(this.value)" id="testSel">
						<option>==옵션선택==</option>
						<c:forEach var="ct" items="${typeList}">
							<c:if test="${ct.depth == 0}">
								<option value="${ct.companyTypeNo}">${ct.companyTypeContent}</option>
							</c:if>
						</c:forEach>
					</select>
					<!-- depth == 1 -->
					<select id="targetSel" onchange="selectKeyword(this.value)" name="companyTypeContent">
					</select>
					
					<div>검색 키워드 예시: <span id="targetSpan"></span></div>
				</div>
				<!-- 운영 시간 -->
			 	<div>
			 		<h3>운영 시간</h3>
			 		<select name="am_pm">
			 			<option value="am">오전</option>
			 			<option value="pm">오후</option>
			 		</select>
			 		<!-- 00~23 -->
			 		<select name="openTime">
			 			<option>==개장시간==</option>
			 			<option>00:00</option>
			 			<option>00:30</option>
			 			<option>01:00</option>
			 			<option>01:30</option>
			 			<option>02:00</option>
			 			<option>02:30</option>
			 			<option>03:00</option>
			 			<option>03:30</option>
			 			<option>04:00</option>
			 			<option>04:30</option>
			 			<option>05:00</option>
			 			<option>05:30</option>
			 			<option>06:00</option>
			 			<option>06:30</option>
			 			<option>07:00</option>
			 			<option>07:30</option>
			 			<option>08:00</option>
			 			<option>08:30</option>
			 			<option>09:00</option>
			 			<option>09:30</option>
			 			<option>10:00</option>
			 			<option>10:30</option>
			 			<option>11:00</option>
			 			<option>11:30</option>
			 		</select>
			 		~
			 		<select name="am_pm">
			 			<option value="am">오전</option>
			 			<option value="pm">오후</option>
			 		</select>
			 		<select name="closeTime">
			 			<option>==마감시간==</option>
			 			<option>00:00</option>
			 			<option>00:30</option>
			 			<option>01:00</option>
			 			<option>01:30</option>
			 			<option>02:00</option>
			 			<option>02:30</option>
			 			<option>03:00</option>
			 			<option>03:30</option>
			 			<option>04:00</option>
			 			<option>04:30</option>
			 			<option>05:00</option>
			 			<option>05:30</option>
			 			<option>06:00</option>
			 			<option>06:30</option>
			 			<option>07:00</option>
			 			<option>07:30</option>
			 			<option>08:00</option>
			 			<option>08:30</option>
			 			<option>09:00</option>
			 			<option>09:30</option>
			 			<option>10:00</option>
			 			<option>10:30</option>
			 			<option>11:00</option>
			 			<option>11:30</option>
			 		</select>
			 	</div>
			 	<!-- 부가 서비스 -->
			 	<div>
			 		<h3>부가 서비스</h3>
			 		<input type="checkbox" name="additionService" value="주차 가능">주차 가능
			 		<input type="checkbox" name="additionService" value="제로페이">제로페이
			 		<input type="checkbox" name="additionService" value="배달">배달
			 		<input type="checkbox" name="additionService" value="포장">포장
			 	</div>
			 	<!-- 휴무일 -->
		 		<h3>휴무일</h3>
		 		<div style="width:500px;">	<!-- 부트스트랩에서 수정 -->
				 	<div>
				 		<div>정기 휴무(중복 선택 가능):</div>
				 		<span>매주</span>
				 		<input type="checkbox" name="dayofweek" value="2">월	<!-- onClick="check(this)" -->
				 		<input type="checkbox" name="dayofweek" value="3">화
				 		<input type="checkbox" name="dayofweek" value="4">수
				 		<input type="checkbox" name="dayofweek" value="5">목
				 		<input type="checkbox" name="dayofweek" value="6">금
				 		<input type="checkbox" name="dayofweek" value="7">토
				 		<input type="checkbox" name="dayofweek" value="1">일
				 	</div>
				 	<div id='calendar'>
				 	</div>
				 	<div>휴무 사유: <input type="text" id="memo"></div>
				 	<div id="targetCal">
				 	</div>
		 		</div>
			 	<button type="submit">등록</button>
		 	</form>
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