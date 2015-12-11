<%@ page contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String memberId = (String) session.getAttribute("memID");
	if (memberId != null) {
%>
<script>
	alert("로그인 되었습니다");
	location.href = "SessionLogInConfirm.jsp";
</script>
<%
	}
%>
<html>
<head>
<title>로그인</title>
<link href="../assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/input/input.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../assets/input/css/normalize.css">
<link rel="stylesheet" href="../assets/input/css/style.css">
<script type="text/javascript">
	function openMember() {
		//창을 관리하는 내장객체는 window
		window.open("./signup.jsp", "", "width=400, height=800");
	}
	function goMember() {
		document.post.submit();
	}
</script>
</head>
<body>
	<link
		href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
		rel='stylesheet' type='text/css'>
	<div class="site-wrapper">
		<div class="container">
			<form class="form-signin" name="post" method="post"
				action="loginProc.jsp">
				<h2 style="color: #0288D1" class="form-signin-heading">Welcome</h2>

				<div class="row">
					<input type="text" name="id" id="fancy-text" /> <label
						for="fancy-text">ID</label>
				</div>

				<div class="row">
					<input type="text" name="passwd" id="fancy-text" /> <label
						for="fancy-text">PW</label>
				</div>
				<div class="row">
					<a style="color: #0288D1">아이디 기억   </a><input type="checkbox" name="fancy-checkbox" id="fancy-checkbox" />
					<label for="fancy-checkbox"></label>
				</div>
				<button class="btn btn-lg btn-default btn-block"
					onclick="goMember();" type="button">로그인</button>
				<button class="btn btn-lg btn-warning btn-block"
					onclick="openMember();" type="button">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>