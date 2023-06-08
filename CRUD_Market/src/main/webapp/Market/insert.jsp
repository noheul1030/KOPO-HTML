<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*" %>

<html>
	<head>
		<style>
			input{
			 width : 70%;
			 height : 40px;
			 line-align : left;
			 margin-top : 4px;
			 margin-bottom : 4px;
			 margin-left : 4px;
			 margin-right : 4px;
			}
			table{
			  	text-align: center; 
 				width: 80%; 
 				border-collapse: collapse;
 				border : 1;
 				cellspacing:1;
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
%>	
	<form method='post'>
	<table border='1' style="text-align:left;">
		<tr>
			<td colspan='2' align='center'><h2>(주)트와이스 재고 현황 - 상품 상세</h2></td>
		</tr>
		<tr>
			<td width='20%'>상품 번호</td>
			<td><input pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" type='text' name='id' value='<%=dao.middleID()%>' title="숫자만 입력하세요." required></td>
		</tr>
		<tr>
			<td width='20%'>상품명</td>
			<td><input pattern="^[가-힣]{1,10}$" type='text' name='name' value='' title="한글만 입력하세요." required></td>
		</tr>
		<tr>
			<td width='20%'>재고 현황</td>		
			<td><input pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" type='text' name='inventoryCNT' value='' title="숫자만 입력하세요." required></td>
		</tr>
		<tr>
			<td width='20%'>상품등록일</td>		
			<td><input style="background-color: #f5f5f5;" type='text' name='inventoryCheck' value='<%=dao.date()%>' readonly></td>
		</tr>
		<tr>
			<td width='20%'>재고등록일</td>		
			<td><input style="background-color: #f5f5f5;" type='text' name='inventoryUpdate' value='<%=dao.date()%>' readonly></td>
		</tr>
		<tr>
			<td width='20%'>상품설명</td>		
			<td><input pattern="^{1,50}$" type='text' name='text' value='' title="상품설명을 입력하세요." required></td>
		</tr>
		<tr>
			<td width='20%' rowspan='2'>상품사진</td>		
			<td>
				<input type='text' name='picture' value=''>
			</td>
		</tr>
		<tr>
			<td>
				<input type='text' name='picture' value=''>	
				<input class='fourth' type='submit' value='Upload' formaction = 'upload.jsp'
				style="width: 60px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
		
	</table>
	<table>
		<tr>
			<td width='15%' align = 'right'>
			<input class='fourth' type='submit' value='완료' formaction = 'write.jsp'
				style="width: 60px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form>
	</body>
</html>