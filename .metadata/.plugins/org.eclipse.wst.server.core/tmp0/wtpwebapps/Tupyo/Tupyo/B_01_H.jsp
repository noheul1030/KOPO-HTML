<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->
<html>
	<head>
		<title>투표 B_01_H.jsp</title>
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
    		h1,h2,h4 {margin-top: 15px; text-align: center;}
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
			select{
				width: 130px; height: 30px; padding: 0px;font-weight: bold;
			}
			select:hover {
			 background: #f5f5f5 50% ;
			}
			.check{
				box-shadow: 0 0 40px 40px #ffd700 inset;
			}
    	</style>
	</head>
	<body>
<%
	try{
		//DB연동 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
		Statement stmt = conn.createStatement();
		
		// HuboDB 테이블의 전체 값 조회
		ResultSet rset = stmt.executeQuery("select * from HuboDB;");
		
%>
		<table>
    		<tr> <!-- 각 해당 셀 스타일 적용, 각각의 메뉴에 대한 링크 연결 -->
    			<td width = 25%><a align = center id="update" href="A_01_H.jsp" target="content"><h2>후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2 class="check">투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2>개표결과</h2></a></td>
    			<td></td>
    		</tr>
		</table>
		<!-- form 태그 -->
		<form method="psot">		
		<table> 
			<!-- 좌우3칸 합병, h1크기 text 작성 -->
			<tr><td colspan ="3"style="border-bottom: none;"><h1 align = left >투표하기</h1></td>
				<td style="border-bottom: none;"></td>
				<!-- 투표조회 클릭 시 B_02_H.jsp로 이동 -->
				<td colspan="2" align = center width = 22% style="border-bottom: none;">
					<input class="fourth" type="submit" value="투표조회" style="width: 70px; height: 30px; padding: 0px;font-weight: bold;" formaction = 'B_02_H.jsp'></td></tr>
		</form>	
			<tr>
			<!-- form 태그 -->				
			<form method="post">
			<td width = 15%>후보자 : </td>
				<td><p align="left"><select name="choice">	<!-- select 태그 적용 -->

<%			// 리스트 선언
			List<String> list = new ArrayList<String>();
			String hubo = ""; // 변수 선언
			while (rset.next()) { // 반복문
				// get2번get1로 하나로 합친다
			    hubo = Integer.toString(rset.getInt(2)) + "번" + rset.getString(1);
			    list.add(hubo); // 리스트에 값 더하기
%>
					<option value="<%=hubo%>"><%=Integer.toString(rset.getInt(2)) + "번" + " "+rset.getString(1)%></option> <!-- 후보의 값을 하나씩 option으로 만든다. -->
<%				
			} %>
				</select></p></td>
				<td width = 15%>연령대 : </td>
				<td><p align="left"><select name="age"> <!-- select 태그 적용 -->
<%			for(int i = 10; i < 100; i+=10){ %> <!-- 10씩 증가하며 도는 반복문 -->
				<option value="<%=i%>대"> <%=i%>대 </option> <!-- 나이의 값을 하나씩 option으로 만든다. -->
<%			}
		}catch(Exception e){
		}
%>
				</select></p></td>
				<!-- 투표하기 클릭 시 B_02_H.jsp로 이동 -->
				<td>
					<input class="fourth" type="submit" value="투표하기" style="width: 70px; height: 30px; padding: 0px;font-weight: bold;" formaction = 'B_02_H.jsp'>
				</td>
			</tr>				
		</table>
		</form>
	</body>
</html>
