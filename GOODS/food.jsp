<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="food.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String memberId = (String) session.getAttribute("memID");
   request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="FoodDTO" class="food.FoodDTO"/>
<jsp:useBean id="FoodDAO" class="food.FoodDAO"/>
<%
    Vector<FoodDTO> list = new Vector<FoodDTO>();
    list = FoodDAO.getFoodList();
    int vectorSize = list.size();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/main/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/projectxinventor/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../assets/main/food.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="../assets/main/food.js"></script>
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
                    <table>
<%
    for(int i = 0;i< vectorSize;i++){
        FoodDTO = (FoodDTO)list.get(i);
        if(i%3 == 0){
%>
            <tr>
<%
        }
%>
            <td>
                <div class="supporting food" id="<%=FoodDTO.getNum()%>">
                    <center><img class="goods" src="<%=FoodDTO.getImg()%>"></center>
                    <center><h2><%=FoodDTO.getName()%></h2></center>
                    <center><p><%=FoodDTO.getCost()%></p></center>
                    <center><a class="btn-default" href="<%=FoodDTO.getFilepath()%>">Look Around</a></center>
                </div>
            </td>
<%
        if(i%3 == 2){
%>
            </tr>
<%
        }
    }
%>
                    </table>
                </div>
                <div class="col-md-2" id="cartSpace">
                    <div id =cartContainer>
                        <div id="fixedCart"></div>
                        <a onclick="buy();"><div id="buybutton"></div></a>
                    </div>
                </div>
            </div>
		</div>
		<div class="clearfix"></div>
	</div>
</body>
</html>
<script>
    function buy(){
        prompt(goodsArray.pop());
        return;
    }
</script>