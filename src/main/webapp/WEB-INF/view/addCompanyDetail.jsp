<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
				for(var i = 0; i < model.length ; i++){
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
				for(var i = 0; i < model.length ; i++){
					if(model[i].parentNo == keywordNo){
						console.log(model[i].companyTypeContent+"<=======");
						$('#targetSpan').html($('#targetSpan').html() + model[i].companyTypeContent + ' ');        
					}
			   }
			}
		});
	}
</script>
</head>
<body>
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
		<select id="targetSel" onchange="selectKeyword(this.value)">
		</select>
		
		<div>검색 키워드 예시: <span id="targetSpan"></span></div>
	</div>
	<!-- 운영 시간 -->
 	<div>
 		<h3>운영 시간</h3>
 		<!-- 00~23 -->
 		<select name="openTime">
 			<option>==개장시간==</option>
 		</select>
 		~
 		<select name="closeTime">
 			<option>==마감시간==</option>
 		</select>
 	</div>
</body>
</html>