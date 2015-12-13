<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- edit.jsp : 수정 입력 페이지 -->
<jsp:useBean id="bdao" class="board.BoardDAO"/>
<%
	String tmp = request.getParameter("num");
	int num=0;
	try{
		num = Integer.parseInt(tmp);
		if(num<=0) throw new Exception();
	}catch(Exception e){
		response.sendRedirect("list.jsp");
		return;//_jspService() 종료
	}
	
	board.BoardDTO bdto = bdao.getBoard(num);
%>
<%@ include file="../LAYOUT/top.jsp"%>
<%
		if(!isLogin || !userId.equals(bdto.getWriter())){//로그인 안된 경우 거절
			response.sendRedirect("list.jsp");
			return;
		}
%>
<script type="text/javascript">
	function checkForm(){
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
	<h1>글수정</h1>
	<hr color="red" width="300">
	<br>
	<form name="f" action="editPro.jsp" method="post"
		onsubmit="return checkForm();">
		<!-- onsubmit : submit을 누르면 발생하는 이벤트
			return checkForm()의 의미는
			checkForm()의 결과가 true이면 전송하겠다는 뜻 -->

	<input type="hidden" name="num" value="<%=num%>">	
	
	<table border="0" class="outline" width="600">
		<tr>
			<th class="m2" width="100">작성자</th>
			<td class="m3">
				<input type="text" name="writer"
				class="box" maxlength="10"
				value="<%=bdto.getWriter()%>" readonly>
			</td>
		</tr>
		<tr>
			<th class="m2">제목</th>
			<td class="m3">
				<input type="text" name="title"
				class="box" maxlength="40" size="60"
				value="<%=bdto.getTitle()%>">
			</td>
		</tr>
		<tr>
			<th class="m2">내용</th>
			<td class="m3">
				<textarea name="content" rows="10" cols="60" 
				class="box"><%=bdto.getContent()%></textarea>
			</td>
		</tr>
		<tr>
			<th class="m2" colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="다시">
			</th>
		</tr>
	</table>
	</form>
</div>
<%@ include file="../LAYOUT/bottom.jsp"%>
</body>
</html>








