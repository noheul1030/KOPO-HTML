<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDao" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDaoImpl" %> <!--java import-->

<html>
	<head>
		<style>
			table{
				margin-left: auto;
	  			margin-right: auto;			
			  	text-align: center; 
 				width: 80%; 
 				border-collapse: collapse;
 				border-width: 2px;
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
	request.setCharacterEncoding("utf-8");

	Integer number = null;
	String title = null;
	String date = null;
	String content = null;
	
	if(request.getParameter("number").equals("신규(insert)")){
		title = request.getParameter("title");
		date = request.getParameter("date");
		content = request.getParameter("content");
	}else{
		title = request.getParameter("title");
		date = request.getParameter("date");
		content = request.getParameter("content");
		number = Integer.parseInt(request.getParameter("number"));
	}
	
	int result = 0;
	if(dao.count()!=0){
	// number의 값이 존재하는지 여부 확인
		String query = String.format("SELECT CASE WHEN EXISTS (SELECT * FROM gongji WHERE number = %s) THEN 1 ELSE 0 END AS result;",request.getParameter("number"));
		ResultSet rset = dao.stmt().executeQuery(query);
		while (rset.next()){
			result = rset.getInt(1);
		}
	}
	
	if(result == 0){
		dao.newinsert(title, date, content);
%>	
		<br><br><br><br>
		<form method='post'>
		<table>
			<tr>
				<td><h3>게시글이 작성 되었습니다.</h3></td>
			</tr>
			<tr>
				<td align = 'center'>
				<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'gongji_list.jsp'
					style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
			</tr>
		</table>
		</form>
<%
	}else if(result == 1){
		dao.update(number, title, content);
%>	
	<br><br><br><br>
	<form method='post'>
	<table>
		<tr>
			<td><h3>게시글이 수정 되었습니다.</h3></td>
		</tr>
		<tr>
			<td align = 'center'>
			<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'gongji_list.jsp'
				style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form>
<%	
	}
%>
	</body>
</html>