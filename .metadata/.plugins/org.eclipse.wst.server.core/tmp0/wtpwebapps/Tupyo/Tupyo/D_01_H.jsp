<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->

<html>
    <head>
    	<style>
    		table {
    			text-align: center; 
   				border: 0; 
   				solid black; 
   				width: 600px; 
   				border-collapse: collapse;
   				cellspacing="1"}
    		th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
			}
			th:first-child, td:first-child {
			  border-left: none;
			}
    		a {text-decoration-line: none;  color: #696969;}
			h2:hover {
			 box-shadow: 0 0 40px 40px #ffd700 inset;
			}
    		h2,h4 {margin-top: 15px; text-align: center;}
    		.fourth {
			  background: gold;
			  border-color: white;
			  color: black;
			  background-image: linear-gradient(45deg, yellow 50%, transparent 50%);
			  background-position: 100%;
			  background-size: 400%;
			  transition: background 300ms ease-in-out;
			  border-radius: 5px;
			}
			
			.fourth:hover {
			  background-position: 0;
			}
			.check{
				box-shadow: 0 0 40px 40px #ffd700 inset;
			}
    	</style>
    </head>
    <body>
<%
   		// DB연동 
        Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
        Statement stmt = conn.createStatement();
        
        stmt.execute("drop table if exists HuboDB;");
        stmt.execute("drop table if exists TupyoDB;");
%>
		<table>
    		<tr>
    			<td width = 25%><a align = center id="update" href="A_01_H.jsp" target="content"><h2>후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2>투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2>개표결과</h2></a></td>
    			<td width = 25%><a align = center id="result" href="D_01_H.jsp" target="content"><h2 class="check">초기화</h2></a></td>
    		</tr>
		</table>
		
		<table>
			<tr><td><h2> 초기화를 완료 했습니다. </h2>
		</table>
	</body>
</html>