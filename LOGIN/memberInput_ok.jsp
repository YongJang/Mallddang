<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
/* desc member; 형태
create table member(
num int(11) primary key not null,
id varchar(15) not null,
passwd varchar(15) not null,
name char(15) null,
e_mail varchar(30) null,
phone varchar(15) null,
zipcode char(10) null,
address varchar(60) null,
regdate date null)charset=utf8;
*/


request.setCharacterEncoding("utf-8");
Class.forName("org.gjt.mm.mysql.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
   
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
        String e_mail = request.getParameter("email");
	String phone = request.getParameter("phone");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");

int counter = 0;
try{  	
	//커넥션 생성
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mallddang","root","multi");
   
   // 커넥션을 통해 질의를 전송하기 위한 객체(stmt)
   // stmt = conn.createStatement();
   // 객체(stmt)를 통해서 질의를 수행할 메소드를 사용
   // 질의수행 결과는 ResultSet으로 받는다.

	stmt = conn.createStatement();
	int count=0;
	
 	counter=stmt.executeUpdate("insert into member(id,passwd,name,e_mail,phone,zipcode,address) values('"+id+"','"+passwd+"','"+name+"','"+e_mail+"','"+phone+"','"+zipcode+"','"+address+"')");
/*
	PreparedStatement pstmt = null;
	String sql = "insert into member values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,passwd);
	pstmt.setString(3,name);
	pstmt.setString(4,e_mail);
	pstmt.setString(5,phone);
	pstmt.setString(6,zipcode);
	pstmt.setString(7,address);
	pstmt.executeUpdate();
	
*/
	rs = stmt.executeQuery("SELECT * FROM MEMBER");

	
	if(rs != null){
%>
<script>
   alert("회원 가입이 완료 되었습니다.");
   location.href = "../main.jsp";
</script>
<%
	}

}catch(SQLException sqlException){
	System.out.println("sql exception");
}catch(Exception exception){
	System.out.println("exception");
}finally{
	if( rs != null ) 
		try{ rs.close(); } 
		catch(SQLException ex) {}
	if( stmt != null ) 
		try { stmt.close(); } 
		catch(SQLException ex) {}
	if( conn != null ) 
		try{ conn.close(); }
		catch(Exception ex){}
}
%>