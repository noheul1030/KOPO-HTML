<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDao" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDaoImpl" %> <!--java import-->

<html>
	<head>
		<style>
			table{
			  	text-align: center; 
 				width: 600px; 
 				border-collapse: collapse;
 				cellspacing="1"
   			}
    		.fourth{
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
		</style>
	</head>
	<body>
<% 
	Home_PageDao dao = new Home_PageDaoImpl();
	dao.createTable();
	
%>	
	<table border = '1'>
		<tr>
			<td width = '10%'>번호</td>
			<td width = '65%'>제목</td>
			<td width = '25%'>등록일</td>
<%	
	
		 ResultSet rset = dao.stmt().executeQuery("select * from gongji order by number desc;");
		 while(rset.next()){
%>
		<tr>			
			<td><%=rset.getInt(1)%></td>
			<td align = left><a href =gongji_view.jsp?key=<%=rset.getString(2)%>><%=rset.getString(2)%></a></td>
			<td><%=rset.getString(3)%></td>
		</tr>
<%  
	
	}
	dao.stmt().close();
%>	
	</table>

	<form method = 'post'>
	<table>
		<tr>
			<td align = 'right'>
			<input class='fourth' type='submit' value='신규' formaction = 'gongji_insert.jsp'
				style="width: 60px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form>
	
	</body>
</html>
