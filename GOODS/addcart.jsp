<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String memberId = (String) session.getAttribute("memID");
   request.setCharacterEncoding("utf-8");
%>

<%
   /*
   class SessionMember{
        String id="";
        String list[];
        
        public void setId(String id){
            this.id = id;
        }
   }
   */
   
  
        String goodslist = request.getParameter("list");
        String numlist[] = goodslist.split("n");
        
        /*
        SessionMember tempMember = new SessionMember();
        tempMember.list = numlist;
        */
   
        String sessionKey="";
   
   
        if(memberId != null){                   // 회원 로그인 상태
            sessionKey = memberId;
        }else{                                  // 비회원 상태
            sessionKey = "guest";
        }
        
        // 세션이 존재하는지 확인
        ArrayList<String> sessionList = (ArrayList)session.getAttribute(sessionKey);    
    
        if(sessionList == null){        // 세션이 존재하지 않으면 세션 생성
            sessionList = new ArrayList<String>();      
            session.setAttribute(sessionKey,sessionList);      // 회원 아이디가 Key, List로는 장바구니 목록
        }else{                          // 세션이 이미 존재할 경우
            String goodsList[] = {""};
            session.removeAttribute(sessionKey);
        }
        
        for(int i = 0; i<numlist.length;i++){
            sessionList.add(new String(numlist[i]));             // 장바구니 목록 추가
        }
       
        
%>
    <script>
        alert("세션이 추가 되었습니다.");
        location.href = "./cart.jsp";
    </script>
<%
  
%>