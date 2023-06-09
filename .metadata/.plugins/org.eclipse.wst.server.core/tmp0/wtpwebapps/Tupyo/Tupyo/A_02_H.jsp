<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->
<html>
	<head>
		<title>후보등록 A_02_H.jsp</title>
		<style>
    		table {
    			text-align: center; 
   				border: 0; 
   				solid black; 
   				width: 600px; 
   				border-collapse: collapse;
   				cellspacing="1"}
    		th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
			}
			th:first-child, td:first-child {
			  border-left: none;
			}
    		a {text-decoration-line: none;  color: #696969;}
			h2:hover {
			 box-shadow: 0 0 40px 40px #ffd700 inset;
			}
			.tr:hover {
				box-shadow: 0 0 40px 40px #f5f5f5 inset;
			}
    		h2,h4 {margin-top: 15px; text-align: center;}
    		.fourth {
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
			.check{
				box-shadow: 0 0 40px 40px #ffd700 inset;
			}
    	</style>
	</head>
	<script>
	  // 삭제할 값을 전달받아 해당 파일로 보내는 function
	  function btnDeleteClick(deleteID) {
        document.form1.deleteID.value=deleteID;
        document.form1.action="A_02_H.jsp";
        document.form1.submit();
	  } 
	</script>
	<body>
<%
		//DB연동 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
		Statement stmt = conn.createStatement();
		
		// 전달 받은 deleteID값을 저장
		String id = request.getParameter("deleteID");
		String name = ""; // 변수 선언
		
		// id의 후보 값을 조회하는 쿼리문 작성
		String nameSetQuery = String.format("select * from HuboDB where id = %s",id);
		ResultSet nameSet = stmt.executeQuery(nameSetQuery); // 쿼리 실행 
		while(nameSet.next()){ // 해당 조건이 true일 때 
			name = nameSet.getString(1); // 1번째 값 저장
		}
		
		// HuboDB 테이블에서 해당 id의 값을 삭제하는 쿼리문 작성
		String HuboDBdeleteQuery = String.format("delete from HuboDB where id = %s",id);
		stmt.execute(HuboDBdeleteQuery); // 쿼리 실행
		
		String key = id+"번"+name; // id번 이름
		// TupyoDB 테이블에서 해당 id의 값을 삭제하는 쿼리문 작성
		String TupyoDBdeleteQuery = "delete from TupyoDB where hubo =?";
		
		PreparedStatement pstmt = conn.prepareStatement(TupyoDBdeleteQuery);
		pstmt.setString(1, key); // key값을 전달하는 쿼리문 셋팅
		pstmt.executeUpdate(); // 쿼리문 실행
%>
		<!-- form 태그 -->
		<form name="form1" method = 'post'>
		<!-- input hidden 타입 지정 -->
		<input type='hidden' name='deleteID'> 
		<table>
    		<tr> <!-- 각 해당 셀 스타일 적용, 각각의 메뉴에 대한 링크 연결 -->
    			<td width = 25%><a align = center id="update" href="A_01_H.jsp" target="content"><h2 class="check">후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2>투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2>개표결과</h2></a></td>
    			<td></td>
    		</tr>
		</table>
		
		<table>
			<tr> <!-- 삭제한 후보의 정보를 보여준다 -->
				<td colspan="4"><h4>후보삭제 결과 : <%=id+"번"+" "+name %> 후보자 삭제 완료</h4></td>
				<!-- 뒤로 가기 클릭 시 A_01_H.jsp으로 이동 -->	
				<td align = right width = 22%>
				<input class="fourth" type="submit" value="뒤로 가기" style="width: 70px; height: 30px; padding: 0px;font-weight: bold;" formaction = 'A_01_H.jsp'></td>
			</tr>
		</table>

		
		</form>
	</body>
</html>
		