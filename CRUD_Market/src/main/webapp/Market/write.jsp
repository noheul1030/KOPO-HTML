<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*" %>

<html>
	<head>
		<style>
			table{
			  	text-align: center; 
 				width: 80%; 
 				border-collapse: collapse;
 				border : 1;
 				cellspacing:1;
 				table-layout: fixed;
   			}
   			h2{margin-top:20px;}
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
	MarketDao dao = new MarketDaoImpl();
	request.setCharacterEncoding("utf-8");
	
	int id = Integer.parseInt(request.getParameter("id")); 						// 상품 ID
	String name = request.getParameter("name"); 								// 상품명
	int inventoryCNT = Integer.parseInt(request.getParameter("inventoryCNT")); 	// 상품 재고 수
	String inventoryCheck = request.getParameter("inventoryCheck"); 			// 재고 등록일
	String inventoryUpdate = request.getParameter("inventoryUpdate"); 			// 상품 등록일
	String text = request.getParameter("text");									// 상품 설명
	String picture = request.getParameter("picture");							// 상품 사진
	
	int result = 0;
	if(dao.count()!=0){
		String query = String.format("SELECT CASE WHEN EXISTS (SELECT * FROM market WHERE id = %s) THEN 1 ELSE 0 END AS result;",request.getParameter("id"));
		ResultSet rset = dao.stmt().executeQuery(query);
		while(rset.next()){
			result = rset.getInt(1);
		}
	}
	if(result == 0){
		dao.insert(id,name,inventoryCNT,inventoryCheck,inventoryUpdate,text,picture);
%>	
		<br><br><br><br>
		<form method='post'>
		<table>
			<tr>
				<td><h3>상품이 등록 되었습니다.</h3></td>
			</tr>
			<tr>
				<td align = 'center'>
				<input class='fourth' type='submit' value='재고 현황' formaction = 'create.jsp'
					style="width: 100px; height: 30px; padding: 0px;font-weight: bold;"> </td>
			</tr>
		</table>
		</form>
<%
	}
%>	
	</body>
</html>