<%
String userId = (String) session.getAttribute("memID");
	boolean isLogin = false;
	if (userId == null) {//정보 없음, 로그아웃 상태
		isLogin = false;
	} else {//정보 있음, 로그인 상태
		isLogin = true;
	}
%>
<div class="header">
	<div class="container">
		<div class="nav">
			<ul class="pull-left">
				<li><a>About</a></li>
				<li><a href="../Z/BOARD/list.jsp">Board</a></li>
				<li><a>Recent</a></li>
				<%
                        if(!isLogin){   
                %>
				<li><a href="./LOGIN/login.jsp">Login</a></li>
				<%
                       }else{
                %>
				<li><a href="./LOGIN/logout.jsp">Logout</a></li>
			</ul>
			<ul class="pull-right">
				<li><a><%=userId %> Welcome!</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</div>