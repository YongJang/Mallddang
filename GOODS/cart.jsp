<%@ page contentType="text/html;charset=utf-8" import="java.sql.*,java.util.*" %>
<link href="../assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/main/main.css" rel="stylesheet" type="text/css">
<jsp:include page="../LAYOUT/top.jsp"/>
<jsp:useBean id="FoodDAO" class="food.FoodDAO"/>
<jsp:useBean id="FoodDTO" class="food.FoodDTO"/>
<%
    String userId = (String) session.getAttribute("memID");
	boolean isLogin = false;
	if (userId == null) {//정보 없음, 로그아웃 상태
		isLogin = false;
	} else {//정보 있음, 로그인 상태
		isLogin = true;
	}
   
    class SessionMember{
        String id="";
        String list[];
        
        public void setId(String id){
            this.id = id;
        }
        /*
        public SessionMember(SessionMember s){
            this.id = s.id;
            this.list = s.list;
        }*/
    }
   
   // try{

            ArrayList<Object> sessionList = (ArrayList)session.getAttribute("productlist");
            if(sessionList == null){
                sessionList = new ArrayList<Object>();
                session.setAttribute("productlist",sessionList);
            }

            String memberID="";

            if(isLogin){
                memberID = userId;
            }else{
                memberID = "guest";
            }

            int tempIndex=-1;

            for(int i = 0; i<sessionList.size(); i++){
%>
<%
                SessionMember tempMember = (Object)(sessionList.get(i));
                if(memberID.equals(tempMember.id)){
                    tempIndex = i;
                    break;
                }
            }

            if(tempIndex == -1){
%>
            <h1> 장바구니가 비었습니다. </h1>
<%
            }else{

                SessionMember selectMember = (SessionMember)(sessionList.get(tempIndex));

                for(int i = 0; i < selectMember.list.length; i++){
                    FoodDTO = FoodDAO.getFood(Integer.parseInt(selectMember.list[i])+1);
%>
                        <h1><%=FoodDTO.getName()%></h1>
<%
                }

           }
        //}catch(Exception e){
%>
    
<%
        //}
%>
<jsp:include page="../LAYOUT/bottom.jsp"/>