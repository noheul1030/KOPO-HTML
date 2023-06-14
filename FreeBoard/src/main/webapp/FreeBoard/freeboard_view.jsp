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
				margin-left:5px;
			}
		</style>
	</head>
	
	<body>
<%
	FreeBoardDao dao = new FreeBoardDaoImpl();
	String key = request.getParameter("key"); // 전달받은 값 저장
	
	dao.visit(key); // 방문자수 카운트 

	Integer id = null; // 변수 선언
	String title = null; // 변수 선언
	String date = null; // 변수 선언
	String content = ""; // 변수 선언
	Integer rootid = null; // 변수 선언
	Integer relevel = null; // 변수 선언
	Integer recnt = null; // 변수 선언
	Integer viewcnt = null; // 변수 선언

	request.setCharacterEncoding("utf-8"); // 전달 받는 값들의 인코딩 설정을 utf-8로 지정
	ResultSet rset = dao.selectOne(key); // 키 값으로 하나의 정보 조회
	while(rset.next()){ // 결과 값을 한줄씩 출력, 값이 있으면 true
		
		id = rset.getInt(1); // 가져온 값 저장
		title = rset.getString(2); // 가져온 값 저장
		date = rset.getString(3); // 가져온 값 저장
		if(rset.getString(4) != null){ // 해당 칼럼의 값이 null이 아니면 
			content = rset.getString(4); // 가져온 값 저장
		}
		rootid = rset.getInt(5); // 가져온 값 저장
		relevel = rset.getInt(6); // 가져온 값 저장
		recnt = rset.getInt(7); // 가져온 값 저장
		viewcnt = rset.getInt(8); // 가져온 값 저장
	}
%>	<!-- form 메소드 post 지정 -->
	<form method='post'>
	<table border='1'> <!-- 테이블 테두리 1 지정 -->
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>번호</span></td>
			<td colspan='3' align='left' width= 85%><input type='text' name='id' value='<%=id%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>제목</span></td>
			<td colspan='3' align= 'left' width= 85%><span type='text' name= 'title'><%=title%></span></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>일자</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>조회수</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name=viewcnt value='<%=viewcnt%>' readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>내용</span></td>
			<td colspan='3' align= 'left' width= 85%>
			<textarea name="content" readonly style="height: 300px; max-height: 300px; overflow-x: auto; overflow-y: scroll;resize: none;"><%=content%></textarea>
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
			<td colspan='2' style="text-align:right;">
			<!-- 버튼 클릭 시 freeboard_list.jsp 이동 -->
				<input class='fourth' type='submit' value='목록' formaction = 'freeboard_list.jsp' 
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;"formnovalidate>
			<!-- 버튼 클릭 시 freeboard_update.jsp 이동 -->		
				<input class='fourth' type='submit' value='수정' formaction = 'freeboard_update.jsp'
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
			<!-- 버튼 클릭 시 freeboard_delete.jsp 이동 -->
				<input class='fourth' type='submit' value='삭제' formaction = 'freeboard_delete.jsp'
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;"formnovalidate>
			<!-- 버튼 클릭 시 freeboard_reinsert.jsp 이동 -->
				<input class='fourth' type='submit' value='댓글' formaction = 'freeboard_reinsert.jsp'
					style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>