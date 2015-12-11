<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String memberId = (String) session.getAttribute("memID");
%>
<style>
    .goods{
       
    }
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/main/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/projectxinventor/bootstrap.min.css">
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
                        
<!-- 먹거리 목록 시작 -->
    <div class="supporting">
		<div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="col">
                        <img class="goods" src="../assets/img/food0.jpg">
                        <h2>냉동식품 세트</h2>
                        <p>7,800원</p>
                        <a class="btn-default" href="./GOODS/food.jsp">Look Around</a>
                    </div>
                    <div class="col">
                        <img class="goods" src="../assets/img/food1.jpg">
                        <h2>라면 세트</h2>
                        <p>6,990원</p>
                        <a class="btn-default" href="#">Go Shopping</a>
                    </div>
                    <div class="col">
                        <img class="goods" src="../assets/img/food2.jpg">
                        <h2>맥심 모카/화이트</h2>
                        <p>14,950원</p>
                        <a class="btn-default" href="#">Get Voucher</a>
                    </div>
                </div>
                <div class="col-md-2">
                </div>
            </div>
		</div>
		<div class="clearfix"></div>
	</div>
</body>
</html>