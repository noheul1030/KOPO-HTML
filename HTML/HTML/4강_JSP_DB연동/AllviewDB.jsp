<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*,java.io.*"%> <!--java import-->
<html>
    <head>
    </head>
    <body>
<%      
		//DB연동 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery("select * from jspDB;");
%>
		<!--테이블 형태 지정-->
        <table cellspacing="1" width=600 border="1">
            <tr>
                <td width="50"><p align=center>이름</p></td> <!--셀 형태 지정-->
                <td width="50"><p align=center>학번</p></td> <!--셀 형태 지정-->
                <td width="50"><p align=center>국어</p></td> <!--셀 형태 지정-->
                <td width="50"><p align=center>영어</p></td> <!--셀 형태 지정-->
                <td width="50"><p align=center>수학</p></td> <!--셀 형태 지정-->
            </tr>
<%
			// 반복문 
            while (rset.next()){ // rset의 next값이 true일 때
                out.println("<tr>"); 
            	// 셀 형태 지정, 이름 값을 key로 클릭 시 해당 url oneviewDB로 연결, key에 대한 정보만 보여지도록 한다.
                out.println("<td width=50><p align=center><a href = 'oneviewDB.jsp?key="+rset.getString(1)+"'>"+rset.getString(1)+"</a></p></td>");
            	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
            	 // 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
             	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
            	 // 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
                out.println("<tr>");
            }
            rset.close(); // resultSet 종료
            stmt.close(); // statement 종료
            conn.close(); // connection 종료
%>
        </table>
    </body>
</html>