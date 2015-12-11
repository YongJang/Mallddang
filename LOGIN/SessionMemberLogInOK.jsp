<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="MemDAO" class="member.MemberDAO" />
<%
	String memberId = "";
	String memberPw = "";
	String memberIp = "";
	if (request.getParameter("memberid") != null)
		memberId = request.getParameter("memberid");
	if (request.getParameter("memberpw") != null)
		memberPw = request.getParameter("memberpw");
	if (MemDAO.PassCheck(memberId, memberPw)) {
		session.setAttribute("memID", memberId);
		session.setMaxInactiveInterval(5 * 60);
%>
<script>
	alert("로그인 되었습니다. ");
	location.href = "../main.jsp";
</script>
<%
	ArrayList<String> list = new ArrayList<String>();
	memberIp = (String)request.getRemoteAddr();
	session.setAttribute("memIP", memberIp);
	session.setAttribute("list", list);
	} else {
%>
<script>
	alert("로그인 되지 않았습니다. ");
	location.href = "login.jsp";
</script>
<%
	}
%>