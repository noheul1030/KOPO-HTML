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

	Integer id = null;
	String title = null;
	String date = null;
	String content = null;
	Integer rootid = null;
	Integer relevel = null;
	Integer recnt = null;
	
	if(request.getParameter("id").equals("신규(insert)")){
		title = request.getParameter("title");
		date = request.getParameter("date");
		content = request.getParameter("content");
	}else{
		id = Integer.parseInt(request.getParameter("id"));
		title = request.getParameter("title");
		date = request.getParameter("date");
		content = request.getParameter("content");
		
		if(request.getParameter("rootid") != null){
		rootid = Integer.parseInt(request.getParameter("rootid"));
		relevel = Integer.parseInt(request.getParameter("relevel"));
		recnt = Integer.parseInt(request.getParameter("recnt"));
			if(relevel > 0){
				dao.reinsert(title, date, content, rootid, relevel, recnt);
			}
		}
	}
	 
	int result = 0;
	if(dao.count()!=0){
	// number의 값이 존재하는지 여부 확인
		String query = String.format("SELECT CASE WHEN EXISTS (SELECT * FROM freeboard WHERE id = '%s') THEN 1 ELSE 0 END AS result;",request.getParameter("id"));
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
				<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'freeboard_list.jsp'
					style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
			</tr>
		</table>
		</form>
<%
	}else if(result == 1){
		dao.update(id, title, content);
%>	
	<br><br><br><br>
	<form method='post'>
	<table>
		<tr>
			<td><h3>게시글이 수정 되었습니다.</h3></td>
		</tr>
		<tr>
			<td align = 'center'>
			<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'freeboard_list.jsp'
				style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form>
<%	
	}
%>
	</body>
</html>