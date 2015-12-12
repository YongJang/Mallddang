<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String memberId = (String) session.getAttribute("memID");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/main/main.css" rel="stylesheet" type="text/css">
<title>몰땅</title>
</head>
<body>
<%@ include file="./LAYOUT/top.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<div class="main">
				<h1>몰땅</h1>
                <%
                    if(memberId == null){
                %>
				<a class="btn-primary" href="./LOGIN/signup.jsp">회원 가입</a>
                <%
                   }
                %>
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
<%@ include file="./LAYOUT/bottom.jsp"%>
</body>
</html>