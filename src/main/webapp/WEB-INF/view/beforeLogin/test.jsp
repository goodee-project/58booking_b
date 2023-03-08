<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

	<label><strong>사진</strong></label>
	<div>
		<span id="currentImg0">
			<img src="${pageContext.request.contextPath}/upload" width="100px" height="100px" alt="상품 이미지"/>
		</span>

		<button id="currentFileBtn0" type="button">대표 사진 변경</button>
		<input type="file" name="filename0" accept="image/jpeg, image/png" id="filename0">
		
		<input type="hidden" name="oldFilename0" /><span id="file_name0"></span>
		<input type="hidden" name="goodsImgCode0"/>
	</div>

	<label><strong>사진추가</strong></label>
	<div>
		<button id="btn-upload0" type="button">사진 추가</button>
		<input type="file" name="addedFilename0" accept="image/jpeg, image/png" id="input_file0">
		<span id="fileName0"></span>
		
		<div id="target"></div>
		<div id="target1"></div>
	</div>


	<script>
		// 유효성 검사
		$(document).ready(function(){
			
	
		// 사진 수정
		let len = ${listSize};
		$(function () {
			for(let val = 0; val < len; val++){
				console.log(val);
				$('#currentFileBtn'+val).click(function (e) {
			        e.preventDefault();
			        $('#filename'+val).click(); // 파일 input 열기
			    });
				
				// 파일 이름 갱신
				$('#filename'+val).change(function(e) {
					$('#file_name'+val).html('');	// 지우고
					$('#file_name'+val).html($('#filename'+val).get(0).files[0].name);	// 파일 이름
					$('#currentImg'+val).html(''); // 기존 이미지 보여줬던 것 지우기
				});
				
			};
		});
		
		// 사진 추가
		$(function () {
			// 파일추가 버튼
			$('#btn-upload0').click(function (e) {
		        e.preventDefault();
		        $('#input_file0').click(); // 파일 input 열기
		    });
			$('#input_file0').change(function(e) { // 동적 버튼 생성
				e.preventDefault();
				$('#fileName0').html($('#input_file0').get(0).files[0].name);	// 파일 이름
				$('#target').html(`<button id="btn-upload1" type="button" class="btn btn-sm btn-primary mb-1 h-100">파일 추가</button>
				<input type="file" name="addedFilename1" accept="image/jpeg, image/png" style="display:none;" id="input_file1"> <span id="fileName1"></span>`);			
			})
			
			// 생성된 동적버튼 1 
			$(document).on('click', '#btn-upload1', function(e) {
				e.preventDefault();
				$('#input_file1').click(); // 파일 input 열기
				
				$('#input_file1').change(function() { // 동적 버튼 생성
					$('#fileName1').html($('#input_file1').get(0).files[0].name);	// 파일 이름
					$('#target1').html(`<button id="btn-upload2" type="button" class="btn btn-sm btn-primary h-100">파일 추가</button>
					<input type="file" name="addedFilename2" accept="image/jpeg, image/png" style="display:none;" id="input_file2"> <span id="fileName2"></span>`);			
				})
			});
			
			// 생성된 동적버튼 2
			$(document).on('click', '#btn-upload2', function(e) {
				e.preventDefault();
				$('#input_file2').click(); // 파일 input 열기
				
				$('#input_file2').change(function() {
					$('#fileName2').html($('#input_file2').get(0).files[0].name);	// 파일 이름		
				})
			});
	   	});
	</script>	

</html>