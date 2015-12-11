<%@ page contentType="text/html; charset=utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<link href="<%=request.getContextPath()%>/assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../assets/input/css/normalize.css">
<link rel="stylesheet" href="../assets/input/css/style.css">

<title>회원가입</title>
</head>
<body>
	<div class="site-wrapper">
		<div class="container">
		<!-- form 태그가 각각 변수들을 다음페이지로 넘겨준다. action="memberInput_ok.jsp"이 다음페이지 -->
			<form class="form-signup" name="f" method="post" action="./memberInput_ok.jsp">

				
				<h2 style="color: #0288D1" class="form-signup-heading">회원추가</h2>
				<div class="row">
					<input type="text" name="id" id="fancy-text" /> <label
						for="fancy-text">아이디</label>
				</div>

				<div class="row">
					<input type="text" name="passwd" id="fancy-text" /> <label
						for="fancy-text">패스워드</label>
				</div>
				
				<div class="row">
					<input type="text" name="name" id="fancy-text" /> <label
						for="fancy-text">이름</label>
				</div>
				
				<div class="row">
					<input type="text" name="email" id="fancy-text" /> <label
						for="fancy-text">이메일</label>
				</div>
				
				<div class="row">
					<input type="text" name="phone" id="fancy-text" /> <label
						for="fancy-text">전화번호</label>
				</div>
				
				<div class="input-group row">
					<input id="sample6_postcode" type="text" name="zipcode" id="fancy-text" /> <label
						for="fancy-text">우편번호</label>
					<button onclick="sample6_execDaumPostcode()"
				style="cursor: hand;" class='input-group-addon'>우편번호 찾기</button>
				</div>
				
				<div class="row">
					<input id="sample6_address" type="text" name="address" id="fancy-text" /> <label
						for="fancy-text">상세주소</label>
				</div>
				
				<button	onclick="inputCheck();" type="button">가입</button>
				<button	onclick="cancel();" type="button">닫기</button>
			</form>
		</div>
	</div>
	</body>
</html>
<script type="text/javascript">
	function inputCheck() {
		if (f.id.value == "") {
			alert("아이디를 입력해 주세요.");
			f.id.focus();
			return;
		}
		if (f.passwd.value == "") {
			alert("패스워드를 입력해 주세요.");
			f.passwd.focus();
			return;
		}
		if (f.name.value == "") {
			alert("이름을 입력해 주세요.");
			f.name.focus();
			return;
		}
		if (f.email.value == "") {
			alert("이메일을 입력해 주세요.");
			f.email.focus();
			return;
		}
		if (f.phone.value == "") {
			alert("전화번호를 입력해 주세요.");
			f.phone.focus();
			return;
		}
		if (f.zipcode.value == "") {
			alert("우편번호를 입력해 주세요.");
			f.zipcode.focus();
			return;
		}		
		if (f.address.value == "") {
			alert("상세주소를 입력해 주세요.");
			f.address.focus();
			return;
		}
		document.f.submit();
	}

	function cancel() {
		//확인창 띄워서 예 누르면 닫기
		var result = window.confirm("정말로 닫으시겠습니까?");
		if (result) {//true
			window.close();
		}
	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("sample6_postcode").value = data.postcode; //6자리 우편번호 사용
						//document.getElementById("sample6_postcode").value = data.zonecode; //5자리 기초구역번호 사용
						document.getElementById("sample6_address").value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						// document.getElementById("sample6_address2").focus();
					}
				}).open();
	}
</script>