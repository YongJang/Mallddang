<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- content.jsp : 한개의 글 출력 페이지 -->
<%@ page import="java.util.*" %>
<jsp:useBean id="bdao" class="board.BoardDAO"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/main/main.css" rel="stylesheet" type="text/css">
<title>몰땅</title>
</head>
<body>
<%@ include file="../LAYOUT/top.jsp"%>
<%
		if(!isLogin){//로그인 안된 경우 거절
			response.sendRedirect("list.jsp");
			return;
		}
%>
<%
		String servicePath = request.getContextPath()+"/fileupload/test";
		String upPath = config.getServletContext().getRealPath("/fileupload/test"); 
		String tmp = request.getParameter("num");
		int num=0;
		try{
			num = Integer.parseInt(tmp);
			if(num<=0) throw new Exception();
		}catch(Exception e){
			response.sendRedirect("list.jsp");
			return;//_jspService() 종료
		}
		
		//세션에서 HashSet() 추출
		HashSet<Integer> table 
		= (HashSet<Integer>)session.getAttribute("table");
		
		//테이블이 없으면 table==null
		if(table==null){
			table = new HashSet<Integer>();
		}
		
		if(table.add(num)){//true라면 안읽은 글
			//안읽은 글이라면 조회수 1 증가
			bdao.plusCount(num);
			//테이블 다시 저장
			session.setAttribute("table", table);
		}
		
		board.BoardDTO bdto = bdao.getBoard(num);
		if(bdto==null){
			response.sendRedirect("list.jsp");
			return;
		}
		
		boolean isMine = false;
		if(userId.equals(bdto.getWriter())){
			isMine = true;
		}else{
			isMine = false;
		}
%>
<script type="text/javascript">
	function sendReply(){
		//reply.jsp로 전송하면서 ref, re_step, re_level 첨부
		document.replyForm.submit();
	}
	function sendEdit(num){
		location.href="edit.jsp?num="+num;
	}
	function sendDelete(num){
		var result = window.confirm("정말로?");
		if(result){
			location.href="delete.jsp?num="+num;
		}
	}
</script>
<div align="center">
	<!-- replyForm : reply.jsp로 전송될 데이터가 hidden으로  -->
	<form name="replyForm" action="reply.jsp" method="post">
	<input type="hidden" name="ref" value="<%=bdto.getRef()%>">
	<input type="hidden" name="re_step" value="<%=bdto.getRe_step()%>">
	<input type="hidden" name="re_level" value="<%=bdto.getRe_level()%>">
	<input type="hidden" name="re_level" value="<%=bdto.getTitle()%>">
	</form>
	<hr color="red" width="300">
	<h1>글내용</h1>
	<hr color="red" width="300">
	<br>
	<table border="0" class="outline" width="600">
		<tr>
			<th class="m2" width="20%">작성일시</th>
			<td class="m3" width="30%">
				<%=bdto.getRegdate()%>
			</td>
			<th class="m2" width="20%">조회수</th>
			<td class="m3">
				<%=bdto.getReadcount()%>
			</td>
		</tr>
		<tr>
			<th class="m2" width="100">작성자</th>
			<td class="m3" colspan="3"><%=bdto.getWriter()%></td>
		</tr>
		<tr>
			<th class="m2">제목</th>
			<td class="m3" colspan="3"><%=bdto.getTitle()%></td>
		</tr>
		<tr height="150">
			<th class="m2">내용</th>
			<td class="m3" valign="top" colspan="3">
				<%=bdto.getContent()%>
			</td>
		</tr>
		<tr>
			<th class="m2">첨부파일</th>
			<td class="m3" colspan = "3">
				<%=bdto.getFilename() %>
				<%
				servicePath = request.getContextPath()+"/fileupload/test"; %>
				<a href="<%=servicePath %>/<%=bdto.getFilename() %>">
				다운로드
				</a>
				<%
					java.text.DecimalFormat df = new DecimalFormat("#.0");
				double size = bdto.getFilesize()/1024.0/1024.0;
				%>
				[크기 약 <%=df.format(size) %> Mbyte]
			</td>
		</tr>
		<tr>
			<th class="m2" colspan="4">
				<input type="button" value="글쓰기"
				onclick="location.href='write.jsp'">
				<input type="button" value="답글"
				onclick="sendReply();">
			<%if(isMine){ %>
				<input type="button" value="수정"
				onclick="sendEdit(<%=num%>);">
				<input type="button" value="삭제"
				onclick="sendDelete(<%=num%>);">
			<%} %>
				<input type="button" value="목록"
				onclick="location.href='list.jsp'">
			</th>
		</tr>
	</table>
	<br><br>
	<%
		ArrayList<board.ReplyDTO> reply = 
												bdao.listReply(num);
	%>
	<table class="outline" width="600">
		<!-- 목록 -->
		<%for(board.ReplyDTO rdto : reply){ %>
		<tr>
			<th class="m2" width="10%"><%=rdto.getWriter()%></th>
			<td class="m3"><%=rdto.getContent()%></td>
		</tr>
		<%} %>
		<!-- 등록 -->
		<tr>
			<td class="m3" colspan="2">
			<form action="reply_insert.jsp" method="post">
				<input type="text" name="writer" class="box"><br>
				<textarea name="content" rows="4" cols="40" class="box"></textarea>
				<input type="hidden" name="conum" value="<%=num%>"/>
				<br><input type="submit" value="등록">
			</form> 
			</td>
		</tr>
	</table>
</div>
<%@ include file="../LAYOUT/bottom.jsp"%>
	</body>
</html>