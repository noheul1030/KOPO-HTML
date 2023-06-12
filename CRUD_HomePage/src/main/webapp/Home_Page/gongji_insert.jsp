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
   			tr,td{border-width: 2px;}
   			textarea,input{
   				width: 98%;
   				margin: 4px;
   			}
			input:hover{
			 background-color: #f5f5f5; 
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
		</style>		
	</head>
	
	<script>
		function trimSpace(input) {
		  return input.replace(/^\s+/, '');
		}
	</script>
	
	<body>
<%
	Home_PageDao dao = new Home_PageDaoImpl();
	
	int count = dao.lastNumber();
	
	String title = null;
	String date = dao.date();
	
	dao.stmt().close();
%>	<form method='post'>
	<table border='1'>
		<tr>
			<td width= 10% bgcolor='#fff6dd'>번호</td>
<%		if(count == 1){ 
			title = "공지사항"; %>
			<td align='left' width= 85%><input type='text' name='number' value='신규(insert)' readonly style="all: unset;margin-left:5px;"></td>
<%		}else{ 
			title = "공지사항"+count; %>
			<td align='left' width= 85%><input type='text' name='number' value='<%=count%>' readonly style="all: unset;margin-left:5px;"></td>
<%		} %>
		</tr>
		<tr>
			<td width= 10% bgcolor='#fff6dd'>제목</td>
			<td align= 'left' width= 85%><input type='text' pattern="^(?!\s*$)(?!^\s*$)[^<>]{1,20}$" name= 'title' value='<%=title%>' onblur="this.value = trimSpace(this.value);" required title="공백 X,특수문자 <> 지양, 20글자 이상 X"></td>
		</tr>
		<tr>
			<td width= 10% bgcolor='#fff6dd'>일자</td>
			<td align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset;margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 10% bgcolor='#fff6dd'>내용</td>
			<td align= 'left' width= 85%>
			<textarea name="content"style="height: 200px;max-height: 150px; overflow-x: auto; overflow-y: scroll;resize: none;"></textarea>
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan='2' align='right'>
				<input class='fourth' type='submit' value='뒤로 가기' formaction = 'gongji_list.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"formnovalidate>
					
				<input class='fourth' type='submit' value='저장' formaction = 'gongji_write.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>