<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	var sel_files = [];
    $(document).ready(function() {
    	
        // 첫번째 사진 추가
        $('#inputImgBtn0').click(function(){ // 0버튼 눌리면
            $('#inputImg0').click(); // input0 열기
        });
    	$('#inputImg0').change(function() { // 두번째 파일 등록 위한 동적 버튼 생성
			var tag0 = "<input type='file' name='companyImg' accept='image/*' id='inputImg1' style='display:none;'>" +
						"<button type='button' id='inputImgBtn1'>사진추가</button>" +
						"<span id='fileName1'></span>";
			$('#target0').html(tag0);
			$('#fileName0').html($('#inputImg0').val()); // 파일 이름
		});
		
		// 두번째 사진 추가
		$(document).on('click', '#inputImgBtn1', function() {
			$('#inputImg1').click(); // input1 열기
			
			$('#inputImg1').change(function() { // 세번째 파일 등록 위한 동적 버튼 생성
				var tag1 = "<input type='file' name='companyImg' accept='image/*' id='inputImg2' style='display:none;'>" +
							"<button type='button' id='inputImgBtn2'>사진추가</button>" +
							"<span id='fileName2'></span>";
				$('#target1').html(tag1);
				$('#fileName1').html($('#inputImg1').val());
			});
		});
		
		// 세번째 사진 추가
		$(document).on('click', '#inputImgBtn2', function() {
			$('#inputImg2').click(); // input2 열기
			
			$('#inputImg2').change(function() { // 세번째 파일 등록 위한 동적 버튼 생성
				$('#fileName2').html($('#inputImg2').val());
			});
		});

        $("#input_imgs").change(handleImgsFilesSelect);
    });

    function handleImgsFilesSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
        	
        	// 확장자 확인
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_files.push(f);

         	// 업로드한 이미지를 미리보기 위해서는 FileReader 객체를 사용
            var reader = new FileReader();
            reader.onload = function(e) {
                var img_html = "<img src=\"" + e.target.result + "\" />";
                $(".imgs_wrap").append(img_html);
            }
            reader.readAsDataURL(f);
    	});
    }
</script>
<style type="text/css">
    .imgs_wrap {
        width: 600px;
        margin-top: 50px;
    }
    .imgs_wrap img {
        width: 200px;
    }

</style>
</head>
<body>

<!-- 테스트 -->
	<!-- 사진 등록 인풋 -->
	<!-- 
		파일 인풋 디스플레이 논 accept="image/jpeg, image/png"
		버튼 만들어서 인풋 형식 안보이고 등록 가능하게
		
		동적버튼 생성
		
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
	 -->
	<h2>업체가입</h2>
	<form action="${pageContext.request.contextPath}/beforeLogin/addCompany" method="post" encType="multipart/form-data" id="addForm">
		<table border="1">
			<tr>
				<th>ID</th>
				<td>
					<input type="text" id="id" name="companyId" disabled>
				</td>
				<th>ID 중복확인</th>
				<td>
					<input type="text" id="idCk">
					<button type="button" id="idCkBtn">확인</button>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" id="email1" name="companyEmail1">
					<span>@</span>
					<select id="email2" name="companyEmail2">
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
					</select>
					<button type="button" id="emailCkBtn">인증번호 발송</button>
				</td>
				<th>인증번호</th>
				<td>
					<input type="text" id="codeCk" disabled>
					<button type="button" id="codeCkBtn" disabled>인증번호 확인</button>
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td colspan="3">
					<input type="password" id="pw" name="companyPw">
				</td>
			</tr>
			<tr>
				<th>업체사진등록</th>
				<td colspan="3">
					<!-- 사진등록 -->
					<div>
				        <input type="file" name="companyImg" accept="image/*" id="inputImg0" style="display:none;">
				        <button type="button" id="inputImgBtn0">사진등록</button>
				        <span id="fileName0"></span>
				    </div>
				    <div id="target0"></div>
				    <div id="target1"></div>
				    
				 	<!-- 사진미리보기 -->
				    <div>
				        <div class="imgs_wrap"></div>
				    </div>
				</td>
			</tr>
			<tr>
				<th>업체명</th>
				<td colspan="3">
					<input type="text" id="name" name="companyName">
				</td>
			</tr>
			<tr>
				<th>업체 전화번호</th>
				<td colspan="3">
					<input type="text" id="phone" name="companyPhone">
				</td>
			</tr>
			<tr>
				<th>업체주소</th>
				<td colspan="3">
					<input type="text" id="address" name="companyAddress">
				</td>
			</tr>
			<tr>
				<th>사업자명</th>
				<td>
					<input type="text" id="ceo" name="companyCeo">
				</td>
				<th>사업자번호</th>
				<td>
					<input type="text" id="number" name="companyNumber">
				</td>
			</tr>
			<tr>
				<th>은행</th>
				<td>
					<input type="text" id="bank" name="companyBank">
				</td>
				<th>계좌번호</th>
				<td>
					<input type="text" id="account" name="companyAccount">
				</td>
			</tr>
			<tr>
				<th colspan="4">약관동의</th>
			</tr>
			<tr>
				<td colspan="4">
					1. 수집하는 개인정보 항목<br>
					문화체육관광부 대표 누리집의 이용자 참여와 이용통계 분석 등의 서비스를 위해 회원 가입시 아래의 개인정보를 수집하고 있습니다.<br>
					<br>
					가. 필수정보: 아이디, 이름, 성별, 출생년도, 비밀번호, 이메일<br>
					나. 서비스 이용 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br>
					(접속로그, 접속IP정보, 쿠키, 방문 일시, 서비스 이용기록, 불량 이용 기록)<br>
					2. 대표 누리집에서 이용자 회원가입 시 직접 개인정보를 입력 및 수정하여 개인정보를 수집합니다.<br>
					3. 수집 개인정보의 이용목적<br>
					회원가입, 회원활동 실적 관리, 회원탈퇴 의사 확인 등 회원관리<br>
					제공되는 서비스 이용에 관한 인구통계학적 분석, 서비스 방문 및 이용기록 분석, 관심사에 기반한 맞춤형 서비스 등 제공<br>
					신규 서비스 개발 및 활성화, 홍보 및 이벤트, 전자우편 서비스 등 정보 전달<br>
					향후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등<br>
					4. 개인정보의 보유 및 이용기간<br>
					이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br>
					따라서 문화체육관광부 대표누리집은 최종 로그인 후 2년이 경과하였거나 정보주체의 회원 탈퇴 신청 시 회원의 개인정보를 지체 없이 파기합니다.<br>
					<br>
					동의 거부 권리 사실 및 불이익 내용<br>
					이용자는 동의를 거부할 권리가 있습니다. 동의를 거부할 경우에는 서비스 이용에 제한됨을 알려드립니다.<br>
					<br>
					<div>
						<label>
							<input type="radio" class="agree" name="agree" value="동의">약관 및 마케팅 동의
						</label>
						<label>
							<input type="radio" class="agree" name="agree" value="미동의">약관 및 마케팅 미동의
						</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>위도</th>
				<td>
					<input type="number" id="la" name="companyLatitude">
				</td>
				<th>경도</th>
				<td>
					<input type="number" id="long" name="companyLongtitude">
				</td>
			</tr>
		</table>
		<button type="button" id="addBtn">가입</button>
	</form>
<script>
	$(document).ready(function(){
		// 아이디 중복확인
		$('#idCkBtn').click(function(){
			console.log('dd');
			$.ajax({
				url:'idCk' // 요청보낼 컨트롤러 맵핑주소
				, type:'get' // 맵핑 방식
				, data: {id:$('#idCk').val()} // 보낼 데이터
				, success:function(model){ // model -> 컨트롤러(idCk)에서 받아오는 값
					if(model=='yes'){
						$('#id').val($('#idCk').val());
					} else {
						alert($('#idCk').val()+'는 사용중인 아이디입니다.');
					}
				}
			});
		});
		
		// 이메일 인증
		var code = ''; // 인증번호를 담을 변수
		$('#emailCkBtn').click(function() {
			
			if($('#email1').val() == ''){ // 이메일 유효성 확인
				alert('이메일을 입력해주세요.');
			} else {
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				
				$.ajax({
					url:'emailCk'
					, type:'get'
					, data:{companyEmail1:$('#email1').val(), companyEmail2:$('#email2').val()}
					, success:function(model) {
						code = model;
						console.log(code);
						
						if(code == 'fail'){
							alert('인증번호 전송에 실패하였습니다. 입력한 이메일을 확인해주세요.');
							$('#email').attr('disabled',false); // 입력 재활성화
							$('#emailCkBtn').attr('disabled',false); // 버튼 재활성화
						} else {
							alert('인증번호가 전송되었습니다. 전송된 인증번호를 입력해주세요.');
							$('#codeCk').attr('disabled',false); // 인증번호 입력 활성화
							$('#codeCkBtn').attr('disabled',false); // 인증확인 버튼 활성화
							$('#email1').attr('disabled',true); // 중복 전송 방지위한 비활성화 + 인증완료 시 수정 방지
							$('#email2').attr('disabled',true);
						}
					}			
				});
			}
		});
		
		// 인증번호 비교
		var ckResult = false; // 이메일 인증 성공 여부를 담을 변수 (false : 인증실패, true : 인증성공)
		$('#codeCkBtn').click(function() {
			if($('#codeCk').val() == code){ // 인증번호 일치 시
				$('#email1').attr('disabled',true);
				$('#email2').attr('disabled',true);
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				$('#codeCkBtn').attr('disabled',true); // 중복 인증 방지위한 버튼 비활성화
				alert('이메일 인증에 성공하였습니다.');
				ckResult = true;
				console.log(ckResult);
			} else { // 인증번호 실패 시
				alert('이메일 인증에 실패하였습니다.\n인증번호를 확인해주세요.');
			}
		});
		
		// 유효성 확인 후 폼 제출
		var allChecked = false; // 함수 결과값
		$('#addBtn').click(function(){
			console.log(formCheck());
			if(allChecked){
				$('#addForm').submit();
			}
		});
		
		// 유효성 확인 함수
		formCheck = function(){
			var radioCk = $('input:radio[name=agree]').is(":checked");
			
			if($('#id').val() == ''){ // 아이디
				alert('아이디를 입력해주세요.');
				return false;
			} else if ($('#pw').val() == ''){ // 비밀번호
				alert('비밀번호를 입력해주세요.');
				return false;
			} else if (ckResult == false){ // 이메일
				alert('이메일 인증을 해주세요.');
				return false;
			} else if ($('#id').val() == ''){ // 이미지
				alert('아이디를 입력해주세요.');
				return false;
			} else if ($('#name').val() == ''){ // 업체명
				alert('업체명을 입력해주세요.');
				return false;
			} else if ($('#phone').val() == ''){ // 업체전화번호
				alert('업체전화번호를 입력해주세요.');
				return false;
			} else if ($('#address').val() == ''){ // 업체주소
				alert('업체주소를 입력해주세요.');
				return false;
			} else if ($('#ceo').val() == ''){ // 사업자명
				alert('사업자명을 입력해주세요.');
				return false;
			} else if ($('#number').val() == ''){ // 사업자번호
				alert('사업자번호를 입력해주세요.');
				return false;
			} else if ($('#bank').val() == ''){ // 은행
				alert('은행을 입력해주세요.');
				return false;
			} else if ($('#account').val() == ''){ // 계좌번호
				alert('계좌번호를 입력해주세요.');
				return false;
			} else if (!radioCk){ // 약관동의
				alert('약관동의 여부를 선택해주세요.');
				return false;
			} else if ($('.agree:checked').val() == '미동의'){ // 약관동의
				alert('약관에 동의해야만 가입이 가능합니다.');
				return false;
			} else if ($('#la').val() == ''){ // 위도
				alert('위도를 입력해주세요.');
				return false;
			} else if ($('#long').val() == ''){ // 경도
				alert('경도를 입력해주세요.');
				return false;
			} else {
				allChecked = true;
	    		return true;
	    	}
		};
		
		// 아이디, 비밀번호, 비밀번호 일치, 사진, 업체명, 업체 전번, 업체 주소, 사업자명, 사업자 번호, 은행, 계좌버노, 약과동의, 위도/경도
	});
</script>
</body>
</html>