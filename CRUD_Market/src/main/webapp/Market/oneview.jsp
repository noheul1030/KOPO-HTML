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
			span{
   			 margin-left:5px;
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
	String key = null;
	
	ResultSet oneID = null;
	
	if(request.getParameter("key")!=null){
		key=request.getParameter("key");
		oneID = dao.selectOne(key);
	}
	
%>
	<table border='2'>
		<tr>
			<td height='50px'><h2>(주)과일상회 재고 현황 - 상품상세</h2></td>
		</tr>
		<tr style="border-bottom:none;">
			<td>
			
			<form method='post'>
			<table border='1' class='table' style="text-align:left; table-layout: fixed;">
<%	while(oneID.next()){ %>
				<tr>
					<td width='20%'><span>상품 번호</span></td>
					<td><input type='text' name='key' value='<%=oneID.getInt(1)%>'readonly style="all: unset; margin-left:5px;"></td>
				</tr>
				<tr>
					<td width='20%'><span>상품명</span></td>
					<td><span><%=oneID.getString(2)%></span></td>
				</tr>
				<tr>
					<td width='20%'><span>재고 현황</span></td>		
					<td><span><%=oneID.getInt(3)%></span></td>
				</tr>
				<tr>
					<td width='20%'><span>상품등록일</span></td>		
					<td><span><%=oneID.getString(4)%></span></td>
				</tr>
				<tr>
					<td width='20%'><span>재고등록일</span></td>		
					<td><span><%=oneID.getString(5)%></span></td>
				</tr>
				<tr>
					<td width='20%'><span>상품설명</span></td>		
					<td><span><%=oneID.getString(6)%></span></td>
				</tr>
				<tr>
					<td width='20%'><span>상품사진</span></td>		
					<td>
						<img width="250" src ='img/<%=oneID.getString(7)%>' style="margin:10px;">
					</td>
				</tr>
				</table>
				</td>
			</tr>
<%	
	}
%>
		<tr style="border-top:none;">
			<td>	
			<table class='table'>
				<tr>
					<td width='15%' align = 'right'>
						<input class='fourth' type='submit' value='상품 삭제' formaction = 'delete.jsp'
							style="width: 80px; height: 30px; padding: 0px;font-weight: bold;">
						<input class='fourth' type='submit' value='재고 수정' formaction = 'update.jsp'
							style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"> 
					</td>
				</tr>
			</table>
			</form>	
			</td>
		</tr>
	</table>			
	</body>
</html>
