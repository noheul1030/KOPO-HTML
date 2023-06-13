<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDao" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDaoImpl" %> <!--java import-->

<html>
	<head>
		<style>
			/*테이블 스타일 지정*/
			table{ 
				margin-left: auto;
	  			margin-right: auto;			
			  	text-align: center; 
 				width: 80%; 
 				border-collapse: collapse;
 				border-width: 2px;
 				cellspacing="1"
   			}
   			
   			/*버튼의 스타일 지정*/
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
	request.setCharacterEncoding("utf-8"); // 전달 받는 값들의 인코딩 설정을 utf-8로 지정

	int number = Integer.parseInt(request.getParameter("number")); // 전달받은 값 저장
	
	dao.delete(number); // 값 삭제
%>	
	<br><br><br><br> <!-- 4줄 띄기 -->
	<form method='post'> <!-- form 메소드 post 지정 -->
	<table>
		<tr>
			<td><h3>게시글이 삭제 되었습니다.</h3></td> <!-- text 문구 출력 -->
		</tr>
		<tr>
			<td align = 'center'>
			<!-- 버튼 클릭 시 gongji_list.jsp 이동 -->
			<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'gongji_list.jsp'
				style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form> <!-- form 태그 종료 -->
	
	</body>
</html>