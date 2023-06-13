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
	
	Integer number = null; // 변수 선언
	String title = null; // 변수 선언
	String date = null; // 변수 선언
	String content = ""; // 변수 선언

	request.setCharacterEncoding("utf-8"); // 전달 받는 값들의 인코딩 설정을 utf-8로 지정
	// 전달받은 key 값으로 해당 칼럼정보 조회
	ResultSet rset = dao.selectOne(request.getParameter("key"));
	while(rset.next()){ // 결과 값을 한줄씩 출력, 값이 있으면 true
		
		number = rset.getInt(1); // 값 저장
		title = rset.getString(2); // 값 저장
		date = rset.getString(3); // 값 저장
		if(rset.getString(4) != null){ // 해당 칼럼의 값이 null이 아니면 
			content = rset.getString(4); // 값 저장
		}
	}
%>	
	<form method='post'> <!-- form 메소드 post 지정 -->
	<table border='1'> <!-- 테이블 테두리 1 지정 -->
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td width= 10% bgcolor='#fff6dd'>번호</td>
			<td align='left' width= 85%><input type='text' name='number' value='<%=number%>' readonly style="all: unset;margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td width= 10% bgcolor='#fff6dd'>제목</td>
			<td align= 'left' width= 85%><input type='text' name= 'title' value='<%=title%>' readonly style="all: unset;margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td width= 10% bgcolor='#fff6dd'>일자</td>
			<td align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset;margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td width= 10% bgcolor='#fff6dd'>내용</td>
			<td align= 'left' width= 85%>
			<textarea name="content" readonly style="height: 200px; max-height: 150px; overflow-x: auto; overflow-y: scroll;resize: none;"><%=content%></textarea>
			</td>
		</tr>
	</table>
	
	<table>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td colspan='2' align='right'>
				<!-- 버튼 클릭 시 gongji_list.jsp 이동 -->
				<input class='fourth' type='submit' value='뒤로 가기' formaction = 'gongji_list.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;" formnovalidate>
				<!-- 버튼 클릭 시 gongji_update.jsp 이동 -->		
				<input class='fourth' type='submit' value='수정 하기' formaction = 'gongji_update.jsp'
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form> <!-- form 태그 종료 -->
	</body>
</html>