<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memberId = (String) session.getAttribute("memID");
	if (memberId == null) {
%>
<script>
	alert("로그인 되지 않았습니다.");
	location.href = "SessionMemberLogIn.jsp";
</script>
<%
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/main/main.css" rel="stylesheet" type="text/css">
<title>몰땅</title>
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="nav">			
				<ul class="pull-left">
					<li><a>About</a></li>
					<li><a>Board</a></li>
					<li><a>Recent</a></li>
					<li><a href="./LOGIN/login.jsp">Login</a></li>
				</ul>
				<ul class="pull-right">
					<li><a><%=memberId %>님 환영합니다!</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="jumbotron">
		<div class="container">
			<div class="main">
				<h1>몰땅</h1>
				<a class="btn-primary" href="./main.jsp">쇼핑 시작</a>
			</div>
		</div>
	</div>

	<div class="supporting">
		<div class="container">
			<div class="col">
				<img
					src="https://s3.amazonaws.com/codecademy-content/projects/broadway/design.svg">
				<h2>먹거리</h2>
				<p>다양한 채소와 과일들을 구경하세요.</p>
				<a class="btn-default" href="#">Look Around</a>
			</div>
			<div class="col">
				<img
					src="https://s3.amazonaws.com/codecademy-content/projects/broadway/develop.svg">
				<h2>생필품</h2>
				<p>당신에게 필요한 가정용 생필품을 찾으세요.</p>
				<a class="btn-default" href="#">Go Shopping</a>
			</div>
			<div class="col">
				<img
					src="https://s3.amazonaws.com/codecademy-content/projects/broadway/deploy.svg">
				<h2>상품권</h2>
				<p>사랑하는 사람에게 당신의 마음을 전하세요.</p>
				<a class="btn-default" href="#">Get Voucher</a>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>

	<div class="footer">
		<div class="container">
			<p>&copy; Shopping 2015</p>
		</div>
	</div>
</body>
</html>