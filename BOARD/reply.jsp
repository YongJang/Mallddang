<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- reply.jsp : write.jsp와 유사한 내용의 페이지 -->
<%@ page import="java.util.*" %>
<jsp:useBean id="bdao" class="board.BoardDAO"/>
<%@ include file="../LAYOUT/top.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
		if(!isLogin){//로그인 안된 경우 거절
			response.sendRedirect("list.jsp");
			return;
		}
%>
<%
	String tmp1 = request.getParameter("ref");
	String tmp2 = request.getParameter("re_step");
	String tmp3 = request.getParameter("re_level");
	String title = request.getParameter("title");
	int ref = -1, re_step = -1, re_level = -1;
	//유효성 검사
	try{
		ref = Integer.parseInt(tmp1);
		re_step = Integer.parseInt(tmp2);
		re_level = Integer.parseInt(tmp3);
		if(ref<0||re_step<0||re_level<0)
			throw new Exception();
	}catch(Exception e){
		response.sendRedirect("write.jsp");
		return;
	}
	
%>
<script type="text/javascript">
	function checkForm(){
		//alert("나불렀니?");
		//return false;//전송중지
		if(!f.title.value){
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}else if(!f.content.value){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		//return true;
	}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/main/main.css" rel="stylesheet" type="text/css">
<title>몰땅</title>
</head>
<body>
<div align="center">
	<hr color="red" width="300">
	<h1>글쓰기</h1>
	<hr color="red" width="300">
	<br>
	<form name="f" action="writePro.jsp" method="post"
		onsubmit="return checkForm();">
		<!-- onsubmit : submit을 누르면 발생하는 이벤트
			return checkForm()의 의미는
			checkForm()의 결과가 true이면 전송하겠다는 뜻 -->
	<!-- title, writer, content 만 입력하면 된다 -->
	<!-- 답글 상태값 hidden 첨부 -->
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re_step" value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	<table border="0" class="outline" width="600">
		<tr>
			<th class="m2" width="100">작성자</th>
			<td class="m3">
				<input type="text" name="writer"
				class="box" maxlength="10"
				value="<%=userId%>" readonly>
			</td>
		</tr>
		<tr>
			<th class="m2">제목</th>
			<td class="m3">
				<input type="text" name="title"
				class="box" maxlength="40" size="60"
				value="[답변]<%=title%>">
			</td>
		</tr>
		<tr>
			<th class="m2">내용</th>
			<td class="m3">
				<textarea name="content" rows="10" cols="60" class="box"></textarea>
			</td>
		</tr>
		<tr>
			<th class="m2">파일 업로더</th>
			<td class="m3">
				 <input type="file" name="filename"><br>
			</td>
		</tr>
		<tr>
			<th class="m2" colspan="2">
				<input type="submit" value="등록">
				<input type="reset" value="다시">
			</th>
		</tr>
	</table>
	</form>
</div>
<%@ include file="../LAYOUT/bottom.jsp"%>
</body>
</html>