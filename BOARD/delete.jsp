<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- no 번호의 데이터 삭제 -->
<jsp:useBean id="bdao" class="board.BoardDAO"/>
<%@ include file="../LAYOUT/top.jsp" %>
<%
		if(!isLogin){//로그인 안된 경우 거절
			response.sendRedirect("list.jsp");
			return;
		}
%>
<%
	String tmp = request.getParameter("num");
	int num=0;
	try{
		num = Integer.parseInt(tmp);
		if(num<=0) throw new Exception();
	}catch(Exception e){
		response.sendRedirect("list.jsp");
		return;//_jspService() 종료
	}
	
	boolean result = bdao.deleteBoard(num);
	if(result){%>
	<script type="text/javascript">
		alert("삭제 성공"); 
		location.href="list.jsp";
	</script>	
<%}else{ %>
	<script type="text/javascript">
		alert("삭제 실패..");
		history.back();
	</script>
<%} %>






