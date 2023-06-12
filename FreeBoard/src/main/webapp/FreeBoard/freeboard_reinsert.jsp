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
			input:hover{
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
	<script>
 	document.getElementById('myForm').addEventListener('submit', function(event) {
    event.preventDefault(); // form 제출 x
    location.href = 'freeboard_list.jsp';
  	});
	</script>
	
	<body>
<%
	FreeBoardDao dao = new FreeBoardDaoImpl();

	request.setCharacterEncoding("utf-8");

	int id = dao.lastNumber();
	String date = dao.date();
	Integer rootid = null;
	Integer relevel = null;
	Integer recnt = null;
	
	if(request.getParameter("rootid")!=null){
		rootid = Integer.parseInt(request.getParameter("rootid"));
		relevel = Integer.parseInt(request.getParameter("relevel"))+1;
		
		String query = String.format("select recnt from freeboard where rootid = %s order by recnt desc;",rootid);
		ResultSet rset = dao.stmt().executeQuery(query);
		
		while(rset.next()){
			recnt = rset.getInt(1)+1;
			break;
		}
	}
	
	String re = "";
	String titlePrint = "";
	for(int i = 0;i <= relevel; i++){
		if(i > 0){
			re = re + "-";
			titlePrint = titlePrint + "의 댓글";
		}
	}
	String titleFinal = re + ">[Re]원글" + rootid+titlePrint + " 입니다.[New]";
	
	
%>	
	<form method='post' id='myForm'>
	<table border='1'>
		<tr>
			<td width= 15%><span>번호</span></td>
			<td colspan='3' align='left' width= 85%><input type='text' name='id' value='<%=id%>' readonly style="all: unset; width:100px; margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 15%><span>제목</span></td>
			<td colspan='3' align= 'left' width= 85%><input type='text' name= 'title' value='<%=titleFinal%>' required></td>
		</tr>
		<tr>
			<td width= 15%><span>일자</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 15%><span>내용</span></td>
			<td colspan='3' align= 'left' width= 85%>
			<textarea name="content"style="height: 200px;max-height: 150px; overflow-x: auto; overflow-y: scroll;resize: none;"></textarea>
			</td>
		</tr>
		<tr>
			<td width= 15%><span>원글</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='rootid' value='<%=rootid%>' readonly style="all: unset; width:100px; margin-left:5px;"></td>
		</tr>
		<tr>
			<td width= 15%><span>댓글수준</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='relevel' value='<%=relevel%>' readonly style="all: unset; width:100px; margin-left:5px;"></td>
			<td width= 18%><span>댓글내 순서</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='recnt' value='<%=recnt%>' readonly style="all: unset; width:100px; margin-left:5px;"></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan='2' style="text-align:right;">
				<input class='fourth' type='submit' value='취소' formaction = 'freeboard_list.jsp'
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"formnovalidate>
					
				<input class='fourth' type='submit' value='저장' formaction = 'freeboard_write.jsp'
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>