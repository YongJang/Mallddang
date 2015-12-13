<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!-- writePro.jsp : 넘어온 정보 포장에서 DAO에게 전달 -->

<!-- 데이터 수신 : writer, title, content -->
<jsp:useBean id="bdto" class="board.BoardDTO"/>
<jsp:setProperty name="bdto" property="*"/>

<!-- 유효성 검사 : 필요하다면 한다. -->

<!-- DAO생성 -->
<jsp:useBean id="bdao" class="board.BoardDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String serviecPath = request.getContextPath() + "/fileupload/test";
	String upPath = config.getServletContext().getRealPath("/fileupload/test");
	MultipartRequest mr = null;
	DefaultFileRenamePolicy dp = null;
	try {
		dp = new DefaultFileRenamePolicy();
		mr = new MultipartRequest(request, upPath, 10 * 1024 * 1024,
				"utf-8", dp);
	} catch (java.io.IOException e) {
		e.printStackTrace();//에러 출력
	}
	boolean result = bdao.insertBoard(mr);
	if (result) {%> 
		<script type="text/javascript">
			alert("글 등록 성공");
			location.href="list.jsp";
		</script>
<%	}else{%>
		<script type="text/javascript">
			alert("글 등록 실패");
			history.back();
		</script>
<%	} %>










