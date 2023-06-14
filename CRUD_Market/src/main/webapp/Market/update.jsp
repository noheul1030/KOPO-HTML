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
   			input:hover{
			 background-color: #f5f5f5; 
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
	//전달 받는 값들의 인코딩 설정을 utf-8로 지정
	request.setCharacterEncoding("utf-8");
	// key 값 저장
	String key = request.getParameter("key"); 
	// key값을 조건으로 해당 한건 조회
	ResultSet oneID = dao.selectOne(key);
	
%>
	<table border='2'> <!-- 테이블 테두리 2 지정 -->
		<tr>
			<td align='center'><h2>(주)과일상회 재고 현황 - 재고수정</h2></td>
		</tr>
		<tr style="border-bottom:none;"> <!-- 셀 스타일 지정,테두리 아래 선 없음 -->
			<td>
			<!-- form 메서드 post 지정 multiform -->
			<form method='post' enctype="multipart/form-data">
			<!-- 테이블 스타일 지정 -->
			<table border='1' class='table' style="text-align:left; table-layout: fixed;">		
<%	while(oneID.next()){ %>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품 번호</span></td>
					<td><input name='key' value='<%=oneID.getInt(1)%>'readonly style="all: unset; margin-left:5px;"></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품명</span></td>
					<td><input name='name' value='<%=oneID.getString(2)%>'readonly style="all: unset; margin-left:5px;"></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력, 숫자 제한 1~100000000 -->
					<td bgcolor='#ffdddd' width='20%'><span>재고 현황</span></td>		
					<td><input pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" type='text' name='inventoryCNT' value='<%=oneID.getInt(3)%>' title="숫자만 입력하세요." required></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품등록일</span></td>		
					<td><span><%=oneID.getString(4)%></span></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>재고등록일</span></td>		
					<td><span><%=oneID.getString(5)%></span></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품설명</span></td>		
					<td><span><%=oneID.getString(6)%></span></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품사진</span></td>		
					<td>
			<!-- 해당 값에 null을 포함하고 있으면 -->
<%			if(oneID.getString(7).contains("null")){ %>
						<span>사진이 없습니다.</span>
<%			}else{ %> <!-- 이미지 출력 -->
						<img width="250" src ='img/<%=oneID.getString(7)%>' style="margin:10px;">
<%			} %>
					</td>
				</tr>
				</table>
				</td>
			</tr>
<%	
	}
%>		 <!-- 셀 스타일 지정,text 출력 -->
		<tr style="border-top:none;">
			<td>	
			<table class='table'> <!-- table 서비스 지정 -->
				<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td width='15%' align = 'right'>
				<!-- 버튼 클릭 시 write.jsp 이동 -->
				<input class='fourth' type='submit' value='저장' formaction = 'write.jsp'
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"> 
				<!-- 버튼 클릭 시 create_list.jsp 이동 -->
				<input class='fourth' type='submit' value='취소' formaction = 'create_list.jsp'
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"formnovalidate> 
			</td>
				</tr>
			</table>
			</form>	
			</td>
		</tr>
	</table>			
	</body>
</html>
