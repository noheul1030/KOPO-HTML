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
	
	int count = dao.lastNumber();
	
	String title = "공지사항"+count;
	String date = dao.date();
	
	dao.stmt().close();
	
%>	<form method='post'>
	<table border='1'>
		<tr>
			<td width= 10%>번호</td>
<%		if(count == 1){ %>
			<td align='left' width= 85%><input type='text' name='number' value='신규(insert)' readonly style="all: unset;"></td>
<%		}else{ %>
			<td align='left' width= 85%><input type='text' name='number' value='<%=count%>' readonly style="all: unset;"></td>
<%		} %>
		</tr>
		<tr>
			<td width= 10%>제목</td>
			<td align= 'left' width= 85%><input type='text' pattern="^(?!\s*$)(?!^\s*$).{1,20}$" name= 'title' value='<%=title%>' required title="공백 X, 20글자 이상 X"></td>
		</tr>
		<tr>
			<td width= 10%>일자</td>
			<td align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset;"></td>
		</tr>
		<tr>
			<td width= 10%>내용</td>
			<td align= 'left' width= 85%>
			<textarea name="content"style="width: 500px; height: 200px; max-width: 500px; max-height: 150px; overflow-x: auto; overflow-y: scroll;"></textarea>
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan='2' align='right'>
				<input class='fourth' type='submit' value='취소' formaction = 'gongji_list.jsp' 
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
					
				<input class='fourth' type='submit' value='쓰기' formaction = 'gongji_write.jsp' 
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>