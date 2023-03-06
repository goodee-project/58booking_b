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
				// console.log(model);
				// console.log("parentNo : "+model[1].parentNo);
				for(var i = 0; i < model.length ; i++){
					if(model[i].parentNo == typeNo){
			        	var option = "<option value='" + model[i].companyTypeNo + "'>" + model[i].companyTypeContent + "</option>";        
					}
			        //대상 셀렉트박스에 추가
			        $('#targetSel').append(option);
					// ★★★★중복 해결 필요★★★★
			   }
			}
		});
	}
</script>
</head>
<body>
	<!-- 업체 유형 -->
	<div>
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
		<select id="targetSel">
		</select>
	</div>
	<!-- 운영 시간 -->
 	<div>
 		<!-- 00~23 -->
 		<input type="number" name="opentimeHour">:<input type="number" name="opentimeMinute">
 		~
 		<input type="number"  name="closetimeHour">:<input type="number"  name="opentimeMinute">
 	</div>
</body>
</html>