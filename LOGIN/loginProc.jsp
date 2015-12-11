<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="memMgr" class="mallddang.MallddangMemberMgr" />
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String mem_id = request.getParameter("id");
	String mem_passwd = request.getParameter("passwd");
	boolean loginCheck = memMgr.PassCheck(mem_id,mem_passwd);
   if(true){
%>

<script>
	alert("123");
</script>
<%
   }
   if(loginCheck){
	  session.setAttribute("idKey",mem_id);
%>
<script>
	alert("로그인 되었습니다.");
</script>
<%
	  response.sendRedirect("../main.jsp");
   }else{
      response.sendRedirect("./login.jsp");
   }
%>
