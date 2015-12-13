<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*"%>
<!-- list.jsp : 목록 페이지(검색 겸용) -->
<jsp:useBean id="bdao" class="board.BoardDAO" />
<%
	//페이징 작업을 위한 계산
	int pageSize = 5; //페이지에 표시할 글 수

	//현재 페이지 정보 받기
	String pageNum = request.getParameter("page");
	int curPage = 0; //현재 페이지
	try {
		curPage = Integer.parseInt(pageNum);
		if (curPage <= 0)
			throw new Exception();
	} catch (Exception e) {
		curPage = 1;
	}

	//게시글 수 구해오기
	int count = bdao.getBoardCount();
	int pages = (count / 5) + (count % 5 == 0 ? 0 : 1);
	//시작번호와 종료번호 계산

	//현재 1	2	3	4
	//시작 1	6	11	16
	//종료 5	10	15	20

	//시작 번호 = (현페이지 - 1) * 페이지 크기 + 1
	int startRow = (curPage - 1) * pageSize;
	//종료 번호 = 시작번호 + 페이지 크기 - 1
	int endRow = startRow + pageSize;
	if (endRow > count) {
		endRow = count;
	}
%>
<%
	//검색어를 받는 작업
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("search");
	String searchString = request.getParameter("searchString");

	ArrayList<BoardDTO> list = null;
	if (search != null && searchString != null
			&& !searchString.trim().equals("")) {
		list = bdao.searchBoard(search, searchString, startRow, endRow);
	} else {
		list = bdao.listBoard(startRow, endRow);
	}
%>
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
	<div align="center">
		<h2>
			curPage :
			<%=curPage%>, startPage :
			<%=startRow%>, endRow :
			<%=endRow%>, search :
			<%=search%>, searchString :
			<%=searchString%></h2>
		<!-- 글쓰기 버튼 -->
		<%
			if (isLogin) {
		%>
		<table border="0" width="600">
			<tr>
				<td align="right"><input type="button" value="글쓰기"
					onclick="location.href='write.jsp'"></td>
			</tr>
		</table>
		<%
			}
		%>

		<!-- 목록 출력 -->
		<%
			if (list == null || list.size() == 0) {
		%>
		<table class="outline" width="600">
			<tr>
				<th class="m2"><font color="red" size="5"> 등록된 게시글이
						없습니다. </font></th>
			</tr>
		</table>
		<%
			} else {
		%>
		<table class="outline" width="600">
			<!-- 제목 -->
			<tr>
				<th class="m2">번호</th>
				<th class="m2">제목</th>
				<th class="m2">작성자</th>
				<th class="m2">등록일</th>
				<th class="m2">조회수</th>
			</tr>
			<!-- 내용 -->
			<%
				for (BoardDTO bdto : list) {
			%>
			<tr align="center">
				<td class="m3"><%=bdto.getNum()%></td>
				<td class="m3" align="left" width="40%">
					<!-- 답글이라면 띄어쓰기 처리 --> <%
 	if (bdto.getRe_level() > 0) {
 %> <img src="../img/level.gif" width="<%=15 * bdto.getRe_level()%>"
					height="15"> <!-- 화살표 추가 --> <img src="../img/re.gif"
					width="30" height="15"> <%
 	}
 %> <!-- 제목에 링크 설정(로그인 시에만) --> <%
 	if (isLogin) {
 %> <a href="content.jsp?num=<%=bdto.getNum()%>"> <%
 	}
 %> <%=bdto.getTitle()%> <!-- 댓글 개수 추가(존재할 때만) --> <%
 	if (bdto.getReplyqty() > 0) {
 %> [<%=bdto.getReplyqty()%>] <%
 	}
 %> <%
 	if (isLogin) {
 %>
				</a> <%
 	}
 %> <!-- 조회수에 따른 인기글 이미지 표시 --> <%
 	if (bdto.getReadcount() >= 1) {
 %> <img src="../img/hot.gif" width="40" height="15"> <%
 	}
 %> <%
 	if (bdto.getFilename() != null) {
 %> <img src="../img/folder.gif" width="14" height="12"> <%
 	}
 %>
				</td>
				<td class="m3"><%=bdto.getWriter()%></td>
				<td class="m3"><%=bdto.getRegdate()%></td>
				<td class="m3"><%=bdto.getReadcount()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
		%>
		<br>
		<%
			//블럭 계산
			int pageBlock = 5;
			//전체 페이지(블럭) 수 계산
			//전체페이지 = 총 게시글 수 / 페이지 크기 + 0 또는 1
			int totalBlock = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startBlock = curPage-5;
			if (startBlock < 1) {
				startBlock = 1;
			}
			int endBlock = curPage+5;
			if (endBlock > totalBlock) {
				endBlock = totalBlock;
			}
		%>
		<%
			if (curPage != 1) {
		%>
		<a href="list.jsp?page=<%=1%>">[처음]</a>
		<%
			}
			if (curPage > 5) {
		%>
		<a href="list.jsp?page=<%=curPage - 5%>"> [이전]</a>
		<%
			}
			for (int i = startBlock; i <= endBlock; i++) {
		%>
		<a href="list.jsp?page=<%=i%>"><%=i%></a>
		<%
			}
		%>
		<%
			if (totalBlock+1-curPage > 5) {
		%>
		<a href="list.jsp?page=<%=curPage + 5%>"> [다음]</a>
		<%
			}
		%>
		<%
			if (curPage != endBlock) {
		%>
		<a href="list.jsp?page=<%=totalBlock%>">[마지막]</a>
		<%
			}
		%>
		<br>
		<h2>
			total :
			<%=totalBlock%>
			start :
			<%=startBlock%>
			end :
			<%=endBlock%>
		</h2>
		<!-- 검색창 -->
		<form method="get" action="list.jsp">
			<select name="search" class="box">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
			</select> <input type="text" name="searchString" class="box"> 
			<input type="submit" value="검색">
		</form>
	</div>
	<%@ include file="../LAYOUT/bottom.jsp"%>
	</body>
</html>