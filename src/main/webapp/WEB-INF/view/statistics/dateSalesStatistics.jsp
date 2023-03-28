<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Ansonika">
<title>예약 | 매출통계</title>
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
				<li class="breadcrumb-item active">매출 통계</li>
			</ol>
			
			<!-- 본문 입력 -->
			<div class="box_general">
				<div class="header_box version_2">
					<h2><i class="fa fa-bar-chart"></i>${year}년 ${month}월 날짜별 통계</h2>
				</div>
				<div class="mx-2 mb-2">* 매출 통계는 방문완료된 예약 건에 한해서 계산됩니다.</div>
				<!-- 일별, 월별, 년별 매출 통계 그래프 -->
				<canvas id="yearChart" width="1563" height="468" class="pb-4"></canvas>
				
				<!-- 테이블 -->
				<div class="pt-2 pb-3">
					<table class="table text-center">
						<tr>
							<th class="w-25">날짜</th>
							<th class="w-25">매출합계</th>
							<th class="w-25">매출평균</th>
							<th class="w-25">건수</th>
						</tr>
						<c:if test="${fn:length(dateList) == 0}">
							<tr>
								<td colspan="4">표시할 데이터가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${fn:length(dateList) > 0}">
							<c:forEach items="${dateList}" var="d">
								<tr>
									<th>${d.date}</th>
									<th><fmt:formatNumber value="${d.totalPrice}" pattern="#,###"/>원</th>
									<th><fmt:formatNumber value="${d.avgPrice}" pattern="#,###"/>원</th>
									<th><fmt:formatNumber value="${d.totalCnt}" pattern="#,###"/>건</th>
								</tr>
							</c:forEach>
						</c:if>
					</table>
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

<!-- 차트 스크립트 -->
<script>
	<!-- 차트 모델값을 가져오는 코드 -->
	// 모델 데이터 가져온 후에 아래 차트가 그려져야 한다 -> 동기로 처리해야 한다
	// async값을 false로 변경,  참고 https://api.jquery.com/jquery.ajax
	
	// 데이터를 받을 배열 생성
	let dateArray = [];
	let totalPriceArray = [];
	let avgPriceArray = [];
	let totalCntArray = [];
	let year = '${year}';
	let month = '${month}';
	
	$.ajax({
		async : false // 동기처리
		, url : 'date'
		, type : 'post'
		, data : {year : year, month : month}
		, success : function(model) { // model : 백앤드에서 객체로 반환 -> 변환 필요
			dateArray = model.map(row=>row.date);
			totalPriceArray = model.map(row=>row.totalPrice);
			avgPriceArray = model.map(row=>row.avgPrice);
			totalCntArray = model.map(row=>row.totalCnt);
		}
	});
</script>

<script>
	<!-- 차트 그리는 코드 -->
	new Chart("yearChart", {
	  type: "bar",
	  data: {
	    labels: dateArray, // x축(날짜)
	    datasets: [{ // y축
	     	data: totalPriceArray,
	     	backgroundColor: "rgba(30, 144, 255, 0.3)",
	     	borderColor: "#1E90FF",
	     	borderWidth: '1',
	     	label: '합계'
	    }, {
	    	data: avgPriceArray,
	    	backgroundColor: "rgba(252, 91, 98, 0.3)",
	    	borderColor: "#fc5b62",
	    	borderWidth: '1',
	     	label: '평균'
	    }, {
	    	type:'line', // 건수는 오른쪽으로 따로
	    	fill : false,
            lineTension : 0, 
	    	yAxisID: 'right-y-axis',
	    	data: totalCntArray,
	    	backgroundColor: "rgba(255, 193, 7, 0.3)",
	    	borderColor: "#ffc107",
	    	borderWidth: '3',
	     	label: '건수'
	    }]
	  },
	  options: {
	    scales: {
			xAxes: [{ // x축 설정
				gridLines:{
					color: 'rgb(255, 255, 255)',
					lineWidth: 1
				},
				ticks:{
					fontSize : 20,
					padding: 10
				}
			}],
			yAxes: [{ // y축 설정
				gridLines:{
					color: 'rgba(0, 0, 0, 0.1)',
					lineWidth: 1
				},
				ticks:{
					beginAtZero: true,
					fontSize : 15,
   					callback: function(value, index, ticks) { // 축 단위 설정
   						return value.toLocaleString("ko-KR")+'원';
                    }
				}
			}, { // 건수만 따로
                id: 'right-y-axis',
                type: 'linear',
                position: 'right',
   				gridLines:{
   					color: 'rgba(0, 0, 0, 0)',
   					lineWidth: 1
   				},
   				ticks:{
   					beginAtZero: true,
   					fontSize : 15,
   					stepSize : 10,
   					callback: function(value, index, ticks) { // 축 단위 설정
   						return value.toLocaleString("ko-KR")+'건';
                    }
   				}
            }]
		}
	  }
	});
</script>
</body>
</html>