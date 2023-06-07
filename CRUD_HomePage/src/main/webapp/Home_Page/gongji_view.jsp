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
 				border-width: 2px;
 				cellspacing="1"
   			}
   			tr,td{border-width: 2px;}
   			textarea,input{
   				width: 500px;
   				margin-top : 4px;
   				margin-bottom : 4px;
   				margin-left : 4px;
   				margin-right : 4px;
   				
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

	
	Integer number = null;
	String title = null;
	String date = null;
	String content = "";

	request.setCharacterEncoding("utf-8");
	ResultSet rset = dao.selectOne(request.getParameter("key"));
	while(rset.next()){
		
		number = rset.getInt(1);
		title = rset.getString(2);
		date = rset.getString(3);
		if(rset.getString(4) != null){
			content = rset.getString(4);
		}
	}
	
%>	
	<form method='post'>
	<table border='1'>
		<tr>
			<td width= 30%>번호</td>
			<td align='left' width= 85%><input type='text' name='number' value='<%=number%>' readonly style="all: unset;"></td>
		</tr>
		<tr>
			<td width= 30%>제목</td>
			<td align= 'left' width= 85%><input type='text' name= 'title' value='<%=title%>' readonly style="all: unset;"></td>
		</tr>
		<tr>
			<td width= 310%>일자</td>
			<td align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset;"></td>
		</tr>
		<tr>
			<td width= 30%>내용</td>
			<td align= 'left' width= 85%>
			<textarea name="content" readonly style="width: 500px; height: 200px; max-width: 500px; max-height: 150px; overflow-x: auto; overflow-y: scroll;"><%=content%></textarea>
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan='2' align='right'>
				<input class='fourth' type='submit' value='목록' formaction = 'gongji_list.jsp' 
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
					
				<input class='fourth' type='submit' value='수정' formaction = 'gongji_update.jsp?key=<%=number%>'
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>