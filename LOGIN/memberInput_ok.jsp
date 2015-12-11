<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="member.*" %>
<!-- 이전 페이지에서 항목이 넘어온다. -->
<%	request.setCharacterEncoding("utf-8"); %>
<!-- jsp 로 시작하는 태그를 가지고 정보를 저장하겠다. -->

<!-- 빈 상자 생성(MemberDTO 객체 생성) -->
<jsp:useBean id="MemDTO" class="member.MemberDTO"/>

<!-- 내가만든 RegisterBean객체에 알아서 데이터 집어넣기 -->
<jsp:setProperty name="MemDTO" property="*"/>

<!-- useBean 태그로 MemberMgr객체 생성 -->
<jsp:useBean id="MemDAO" class="member.MemberDAO"></jsp:useBean>
<%
	//DAO 생성 후 DTO 주고 등록하라고 시킨다.
	//MemberDAO dao = new MemberDAO();
	boolean result = MemDAO.insertMember(MemDTO);	
		if(result){%><!-- 성공 : 창닫고 로그인페이지로 이동 -->
	 	<script type="text/javascript">
	 		alert("가입 성공! \n로그인하세요");
	 		window.opener.parent.location.href="login.jsp";//부모창 주소 변경
	 		window.close();//창 닫기
	 	</script>
<%	}else{ %><!-- 아이디 중복 : 뒤로보낸다. -->
		<script type="text/javascript">
	 		alert("아이디가 이미 사용중입니다.");
	 		history.back();//뒤로 보내기
	 	</script>
<%	} %>