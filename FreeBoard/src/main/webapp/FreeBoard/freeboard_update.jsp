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
	String driver = "com.mysql.cj.jdbc.Driver";
	String connection = "jdbc:mysql://192.168.23.60:3307/kopo11";
	//String connection = "jdbc:mysql://localhost:3306/noheul";
	String root = "root";
	String password = "shdmf1030@";
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		
	Class.forName(driver);
	conn = DriverManager.getConnection(connection, root,password);
	stmt = conn.createStatement();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	FreeBoardDao dao = new FreeBoardDaoImpl();
	
	request.setCharacterEncoding("utf-8"); // 전달 받는 값들의 인코딩 설정을 utf-8로 지정

	int id = Integer.parseInt(request.getParameter("id")); // 전달받은 값 저장
	String title = null; // 변수 선언
	String date = null; // 변수 선언
	String content = null; // 변수 선언
	
	Integer rootid = null; // 변수 선언
	Integer relevel = null; // 변수 선언
	Integer recnt = null; // 변수 선언
	Integer viewcnt = null; // 변수 선언
	
	// id 값으로 테이블 정보 조회
	String query = String.format("select * from freeboard where id = %d",id);
	ResultSet rset = stmt.executeQuery(query); // 쿼리 실행 값 저장
	
	while(rset.next()){ // 결과 값을 한줄씩 출력, 값이 있으면 true
		title = rset.getString(2); // 가져온 값 저장
		date = dao.date(); // 날짜 값 저장
		if(rset.getString(4) != null){ // 해당 칼럼의 값이 null이 아니면 
			content = rset.getString(4); // 값 저장
		}
		rootid = rset.getInt(5); // 값 저장
		relevel = rset.getInt(6); // 값 저장
		recnt = rset.getInt(7); // 값 저장
		viewcnt = rset.getInt(8); // 값 저장
	}
	
	conn.close();
	stmt.close();
%>	 <!-- form 메소드 post 지정 -->
	<form name="myForm" method="post" onsubmit="return validateForm()">
	<table border='1'> <!-- 테이블 테두리 1 지정 -->
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 10%>번호</td>
			<td colspan='3' align='left' width= 85%><input type='text' name='id' value='<%=id%>' readonly style="all: unset; margin-left:5px;"></td>

		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 10%>제목</td>
			<td colspan='3' align= 'left' width= 85%><input type='text' maxlength='70' pattern="^(?!\s*$)(?!^*$){1,70}$" name= 'title' value='<%=title%>'
			 required title="공백 X, 70글자 이상 X"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 10%>일자</td>
			<td colspan='3' align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 10%>내용</td>
			<td colspan='3' align= 'left' width= 85%>
			<textarea name="content"style="height: 300px;max-height: 300px; overflow-x: auto; overflow-y: scroll;resize: none;"maxlength="6000000"><%=content%></textarea>
			</td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>원글</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='rootid' value='<%=rootid%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>댓글수준</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='relevel' value='<%=relevel%>' readonly style="all: unset; margin-left:5px;"></td>
			<td bgcolor='#dde5ff' width= 18%"><span>댓글내 순서</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='recnt' value='<%=recnt%>' readonly style="all: unset; width:100px;margin-left:5px;"></td>
		</tr>
	</table>
	
	<table>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td colspan='2' align='right'>
			<!-- 버튼 클릭 시 freeboard_list 이동 -->
				<input class='fourth' type='button' value='뒤로가기' formaction = 'freeboard_list.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"onclick="window.location.href = 'freeboard_list.jsp';">
			<!-- 버튼 클릭 시 freeboard_write.jsp 이동 -->		
				<input class='fourth' type='submit' value='저장' formaction = 'freeboard_write.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;">
			<!-- 버튼 클릭 시 freeboard_delete.jsp 이동 -->		
				<input class='fourth' type='submit' value='삭제' formaction = 'freeboard_delete.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"formnovalidate>
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>