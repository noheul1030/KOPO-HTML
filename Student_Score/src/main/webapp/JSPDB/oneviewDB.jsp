<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*,java.io.*"%> <!--java import-->
<html>
    <head>
    	<style>
		  table {
		    width: 70%;
		    border-top: 1px solid #444444;
		    border-collapse: collapse;
		  }
		  th, td {
		    border-bottom: 1px solid #444444;
		    border-left: 1px solid #444444;
		    padding: 10px;
		  }
		  th:first-child, td:first-child {
		    border-left: none;
		  }
		</style>
    </head>
    <body>
<%      try{
		//DB연동
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
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
        <h1>[<%=key%>] 조회</h1><!--해당 key값 head text 크기 1-->
        <!--테이블 형태 지정-->
        <table cellspacing="1" width=600 border="1">
            <tr>
                <td bgcolor = gold width="50"><p align=center><strong>이름</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>학번</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>국어</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>영어</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>수학</strong></p></td> <!--셀 형태 지정-->
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
			out.println("조회 오류입니다.\n");
			out.println(e);
		}
%>
        </table> 
    </body>
</html>