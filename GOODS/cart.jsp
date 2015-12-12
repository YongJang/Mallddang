<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String memberId = (String) session.getAttribute("memID");
   request.setCharacterEncoding("utf-8");
%>

<%
  try{
        String list = request.getParameter("list");
%>
    <script>
        alert("<%=list%>");
    </script>
<%
   } catch(Exception e){}
%>