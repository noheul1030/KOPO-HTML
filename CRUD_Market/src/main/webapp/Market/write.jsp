<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*" %>
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*,com.oreilly.servlet.MultipartRequest, 
				com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

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
	// 전달 받는 값들의 인코딩 설정을 utf-8로 지정
	request.setCharacterEncoding("utf-8");
	
	// 이미지파일 get
	int sizeLimit=100*300*300;
	String path= "/Market/img"; // 상대 경로 값 지정
	String directory= request.getServletContext().getRealPath(path);
	
	// 이미지 추출
	String root = "/var/lib/tomcat9/webapps/CRUD_Market/Market/img";
	// 	String newPath = root;
	String newPath = directory + path; // 디렉토리의 경로와 path 경로 합병
	//
	MultipartRequest multi = new MultipartRequest(request, root, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	String filename = null;

	Integer id = null; 				// 상품 ID
	String name = null; 			// 상품명
	Integer inventoryCNT = null; 	// 상품 재고 수
	String inventoryCheck = null; 	// 재고 등록일
	String inventoryUpdate = null;  // 상품 등록일
	String text = null;				// 상품 설명
	String picture = null;			// 상품 사진
	Integer key = null;

	if(multi.getParameter("key")!=null){ // key 값이 null이 아닐 때
		key = Integer.parseInt(multi.getParameter("key")); // 변수 값 저장
		inventoryCNT = Integer.parseInt(multi.getParameter("inventoryCNT")); // 변수 값 저장
		name = multi.getParameter("name"); // 변수 값 저장
		
		dao.update(key, inventoryCNT); // key와 inventoryCNT를 파라미터로 전달해 update
%>	<!-- 테이블 스타일 지정 -->
	<table border='2'>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td height='50px' align='center'><h2>(주)과일상회 재고 현황 - 재고수정</h2></td>
		</tr>
		<tr>
			<td>
			<br><br>
			<!-- form 메서드 post 지정 -->
			<form method='post'>
			<table  class='table'> <!-- 테이블 스타일 지정 -->
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td><h3>상품번호: <%=key%>, 상품명: <%=name%> 재고가 수정 되었습니다.</h3></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td align = 'center'>
					<!-- 버튼 클릭 시 create_list.jsp 이동 -->
					<input class='fourth' type='submit' value='재고 현황' formaction = 'create_list.jsp'
						style="width: 100px; height: 30px; padding: 0px;font-weight: bold;"> </td>
				</tr>
			</table>
			</form>
			</td>
		</tr>
	</table>
<%
	}

	
	if(multi.getFilesystemName("file") != null){
		filename = multi.getFilesystemName("file");
	}
	if(multi.getParameter("id") != null){
		
		id = Integer.parseInt(multi.getParameter("id")); 						// 상품 ID
		name = multi.getParameter("name"); 										// 상품명
		inventoryCNT = Integer.parseInt(multi.getParameter("inventoryCNT")); 	// 상품 재고 수
		inventoryCheck = dao.date(); 											// 재고 등록일
		inventoryUpdate = dao.date(); 											// 상품 등록일
		text = multi.getParameter("text");										// 상품 설명
		picture = multi.getParameter("picture");								// 상품 사진
		
		dao.insert(id,name,inventoryCNT,inventoryCheck,inventoryUpdate,text,filename);
%>	
	<table border='2'>
		<tr>
			<td height='50px' align='center'><h2>(주)과일상회 재고 현황 - 상품등록</h2></td>
		</tr>
		<tr>
			<td>	
			<br><br>
			
			<form method='post'>
			<table  class='table'>
				<tr>
					<td><h3>상품번호: <%=id%>, 상품명: <%=name%> 등록 되었습니다.</h3></td>
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
<%
	}
%>
	</body>
</html>