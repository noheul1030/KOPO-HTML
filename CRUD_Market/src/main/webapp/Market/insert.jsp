<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*" %>

<html>
	<head>
		<style>
			input{
			 width : 70%;
			 height : 30px;
			 line-align : left;
			 margin-top : 4px;
			 margin-bottom : 4px;
			 margin-left : 4px;
			 margin-right : 4px;
			}
			input:hover{
			 background-color: #f5f5f5; 
			}
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
   			span{
   			 margin-left:5px;
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
	<script>
		function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('previewImg').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('previewImg').src = "";
		  }
		}
		function trimSpace(input) {
			  return input.replace(/^\s+/, '');
			}
	</script>
	
	<body>
<%
	MarketDao dao = new MarketDaoImpl();
%>	
	<table border='2'>
		<tr>
			<td height='50px'><h2>(주)과일상회 재고 현황 - 상품등록</h2></td>
		</tr>
		<tr style="border-bottom:none;">
			<td>
	
		<form method="post" enctype="multipart/form-data">
			<table border='1' class='table' style="text-align:left; table-layout: fixed;">		
				<tr>
					<td bgcolor='#ffdddd' width='20%'><span>상품 번호</span></td>
					<td colspan='2'><input pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" type='text' name='id' value='<%=dao.middleID()%>' title="숫자만 입력하세요." readonly></td>
				</tr>
				<tr>
					<td bgcolor='#ffdddd' width='20%'><span>상품명</span></td>
					<td colspan='2'><input pattern="^[^<>]{1,10}$" type='text' name='name' value='' title="<> 금지,글자수 제한 10"  onblur="this.value = trimSpace(this.value);"required></td>
				</tr>
				<tr>
					<td bgcolor='#ffdddd' width='20%'><span>재고 현황</span></td>		
					<td colspan='2'><input pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" type='text' name='inventoryCNT' value='' title="숫자만 입력하세요." required></td>
				</tr>
				<tr>
					<td bgcolor='#ffdddd' width='20%'><span>상품등록일</span></td>		
					<td colspan='2'><span><%=dao.date()%></span></td>
				</tr>
				<tr>
					<td bgcolor='#ffdddd' width='20%'><span>재고등록일</span></td>		
					<td colspan='2'><span><%=dao.date()%></span></td>
				</tr>
				<tr>
					<td bgcolor='#ffdddd' width='20%'><span>상품설명</span></td>		
					<td colspan='2'><input pattern="^[^<>]{1,30}$" type='text' name='text' value='' title="상품설명을 입력하세요." required></td>
				</tr>
				<tr>
					<td bgcolor='#ffdddd' width='20%' rowspan='2'><span>상품사진</span></td>		
				</tr>
				<tr>
					<td style="border-right: none;">
						<img id="previewImg" width="250" style="margin:10px;"/>
					</td>
					<td style="width: 200px; border-left: none; text-align: right;">
						<input type='file' name='file' onchange="readURL(this);">	
					</td>
				</tr>
				
			</table>
			</td>
		</tr>
		<tr style="border-top:none;">
			<td>	
			<table class='table'>
				<tr>
					<td width='15%' align = 'right'>
					<input class='fourth' type='submit' value='등록 취소' formaction='create_list.jsp'
						style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"formnovalidate>
					<input class='fourth' type='submit' value='완료' formaction='write.jsp'
						style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"> </td>
				</tr>
			</table>
			</form>
			</td>
		</tr>
	</table>	
	</body>
</html>