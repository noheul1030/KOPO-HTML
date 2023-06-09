<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->
<html>
	<head>
		<title>투표 B_02_H.jsp</title>
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
			a:hover {
				background-color: gold;
				border-color: white;
				color: #696969;
				font-size : 16px;
				font-weight: bold; /* 글자 굵게 설정 */
				background-image: linear-gradient(45deg, white 50%, transparent 50%);
				background-position: 100%;
				background-size: 400%;
				transition: background 300ms ease-in-out;
			}
			.tr:hover {
				box-shadow: 0 0 40px 40px #f5f5f5 inset;
			}
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
				width: 70px; height: 20px; padding: 0px;font-weight: bold;
			}
			.check{
				box-shadow: 0 0 40px 40px #ffd700 inset;
			}
    	</style>
	</head>
	<body>
<%		
		// DB연동 
        Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");s
        Statement stmt = conn.createStatement();
        
		// 전달 받는 값의 인코딩을 utf-8로 설정
        request.setCharacterEncoding("utf-8");
        // null값 체크
        int Nullcheck = request.getParameter("choice") != null ? 1 : 0;
        String hubo = ""; // 변수 선언
        String age = ""; // 변수 선언
        
        // 해당 변수의 값이 1과 같으면
        if(Nullcheck == 1){
	        hubo = request.getParameter("choice"); // 변수에 전달 값 저장
	        age = request.getParameter("age"); // 변수에 전달 값 저장
         	// 전달 받은 값을 추가해 넣는 쿼리 실행
        	stmt.execute("insert into TupyoDB (hubo, age) values ('" + hubo + "','" + age + "')");
        }
        
        // 전체 후보 수 조회
        ResultSet huboCNT = stmt.executeQuery("select count(*) from HuboDB");
        String cnt = ""; // 변수 선언
        while(huboCNT.next()){
        	cnt = huboCNT.getString(1); // get1 번째 값을 변수에 저장
        }
        // 후보,득표수,득표율을 계산하여 보여주는 쿼리문 작성
        String TupyoTotalQuery = String.format("SELECT hubo AS 후보,count(hubo)-1 as 득표수,(count(hubo)-1) / (SELECT COUNT(*)-%s FROM TupyoDB) * 100 AS 득표율 FROM TupyoDB GROUP BY hubo;",cnt);
        ResultSet rset = stmt.executeQuery(TupyoTotalQuery); // 쿼리문 실행
%>
		<!-- form 태그 -->
		<form method = 'post'>
		<table>
    		<tr> <!-- 각 해당 셀 스타일 적용, 각각의 메뉴에 대한 링크 연결 -->
    			<td width = 25%><a align = center id="update" href="A_01_H.jsp" target="content"><h2>후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2 class="check">투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2>개표결과</h2></a></td>
    			<td></td>
    		</tr>
		</form>
		</table>
		<!-- form 태그 -->
		<form method = 'post'>
		<table>
			<tr>
<%			if(Nullcheck == 1){ %>	<!-- 변수의 값이 1과 같을 때 -->
			<!-- 좌우5칸 합병, h4크기 text 작성 -->
			<td colspan="5"><h4>투표 결과 : 투표 완료 하였습니다.</h4></td>
<%			}
			if(cnt.equals("0")){ %> <!-- 변수의 값이 0과 같을 때 -->
			<!-- 좌우5칸 합병, h4크기 text 작성 -->
			<td colspan="5"><h4>후보등록을 먼저 해주세요.</h4></td>
<%			}%>
				<!-- 뒤로 가기 클릭 시 B_01_H.jsp으로 이동 -->
				<td align = right width = 22%>
				<input class="fourth" type="submit" value="뒤로 가기" style="width: 70px; height: 30px; padding: 0px;font-weight: bold;" formaction = 'B_01_H.jsp'></td>
			</tr>
		</form>
		</table>
		
		<table>
<%			// 후보, 득표수, 득표율 값을 넣어 보여주는 반복문
			while (rset.next()){
%>
	     		<tr class="tr">
	     			<td width =15%><strong>후보 :</strong></td>
	     			<!-- key값을 해당 링크로 전달한다. -->
	     			<td align = left width = 20% ><p align=center><a href = 'oneviewDB.jsp?key=<%=rset.getString(1)%>'><%=rset.getString(1)%></a></p></td>
					
					<td width= 15% ><strong>득표수 :</strong></td>
	     			
	     			<td align = left width = 20% ><%=rset.getString(2)%></td>
					
					<td width= 15% ><strong>득표율 :</strong></td>
	     			
	     			<td align = left width = 20% ><%=rset.getString(3)%></td>
					
				</tr>
<%	      			
			}	
%>
		</table>
	</body>
</html>