<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*,java.io.*"%>
<html>
    <head>
    </head>
    <body>
        <h1>테이블 삭제 OK</h1> <!--head text 크기 1-->

<%      
 		//DB연동 		
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
        Statement stmt = conn.createStatement();
		
        // 테이블 삭제 명령 쿼리 작성
        stmt.execute("drop table if exists jspDB;");

        stmt.close();// statement 종료
        conn.close(); // connection 종료
%>
    </body>
</html>