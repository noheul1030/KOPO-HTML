<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*,java.io.*"%> <!--java import-->
<html>
    <head>
    	<style>
		  table {
		    width: 80%;
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
		  a {text-decoration-line: none;}
		  a:hover {
			  background-color: gold;
			  border-color: white;
			  color: black;
			  font-size : 15px;
			  background-image: linear-gradient(45deg, white 50%, transparent 50%);
			  background-position: 100%;
		  	  background-size: 400%;
			  transition: background 300ms ease-in-out;
			}

		</style>
    </head>
    <body>
<%      try{
			//DB연동 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
	        Statement stmt = conn.createStatement();
	        ResultSet rset = stmt.executeQuery("select * from jspDB;");
	%>
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
		}catch(Exception e){
			out.println("테이블 전체 값 조회 오류입니다.\n");
			out.println(e);
		}
%>
        </table>
    </body>
</html>