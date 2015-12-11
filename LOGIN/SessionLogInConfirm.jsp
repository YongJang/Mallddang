<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memberId = (String) session.getAttribute("memID");
	if (memberId == null) {
%>
<script>
	alert("�α��� ���� �ʾҽ��ϴ�.");
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
<title>����</title>
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
					<li><a><%=memberId %>�� ȯ���մϴ�!</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="jumbotron">
		<div class="container">
			<div class="main">
				<h1>����</h1>
				<a class="btn-primary" href="./main.jsp">���� ����</a>
			</div>
		</div>
	</div>

	<div class="supporting">
		<div class="container">
			<div class="col">
				<img
					src="https://s3.amazonaws.com/codecademy-content/projects/broadway/design.svg">
				<h2>�԰Ÿ�</h2>
				<p>�پ��� ä�ҿ� ���ϵ��� �����ϼ���.</p>
				<a class="btn-default" href="#">Look Around</a>
			</div>
			<div class="col">
				<img
					src="https://s3.amazonaws.com/codecademy-content/projects/broadway/develop.svg">
				<h2>����ǰ</h2>
				<p>��ſ��� �ʿ��� ������ ����ǰ�� ã������.</p>
				<a class="btn-default" href="#">Go Shopping</a>
			</div>
			<div class="col">
				<img
					src="https://s3.amazonaws.com/codecademy-content/projects/broadway/deploy.svg">
				<h2>��ǰ��</h2>
				<p>����ϴ� ������� ����� ������ ���ϼ���.</p>
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