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

	Integer number = null; // 변수 선언 
	String title = null; // 변수 선언
	String date = null; // 변수 선언
	String content = null; // 변수 선언
	
	// number로 전달받은 값이 해당 조건과 같으면
	if(request.getParameter("number").equals("신규(insert)")){
		title = request.getParameter("title"); // 값 저장
		date = request.getParameter("date"); // 값 저장
		content = request.getParameter("content"); // 값 저장
	}else{ // number로 전달받은 값이 해당 조건과 같지 않으면
		title = request.getParameter("title"); // 값 저장
		date = request.getParameter("date"); // 값 저장
		content = request.getParameter("content"); // 값 저장
		number = Integer.parseInt(request.getParameter("number")); // 값 저장
	}
	
	int result = 0; // 변수 초기값 지정
	if(dao.count()!=0){ // 전체 행count의 값이 0이 아니면 true
	// number의 값이 존재하는지 여부 확인
		String query = String.format("SELECT CASE WHEN EXISTS (SELECT * FROM gongji WHERE number = %s) THEN 1 ELSE 0 END AS result;",request.getParameter("number"));
		ResultSet rset = dao.stmt().executeQuery(query);
		while (rset.next()){ // 결과 값을 한줄씩 출력, 값이 있으면 true
			result = rset.getInt(1);  // 가져온 값 저장
		}
	}
	
	if(result == 0){ // 변수의 값이 0과 같으면
		dao.newinsert(title, date, content); // insert 메서드 실행
%>	
		<br><br><br><br> <!-- 4줄 띄기 -->
		<form method='post'> <!-- form 메소드 post 지정 -->
		<table>
			<tr>
				<td><h3>게시글이 작성 되었습니다.</h3></td> <!-- text 문구 출력 -->
			</tr>
			<tr> <!-- 셀 스타일 지정,text 출력 -->
				<td align = 'center'>
				<!-- 버튼 클릭 시 gongji_list.jsp 이동 -->
				<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'gongji_list.jsp'
					style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
			</tr>
		</table>
		</form> <!-- form 태그 종료 -->
<%
	}else if(result == 1){ // 변수의 값이 1과 같으면
		dao.update(number, title, content); // update 메서드 실행
%>	
	<br><br><br><br> <!-- 4줄 띄기 -->
	<form method='post'> <!-- form 메소드 post 지정 -->
	<table>
		<tr>
			<td><h3>게시글이 수정 되었습니다.</h3></td> <!-- text 문구 출력 -->
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td align = 'center'>
			<!-- 버튼 클릭 시 gongji_list.jsp 이동 -->
			<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'gongji_list.jsp'
				style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form> <!-- form 태그 종료 -->
<%	
	}
%>
	</body>
</html>