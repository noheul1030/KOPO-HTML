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
 				border-width: 2px;
 				cellspacing="1"
   			}
   			tr,td{border-width: 2px;text-align : left;}
   			textarea,input{
   				width: 98%;
   				margin: 4px;
   				margin-left:5px;
   			}
			textarea:hover{
			 background-color: #f5f5f5; 
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
			span{
				margin-left:3px;
			}
		</style>
	</head>
	<body>
<%
	FreeBoardDao dao = new FreeBoardDaoImpl();
	String key = request.getParameter("key");
	
	dao.visit(key);

	Integer id = null;
	String title = null;
	String date = null;
	String content = "";
	Integer rootid = null;
	Integer relevel = null;
	Integer recnt = null;
	Integer viewcnt = null;

	request.setCharacterEncoding("utf-8");
	ResultSet rset = dao.selectOne(key);
	while(rset.next()){
		
		id = rset.getInt(1);
		title = rset.getString(2);
		date = rset.getString(3);
		if(rset.getString(4) != null){
			content = rset.getString(4);
		}
		rootid = rset.getInt(5);
		relevel = rset.getInt(6);
		recnt = rset.getInt(7);
		viewcnt = rset.getInt(8);
	}
%>	
	<form method='post'>
	<table border='1'>
		<tr>
			<td width= 15%><span>번호</span></td>
			<td colspan='3' align='left' width= 85%><input type='text' name='id' value='<%=id%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 15%><span>제목</span></td>
			<td colspan='3' align= 'left' width= 85%><input type='text' name= 'title' value='<%=title%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 15%><span>일자</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 15%><span>조회수</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='date' value='<%=viewcnt%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 15%><span>내용</span></td>
			<td colspan='3' align= 'left' width= 85%>
			<textarea name="content" readonly style="height: 200px; max-height: 150px; overflow-x: auto; overflow-y: scroll;resize: none;"><%=content%></textarea>
			</td>
		</tr>
		<tr>
			<td width= 15%><span>원글</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='date' value='<%=rootid%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 15%><span>댓글수준</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='date' value='<%=relevel%>' readonly style="all: unset; margin-left:5px;"></td>
			<td width= 15% style="border:none;"><span>댓글내 순서</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='date' value='<%=recnt%>' readonly style="width:100px;margin-left:5px;"></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan='2' style="text-align:right;">
				<input class='fourth' type='submit' value='목록' formaction = 'freeboard_list.jsp' 
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
					
				<input class='fourth' type='submit' value='수정' formaction = 'freeboard_update.jsp'
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">

				<input class='fourth' type='submit' value='삭제' formaction = 'freeboard_delete.jsp'
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">

				<input class='fourth' type='submit' value='댓글' formaction = 'freeboard_reinsert.jsp'
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>