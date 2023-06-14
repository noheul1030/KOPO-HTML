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
		// input받는 값의 앞 공백 제거
		function trimSpace(input) {
		  return input.replace(/^\s+/, '');
		}
		// input받는 값의 유효성 검사(<,> 입력방지, 글자수 70자)
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
		// form안에 들어오는 id 값들의 유효성 검사 
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
	
	int count = dao.lastNumber(); // 비어있는 최소 값 찾기
	
	String title = null;
	String date = dao.date(); // 날짜 값 저장
	
	conn.close();
	stmt.close();
	 // form 메소드 post 지정 submit 발생 시 해당 function 실행
%>	<form name="myForm" method="post" onsubmit="return validateForm()">
	<table border='1'> <!-- 테이블 테두리 1 지정 -->
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 10%>번호</td>
<%		if(count == 1){  // count의 값이 1이면 (아무 값도 안들어있다는 뜻) true 조건
			title = "공지사항"; %>
			<td align='left' width= 85%><input type='text' name='id' value='신규(insert)' readonly style="all: unset; margin-left:5px;"></td>
<%		}else{  // count의 값이 1이 아니면 (값이 들어있다는 뜻)
			title = "공지사항"+count; %>
			<td align='left' width= 85%><input type='text' name='id' value='<%=count%>' readonly style="all: unset; margin-left:5px;"></td>
<%		} %>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 10%>제목</td>
			<!-- 값이 들어올때 유효성을 검사하고 맞지 않을 경우 경고문구 팝업 -->
			<td align= 'left' width= 85%><input type='text' maxlength='70' pattern="^(?!\s*$)(?!^*$){1,70}$" name= 'title' value='<%=title%>'
			 required title="앞공백 X, 70글자 이상 X"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 10%>일자</td>
			<td align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 10%>내용</td>
			<td colspan='3' align= 'left' width= 85%>
			<textarea name="content"style="height: 300px;max-height: 300px; overflow-x: auto; overflow-y: scroll;resize: none;"maxlength="6000000"></textarea>
			</td>
		</tr>
	</table>
	
	<table>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td colspan='2' align='right'>
			<!-- 버튼 클릭 시 freeboard_list.jsp 이동 -->
				<input class='fourth' type='button' value='취소' formaction = 'freeboard_list.jsp' 
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;"onclick="window.location.href = 'freeboard_list.jsp';">
			<!-- 버튼 클릭 시 freeboard_write.jsp 이동 -->		
				<input class='fourth' type='submit' value='쓰기' formaction = 'freeboard_write.jsp' 
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form> <!-- form 태그 종료 -->	
	</body>
</html>