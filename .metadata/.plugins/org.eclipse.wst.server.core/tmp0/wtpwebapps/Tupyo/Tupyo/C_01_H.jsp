<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->

<html>
	<head>
		<title>개표결과 C_01_H.jsp</title>
		<style>
    		table {
    			text-align: center; 
   				border: 1; 
   				solid black; 
   				width: 600px; 
   				border-collapse: collapse;
   				cellspacing="1"}
   			td{ }
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
			h2:hover {
			 box-shadow: 0 0 40px 40px #ffd700 inset;
			}
			.tr:hover {
				box-shadow: 0 0 40px 40px #f5f5f5 inset;
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
			.check{
				box-shadow: 0 0 40px 40px #ffd700 inset;
			}
    	</style>
	</head>
	<body>
<%
		//DB연동 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
		Statement stmt = conn.createStatement();
				 
		// 전체 후보 수 조회
        ResultSet huboCNT = stmt.executeQuery("select count(*) from HuboDB");
        String cnt = ""; // 변수 선언
        while(huboCNT.next()){
        	cnt = huboCNT.getString(1); // get1 번째 값을 변수에 저장
        }
    	 // 후보,득표수,득표율을 계산하여 보여주는 쿼리문 작성
        String TupyoTotalQuery = String.format("SELECT hubo AS 후보,count(hubo)-1 as 득표수,round((count(hubo)-1) / (SELECT COUNT(*)-%s FROM TupyoDB) * 100,2) AS 득표율 FROM TupyoDB GROUP BY hubo;",cnt);
        ResultSet rset = stmt.executeQuery(TupyoTotalQuery); // 쿼리문 실행
		        
%>
		<table>
    		<tr> <!-- 각 해당 셀 스타일 적용, 각각의 메뉴에 대한 링크 연결 -->
    			<td width = 25%><a align = center id="update" href="A_01_H.jsp" target="content"><h2>후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2>투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2 class="check">개표결과</h2></a></td>
    			<td></td>
    		</tr>
		</table>
		<table>
			<!-- 좌우2칸 합병, h1크기 text 작성 -->
			<tr><td colspan = 2 style="border-bottom: none;"><h1 align = left >후보별 득표 결과</h1></td></tr>
		</table>
		<!-- form 태그 -->
		<form method="post">
		<table border = 1>
<%		
		while(rset.next()){ 
%>			<!-- 테이블 스타일 지정 -->
			<tr class = "tr" style="border-bottom: 1px solid black;">
					<!-- 해당 text를 클릭 시 C_02_H.jsp로 이동하며 key값 전달 -->
                  <td style="width: 20%; border: 1px solid black;">
                     <p><a href='C_02_H.jsp?key=<%=rset.getString(1)%>'><%=rset.getString(1)%></p>
                  </td>
                  <td style="width: 80%;">
                  	 <!-- div 태그 적용  -->
                     <div style="display: flex; align-items: center;">
                     	<!-- p태그 넓이= 득표율% -->
                        <p style="background-color: gold; width: <%=rset.getFloat(3)%>%; height:25px; margin: 0;"></p>
                        <!-- 득표수, 득점률% -->
                        <span style="margin-left: 10px;"><%=rset.getInt(2)%>표(<%=rset.getFloat(3)%>%)</span>
                        </div>
                  </td>
               </tr>
<%		} %>
		</table>
		</form>
	</body>
</html>
	