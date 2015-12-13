<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- editPro.jsp : 수정 처리 페이지 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bdto" class="board.BoardDTO"/>
<jsp:setProperty name="bdto" property="*"/>
<jsp:useBean id="bdao" class="board.BoardDAO"/>
<%
	boolean result = bdao.editBoard(bdto);
	if(result){%>
	<script type="text/javascript">
		alert("수정 성공"); 
		location.href="content.jsp?num=<%=bdto.getNum()%>";
	</script>	
<%}else{ %>
	<script type="text/javascript">
		alert("수정 실패..");
		history.back();
	</script>
<%} %>