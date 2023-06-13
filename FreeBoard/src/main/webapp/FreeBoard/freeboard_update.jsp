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
		
		function InputCheck(input) {
		  var inputValue = input; // 입력 받는 변수 혹은 데이터베이스에서 가져온 값 등
		  var pattern = /^(?!(&nbsp;|\s)*$).{1,70}$/;
		  
		  if(inputValue.trim().length === 0){
			alert("제목의 내용을 입력하세요");
		  	return false;
		  }else{
		    if (pattern.test(inputValue) && !inputValue.includes("&lt") && !inputValue.includes("&gt")
		    	  && !inputValue.includes("&#60") && !inputValue.includes("&#62")
				  && !inputValue.includes("<") && !inputValue.includes(">")) {
		      return inputValue;
		    } else {
		      alert("제목에는 <,>는 사용할 수 없습니다.");
		      return false; // 오류 발생 시 false를 반환하여 처리
		    }
		  }
		}
		function validateForm() {
			var title = document.forms["myForm"]["title"].value;
			var content = document.forms["myForm"]["content"].value;
			
			title = trimSpace(title);
			
			if (InputCheck(title) == false) {
				return false;
			}

		}
	</script>
	<body>
<%
	FreeBoardDao dao = new FreeBoardDaoImpl();
	
	request.setCharacterEncoding("utf-8");

	int id = Integer.parseInt(request.getParameter("id"));
	String title = null;
	String date = null;
	String content = null;
	
	Integer rootid = null;
	Integer relevel = null;
	Integer recnt = null;
	Integer viewcnt = null;
	
	String query = String.format("select * from freeboard where id = %d",id);
	ResultSet rset = dao.stmt().executeQuery(query);
	
	while(rset.next()){
		title = rset.getString(2);
		date = dao.date();
		if(rset.getString(4) != null){
			content = rset.getString(4);
		}
		rootid = rset.getInt(5);
		relevel = rset.getInt(6);
		recnt = rset.getInt(7);
		viewcnt = rset.getInt(8);
	}
%>	
	<form name="myForm" method="post" onsubmit="return validateForm()">
	<table border='1'>
		<tr>
			<td bgcolor='#dde5ff' width= 10%>번호</td>
			<td colspan='3' align='left' width= 85%><input type='text' name='id' value='<%=id%>' readonly style="all: unset; margin-left:5px;"></td>

		</tr>
		<tr>
			<td bgcolor='#dde5ff' width= 10%>제목</td>
			<td colspan='3' align= 'left' width= 85%><input type='text' maxlength='70' pattern="^(?!\s*$)(?!^*$){1,70}$" name= 'title' value='<%=title%>'
			 required title="공백 X, 70글자 이상 X"></td>
		</tr>
		<tr>
			<td bgcolor='#dde5ff' width= 10%>일자</td>
			<td colspan='3' align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr>
			<td bgcolor='#dde5ff' width= 10%>내용</td>
			<td colspan='3' align= 'left' width= 85%>
			<textarea name="content"style="height: 300px;max-height: 300px; overflow-x: auto; overflow-y: scroll;resize: none;"maxlength="6000000"><%=content%></textarea>
			</td>
		</tr>
		<tr>
			<td bgcolor='#dde5ff' width= 15%><span>원글</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='rootid' value='<%=rootid%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr>
			<td bgcolor='#dde5ff' width= 15%><span>댓글수준</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='relevel' value='<%=relevel%>' readonly style="all: unset; margin-left:5px;"></td>
			<td bgcolor='#dde5ff' width= 18%"><span>댓글내 순서</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='recnt' value='<%=recnt%>' readonly style="all: unset; width:100px;margin-left:5px;"></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan='2' align='right'>
				<input class='fourth' type='button' value='뒤로가기' formaction = 'freeboard_list.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"onclick="window.location.href = 'freeboard_list.jsp';">
					
				<input class='fourth' type='submit' value='저장' formaction = 'freeboard_write.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;">
					
				<input class='fourth' type='submit' value='삭제' formaction = 'freeboard_delete.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"formnovalidate>
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>