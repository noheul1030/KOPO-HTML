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
	request.setCharacterEncoding("utf-8"); // 전달 받는 값들의 인코딩 설정을 utf-8로 지정

	int id = Integer.parseInt(request.getParameter("id")); // 전달받은 값 저장
	int rootid = Integer.parseInt(request.getParameter("rootid")); // 전달받은 값 저장
	int relevel = Integer.parseInt(request.getParameter("relevel")); // 전달받은 값 저장
	int recnt = Integer.parseInt(request.getParameter("recnt")); // 전달받은 값 저장
	
	dao.delete(id); // id값으로 삭제
	ResultSet rset = stmt.executeQuery("SELECT MAX(recnt) FROM freeboard WHERE rootid = " + rootid + ";");
	
	int max_recnt = 0;
    int comment_relevel = 0;
	while (rset.next()) {
         max_recnt = rset.getInt(1);
     }
	ResultSet rset2 = null;
    for (int i = recnt + 1; i < max_recnt; i++) {
        rset2 = stmt.executeQuery("SELECT relevel FROM freeboard WHERE rootid = " + rootid + " AND recnt = " + i + ";");
        while (rset2.next()) {
            comment_relevel = rset2.getInt(1);
        }
        if (comment_relevel == relevel) {
            break;
        }
        stmt.executeUpdate("DELETE FROM freeboard WHERE rootid = " + rootid + " AND recnt = " + i + ";"); //하위 댓글 삭제 
    }
    if (rset2 != null) {
        rset2.close();
    }
	
	conn.close();
	stmt.close();
%>	
	<br><br><br><br> <!-- 4줄 띄기 -->
	<form method='post'> <!-- form 메소드 post 지정 -->
	<table>
		<tr>
			<td><h3>게시글이 삭제 되었습니다.</h3></td> <!-- text 문구 출력 -->
		</tr>
		<tr>
			<td align = 'center'>
			<!-- 버튼 클릭 시 freeboard_list.jsp 이동 -->
			<input class='fourth' type='submit' value='게시글 확인하기' formaction = 'freeboard_list.jsp'
				style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form> <!-- form 태그 종료 -->	
	
	</body>
</html>