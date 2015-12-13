<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- write.jsp : 글쓰기 입력페이지 -->
<%
	String memberId = (String) session.getAttribute("memID");
	if (memberId == null) {
%>
<script>
	alert("로그인 되지 않았습니다.");
	location.href = "../LOGIN/login.jsp";
</script>
<%
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
<div align="center">
	<hr color="red" width="300">
	<h1>글쓰기</h1>
	<hr color="red" width="300">
	<br>
	<form name="f" action="writePro.jsp" method="post"
		onsubmit="return checkForm();" enctype = "multipart/form-data">
		<!-- onsubmit : submit을 누르면 발생하는 이벤트
			return checkForm()의 의미는
			checkForm()의 결과가 true이면 전송하겠다는 뜻 -->
	<!-- title, writer, content 만 입력하면 된다 -->
	<table border="0" class="outline" width="600">
		<tr>
			<th class="m2" width="100">작성자</th>
			<td class="m3">
				<input type="text" name="writer"
				class="box" maxlength="10"
				value="<%=memberId%>" readonly>
			</td>
		</tr>
		<tr>
			<th class="m2">제목</th>
			<td class="m3">
				<input type="text" name="title"
				class="box" maxlength="40" size="60">
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















