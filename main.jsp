<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String memberId = (String) session.getAttribute("memID");
%>
<script type="text/javascript">
	function openMember() {
		//창을 관리하는 내장객체는 window
		window.open("./LOGIN/signup.jsp", "", "width=400, height=800");
	}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <%
                        if(memberId == null){   
                    %>
					<li><a href="./LOGIN/login.jsp">Login</a></li>
                    <%
                       }else{
                    %>
                        <li><a href="./LOGIN/logout.jsp">Logout</a></li>
                    <%
                       }
                    %>
				</ul>
				<ul class="pull-right">
				<%
					if (memberId != null) {
				%>
					<li><a><%=memberId %> Welcome!</a></li>
				<%
					}
				%>
				</ul>
			</div>
		</div>
	</div>

	<div class="jumbotron">
		<div class="container">
			<div class="main">
				<h1>몰땅</h1>
                <%
                    if(memberId == null){
                %>
				<a class="btn-primary" onclick="openMember();">회원 가입</a>
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

	<div class="footer">
		<div class="container">
			<p>&copy; Shopping 2015</p>
		</div>
	</div>
</body>
</html>