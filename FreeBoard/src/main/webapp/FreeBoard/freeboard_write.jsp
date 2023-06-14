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
 				cellspacing:1;
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
	//전달 받는 값들의 인코딩 설정을 utf-8로 지정
	request.setCharacterEncoding("utf-8");

	Integer id = null; // 변수 선언 
	String title = null; // 변수 선언 
	String date = null; // 변수 선언 
	String content = null; // 변수 선언 
	Integer rootid = null; // 변수 선언 
	Integer relevel = null; // 변수 선언 
	Integer recnt = null; // 변수 선언 
	
	// id 전달받은 값이 해당 조건과 같으면
	if(request.getParameter("id").equals("신규(insert)")){ // 값 저장
		title = request.getParameter("title"); // 값 저장
		date = request.getParameter("date"); // 값 저장
		content = request.getParameter("content"); // 값 저장
	}else{  // id 전달받은 값이 해당 조건과 같지 않으면
		id = Integer.parseInt(request.getParameter("id")); // 값 저장
		title = request.getParameter("title"); // 값 저장
		date = request.getParameter("date"); // 값 저장
		content = request.getParameter("content"); // 값 저장
		
		// rootid의 값이 null이 아니면 
		if(request.getParameter("rootid") != null){
		rootid = Integer.parseInt(request.getParameter("rootid")); // 값 저장
		relevel = Integer.parseInt(request.getParameter("relevel")); // 값 저장
		recnt = Integer.parseInt(request.getParameter("recnt")); // 값 저장
		}
	}
	 
	int result = 0; // 변수 초기값 지정
	if(dao.count()!=0){ // 전체 행count의 값이 0이 아니면 true
	// id 값이 존재하는지 여부 확인
		String query = String.format("SELECT CASE WHEN EXISTS (SELECT * FROM freeboard WHERE id = '%s') THEN 1 ELSE 0 END AS result;",request.getParameter("id"));
		ResultSet rset = stmt.executeQuery(query); // 쿼리 결과값 저장
		while (rset.next()){ // 결과 값을 한줄씩 출력, 값이 있으면 true
			result = rset.getInt(1);  // 가져온 값 저장
		}
	}
	
	if(result == 0){ // 변수의 값이 0과 같으면
		if(relevel == null){ // relevel이 null이면 true조건
		dao.newinsert(title, date, content);
		}else if(relevel > 0){ // 0이 아니면
			// recnt의 값보다 큰 전체 recnt의 값을 +1해준다.
			String recntSet = String.format("update freeboard set recnt = recnt+1 where recnt > %d",recnt-1);
			stmt.execute(recntSet); // 뭐리 실행
			// 댓글 작성 insert
			dao.reinsert(title, date, content, rootid, relevel, recnt);
		}
%>	
		<br><br><br><br> <!-- 4줄 띄기 -->
		<form method='post'> <!-- form 메소드 post 지정 -->
		<table>
			<tr>
				<td><h3>게시글이 작성 되었습니다.</h3></td> <!-- text 문구 출력 -->
			</tr>
			<tr> <!-- 셀 스타일 지정,text 출력 -->
				<td align = 'center'>
				<!-- 버튼 클릭 시 freeboard_list.jsp 이동 -->
				<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'freeboard_list.jsp'
					style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
			</tr>
		</table>
		</form>
<%
	  }else{ // 변수의 값이 0이 아니면
		dao.update(id, title, content); // update 메서드 실행
%>	
	<br><br><br><br> <!-- 4줄 띄기 -->
	<form method='post'> <!-- form 메소드 post 지정 -->
	<table>
		<tr>
			<td><h3>게시글이 수정 되었습니다.</h3></td> <!-- text 문구 출력 -->
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td align = 'center'>
			<!-- 버튼 클릭 시 freeboard_list.jsp 이동 -->
			<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'freeboard_list.jsp'
				style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form> <!-- form 태그 종료 -->
<%	
	}
	
	conn.close();
	stmt.close();
%>
	</body>
</html>