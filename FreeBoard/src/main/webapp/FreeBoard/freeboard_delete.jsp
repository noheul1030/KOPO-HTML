<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*" %> <!--java import-->

<html>
	<head>
		<style>
			table{
				margin-left: auto;
	  			margin-right: auto;
			  	text-align: center; 
 				width: 80%; 
 				border-collapse: collapse;
 				cellspacing:1;
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
	FreeBoardDao dao = new FreeBoardDaoImpl();
	request.setCharacterEncoding("utf-8");

	int id = Integer.parseInt(request.getParameter("id"));
	int recnt = Integer.parseInt(request.getParameter("recnt"));
	
	dao.delete(id);
	String recntSet = String.format("update freeboard set recnt = recnt-1 where recnt > %d",recnt);
	dao.stmt().execute(recntSet);
%>	
	<br><br><br><br>
	<form method='post'>
	<table>
		<tr>
			<td><h3>게시글이 삭제 되었습니다.</h3></td>
		</tr>
		<tr>
			<td align = 'center'>
			<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'freeboard_list.jsp'
				style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form>
	
	</body>
</html>