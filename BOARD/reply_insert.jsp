<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="rdto" class="board.ReplyDTO"/>
<jsp:setProperty name="rdto" property="*"/>
<jsp:useBean id="bdao" class="board.BoardDAO"/>
<%
		//System.out.println(rdto.getWriter());
		//System.out.println(rdto.getContent());
		//System.out.println(rdto.getConum());
		bdao.plusReply(rdto.getConum());//댓글수 1증가
		bdao.insertReply(rdto);
%>
<script type="text/javascript">
	location.href="content.jsp?no=<%=rdto.getConum()%>";
</script>
