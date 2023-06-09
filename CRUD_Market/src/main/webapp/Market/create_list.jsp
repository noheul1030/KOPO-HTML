<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*" %>

<html>
	<head>
		<style>
			table{
			  	text-align: center; 
 				width: 80%; 
 				border-collapse: collapse;
 				border : 1;
 				cellspacing:1;
 				table-layout: fixed;
   			}
   			.tr:hover{
   			 background-color : #f5f5f5;
   			}
   			h2{margin-top:20px;}
			a {text-decoration-line: none;  color: #696969;}
			a:hover {
			  font-size : 16px;
			  font-weight: bold;
			  background-position: 100%;
		  	  background-size: 400%;
			}
    		.fourth{
			  background: #ffdddd;
			  border-color: white;
			  color: black;
			  background-image: linear-gradient(45deg, #eecccc 50%, transparent 50%);
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
	MarketDao dao = new MarketDaoImpl();
	dao.createTable();
	
%>	
	<table border='1'>
		<tr>
			<td colspan='5'><h2>(주)트와이스 재고 현황 - 전체현황</h2></td>
		</tr>
		<tr bgcolor= ffdddd>
			<td>상품번호</td>
			<td>상품명</td>
			<td>현재 재고수</td>
			<td>재고파악일</td>
			<td>상품등록일</td>
		</tr>
<%
	ResultSet rset = dao.stmt().executeQuery("select * from market order by id asc;");
	while(rset.next()){
%>		
		<tr class='tr'>
			<td><a href = 'oneview.jsp?key=<%=rset.getInt(1)%>'><%=rset.getInt(1)%></a></td>
			<td><a href = 'oneview.jsp?key=<%=rset.getInt(1)%>'><%=rset.getString(2)%></a></td>
			<td><%=rset.getInt(3)%></td>
			<td><%=rset.getString(4)%></td>
			<td><%=rset.getString(5)%></td>
		</tr>
<%
	}
%>
	</table>
	
	<form method='post'>
	<table>
		<tr>
			<td width='15%'></td>
			<td></td>
			<td width='15%' align = 'right'>
			<input class='fourth' type='submit' value='신규등록' formaction = 'insert.jsp'
				style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>	
	</table>
	</form>
	
	
	
	
	
	</body>
</html>