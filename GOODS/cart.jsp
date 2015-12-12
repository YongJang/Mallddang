<%@ page contentType="text/html;charset=utf-8" import="java.sql.*,java.util.*" %>
<link href="../assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/main/main.css" rel="stylesheet" type="text/css">
<link href="./cart.css" rel="stylesheet" type="text/css">    
<jsp:include page="../LAYOUT/top.jsp"/>
<jsp:useBean id="FoodDAO" class="food.FoodDAO"/>
<jsp:useBean id="FoodDTO" class="food.FoodDTO"/>
<%
    String userId = (String) session.getAttribute("memID");     // 회원 로그인 상태 확인
	boolean isLogin = false;
	if (userId == null) {//정보 없음, 로그아웃 상태
		isLogin = false;
        userId = "guest";
	} else {//정보 있음, 로그인 상태
		isLogin = true;
	}
   /*
    class SessionMember{
        String id="";
        String list[];
        
        public void setId(String id){
            this.id = id;
        }
        
        public SessionMember(SessionMember s){
            this.id = s.id;
            this.list = s.list;
        }
    }
   */
   // try{
            // 회원 ID로 세션 가져오기
            ArrayList<String> sessionList = (ArrayList)session.getAttribute(userId);    
    
            if(sessionList == null){            // 세션이 없을 경우.. 장바구니에 추가한적 없는 경우
                
                sessionList = new ArrayList<String>();
                session.setAttribute(userId,sessionList);
                
            }
            
            String goodsList[] = {""};
            
            if(sessionList != null){
                for(int i = 0; i<sessionList.size(); i++){
                    goodsList[i] = (String)(sessionList.get(i));      // 배열로 옮기기
                }
            }

            if(goodsList.length<=0){
%>
            <h1> 장바구니가 비었습니다. </h1>
<%
            }else{
%>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <table>
                                <tr>
                                    <th class="col-md-1">상품번호</th>
                                    <th class="col-md-3">상품이미지</th>
                                    <th class="col-md-2">상품이름</th>
                                    <th class="col-md-2">상품수량</th>
                                    <th class="col-md-2">가격</th>
                                </tr>
<%
                for(int i = 0; i < goodsList.length; i++){
                    FoodDTO = FoodDAO.getFood(Integer.parseInt(goodsList[i])+1);
%>
                        <tr>
                            <td class="col-md-1"><%=FoodDTO.getNum()%></td>
                            <td class="col-md-3"><img src="<%=FoodDTO.getImg()%>"/></td>
                            <td class="col-md-2"><%=FoodDTO.getName()%></td>
                            <td class="col-md-2"><input type="text" name="quantity" value=1></td>
                            <td class="col-md-2"><%=FoodDTO.getCost()%></td>
                        </tr>
<%
                }
%>
                            </table>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </div>
<%

           }
        //}catch(Exception e){
%>
    
<%
        //}
%>
<jsp:include page="../LAYOUT/bottom.jsp"/>