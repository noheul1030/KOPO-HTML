<?xml version="1.0" encoding="UTF-8"?> <!-- 인코딩 utf-8 -->
<%@ page contentType="text/xml; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %> <!-- java import -->

<html>
    <head>
	</head>
    <body>
<%
	// DB 연동
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
	Statement stmt = conn.createStatement();
	
	ResultSet rset = stmt.executeQuery("select * from Student_Score"); // 해당 테이블의 모든 정보 조회
	out.println("<datas>");
	
	while (rset.next()){ // 해당 조건이 true일 때
		out.println("<datas>"); // 데이타 읽기 시작
		
		out.println("<name>"+rset.getString(1)+"</name>"); // 이름
		out.println("<studentid>"+Integer.toString(rset.getInt(2))+"</studentid>"); // 학번
		out.println("<kor>"+rset.getInt(3)+"</kor>"); // 국어
		out.println("<eng>"+rset.getInt(4)+"</eng>"); // 영어
		out.println("<mat>"+rset.getInt(5)+"</mat>"); // 수학
		
		out.println("</datas>"); // 데이타 읽기 종료
	}
	out.println("</datas>");
	stmt.close(); // Statement 객체 종료
	conn.close(); // Connection 객체 종료
%>
	</body>
</html>