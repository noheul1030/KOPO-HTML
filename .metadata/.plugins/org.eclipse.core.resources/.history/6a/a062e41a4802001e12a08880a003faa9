<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*,java.io.*"%>
<html>
    <head>
    </head>
    <body>
        <h1>테이블 삭제 OK</h1> <!--head text 크기 1-->

<%      try{
 		//DB연동 		
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        Statement stmt = conn.createStatement();
		
        // 테이블 삭제 명령 쿼리 작성
        stmt.execute("truncate TupyoDB;");

        stmt.close();// statement 종료
        conn.close(); // connection 종료
		}catch(Exception e){
			out.println("테이블 전체 삭제 오류입니다.\n");
			out.println(e);
		}
%>
    </body>
</html>