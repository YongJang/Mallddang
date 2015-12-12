<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String memberId = (String) session.getAttribute("memID");
   request.setCharacterEncoding("utf-8");
%>

<%
   
   class SessionMember{
        String id="";
        String list[];
        
        public void setId(String id){
            this.id = id;
        }
   }
   
   
  
        String goodslist = request.getParameter("list");
        String numlist[] = goodslist.split("n");
        
        SessionMember tempMember = new SessionMember();
        tempMember.list = numlist;
   
        if(memberId != null){
            tempMember.setId(memberId);
        }else{
            tempMember.setId("guest");
        }
   
        ArrayList<SessionMember> sessionList = (ArrayList)session.getAttribute("productlist");
        if(sessionList == null){
            sessionList = new ArrayList<SessionMember>();
            session.setAttribute("productlist",sessionList);
        }
        sessionList.add(tempMember);
%>
    <script>
        alert("세션이 추가 되었습니다.");
        location.href = "./cart.jsp";
    </script>
<%
  
%>