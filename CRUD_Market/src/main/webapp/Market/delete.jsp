<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*" %>

<html>
	<head>
		<style>
			table{
				margin-left: auto;
	  			margin-right: auto;
			  	text-align: center; 
 				width: 85%;
 				border-collapse: collapse;
 				cellspacing:1;
 				table-layout: fixed;
   			}
			.table{
				margin-top :10px;
				margin-bottom :10px;
				margin-left: auto;
	  			margin-right: auto;
			  	text-align: center; 
 				width: 95%; 
 				border-collapse: collapse;
 				cellspacing:1;
 				table-layout: fixed;
   			}
   			h2{margin-top:20px;}
    		.fourth{
			  background: #ffdddd;
			  border-color: white;
			  color: black;
			  background-image: linear-gradient(45deg, #eecccc 50%, transparent 50%);
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
	MarketDao dao = new MarketDaoImpl();
	request.setCharacterEncoding("utf-8"); // 전달 받는 값들의 인코딩 설정을 utf-8로 지정
	
	String root = "/var/lib/tomcat9/webapps/CRUD_Market/Market/img"; // 이미지가 저장되는 파일 경로
	String name = null;	// 변수 선언
	String picture = null;	// 변수 선언
	
	String deleteKey = request.getParameter("key");  // 전달받은 값 저장
	String query = String.format("select * from market where id = '%s'",deleteKey); // 삭제할 id키rkqt 조회
	ResultSet rset = dao.stmt().executeQuery(query);

	while(rset.next()){
		name = rset.getString(2);
		picture = rset.getString(7);
	}
	
	String filePath = root + "/" + picture;
	File file = new File(filePath);
	if (file.exists()) {
	    file.delete();
	}
	
	dao.delete(deleteKey);
%>	
	<table border='2'>
		<tr>
			<td height='50px'><h2>(주)과일상회 재고 현황 - 상품삭제</h2></td>
		</tr>
		<tr>
			<td>
			<br><br>
			
			<form method='post'>
			<table  class='table'>
				<tr>
					<td><h3>상품번호: <%=deleteKey%>, 상품명: <%=name%> 삭제 되었습니다.</h3></td>
				</tr>
				<tr>
					<td align = 'center'>
					<input class='fourth' type='submit' value='재고 현황' formaction = 'create_list.jsp'
						style="width: 130px; height: 30px; padding: 0px;font-weight: bold;"> </td>
				</tr>
			</table>
			</form>
			</td>
		</tr>
	</table>
	
	</body>
</html>