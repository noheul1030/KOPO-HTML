<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
   			}
   			h2{margin-top:20px;}
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
	request.setCharacterEncoding("utf-8");
	
	String name ="";
	String deleteKey = request.getParameter("key");
	String query = String.format("select name from market where id = '%s'",deleteKey);
	ResultSet rset = dao.stmt().executeQuery(query);

	while(rset.next()){
		name=rset.getString(1);
	}
	
	dao.delete(deleteKey);
%>	
	<table border='1' style="text-align:left;">
		<tr>
			<td align='center'><h2>(주)트와이스 재고 현황 - 상품삭제</h2></td>
		</tr>
	</table>
	<br><br><br><br>
	<form method='post'>
	<table>
		<tr>
			<td><h3>상품번호: <%=deleteKey%>, 상품명: <%=name%> 삭제 되었습니다.</h3></td>
		</tr>
		<tr>
			<td align = 'center'>
			<input class='fourth' type='submit' value='재고 현황' formaction = 'create_list.jsp'
				style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form>
	
	</body>
</html>