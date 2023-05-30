<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*,java.io.*"%> <!--java import-->
<html>
    <head>
    </head>
    <body>
<%      
try{
		//DB연동
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopo11","root","shdmf1030@");
        // 뭐리문 작성
        String query = "SELECT * FROM jspDB WHERE name = ?";
        // 파라미터 전달 statement 뭐리 전달
        PreparedStatement pstmt = conn.prepareStatement(query);

		// key값 저장
        String key = request.getParameter("key");
		// key값에 대한 정보 조회
        pstmt.setString(1, key);
        // resultset에 쿼리문 전달
        ResultSet rset = pstmt.executeQuery();
%>
        <h1>[<%=key%>]조회</h1><!--해당 key값 head text 크기 1-->
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
			//반복문 
            while (rset.next()){ // rset의 next값이 true일 때
                out.println("<tr>");
             	// 셀 형태 지정
                out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>");
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
            pstmt.close(); // PreparedStatement 종료
            conn.close(); // connection 종료
            }catch(Exception e){
                out.println(e);
} 
%>
        </table> 
    </body>
</html>