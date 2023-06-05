<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->

<html>
	<head>
		<title>개표결과 C_02_H.jsp</title>
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
		//key값 저장
		String key = request.getParameter("key");
		String part1 = ""; // 변수 선언
		String part2 = ""; // 변수 선언
		
		// '번'을 기준으로 index를 자르는 과정
		int index = key.indexOf("번");
		if (index != -1) {
		    part1 = key.substring(0, index+1);  // 0~ '번'까지 
		    part2 = key.substring(index+1);     // '번' 다음부터 끝까지
		}

		//DB연동 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
		Statement stmt = conn.createStatement();
				 
		// 전체 후보 수 조회
        ResultSet huboCNT = stmt.executeQuery("select count(*) from HuboDB");
        String cnt = "";
        while(huboCNT.next()){
        	cnt = huboCNT.getString(1);
        }
		// key값 으로 찾는 쿼리문
        String query = String.format("SELECT age AS 연령대,COUNT(age) AS 득표수,round((COUNT(age) / (SELECT COUNT(*) FROM TupyoDB WHERE hubo = '%s' AND age IS NOT NULL)) * 100,2) AS 득표율"
        		+ " FROM TupyoDB"
        		+ " WHERE hubo = ? AND age IS NOT NULL"
        		+ " GROUP BY age"
        		+ " ORDER BY age asc;",key,cnt,key);		
        // 쿼리문 실행
        PreparedStatement pstmt = conn.prepareStatement(query);
      	pstmt.setString(1, key);
      	// 쿼리문 실행 값 저장
        ResultSet rset = pstmt.executeQuery();
		        
%>
		<table>
    		<tr> <!-- 각 해당 셀 스타일 적용, 각각의 메뉴에 대한 링크 연결 -->
    			<td width = 25%><a align = center id="update" href="A_01_H.jsp" target="content"><h2>후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2>투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2 class="check">개표결과</h2></a></td>
    			<td width = 25%><a align = center id="result" href="D_01_H.jsp" target="content"><h6>초기화</h6></a></td>
    		</tr>
		</table>
		<table>
			 <!-- 좌우3칸 합병, h1크기 text 작성 -->
			<td colspan = "3" ><h1>[<%=part1+" "+part2%>] 후보 득표성향 분석</h1></td>
		</table>
		<!-- form 태그 -->
		<form method="post">
		<table border = 1>
<%		// 리스트 선언
		List<String> list = new ArrayList<String>();
		
		while(rset.next()){ // get1+get2+get3을 콤마 기준으로 합쳐서 리스트에 저장
			list.add(rset.getString(1)+","+rset.getString(2)+","+rset.getString(3));
		}
		
		int num = 10; // 변수 초기값 설정(나이)
		String age = "대"; // 변수 초기값 설정('대')
		
		while (num < 100) { // 10~90까지 도는 반복문
		    boolean found = false; // 변수 초기값 false
 
		    for (int i = 0; i < list.size(); i++) { // 리스트의 사이즈 만큼 도는 반복문
		        String[] listcut = list.get(i).split(","); // 콤마 기준으로 배열 컷팅
		        if ((num + age).equals(listcut[0])) { // 10대/20대/30대 등과 배열0번째 와 일치하면
		        	
		        	// 테이블 스타일 지정	, 연령대별,퍼센트 그래프,득표수,득표율 표현	           
		            out.println("<tr class = \"tr\" style=\"border-bottom: 1px solid black;\">");
		            out.println("   <td style=\"width: 20%; border: 1px solid black;\">");
		            out.println("      <p>" + listcut[0] + "</p>");
		            out.println("   </td>");
		            out.println("   <td style=\"width: 80%;\">");
		            out.println("      <div style=\"display: flex; align-items: center;\">");
		            out.println("         <p style=\"background-color: gold; width: " + listcut[2] + "%; height: 25px; margin: 0;\"></p>");
		            out.println("         <span style=\"margin-left: 10px;\">" + listcut[1] + "표(" + listcut[2] + "%)</span>");
		            out.println("      </div>");
		            out.println("   </td>");
		            out.println("</tr>");
		            // 변수값 true 저장
		            found = true;
		        }
		    }
		 // 테이블 스타일 지정	, 연령대별,퍼센트 그래프,득표수,득표율 표현	
		    if (!found) { // 변수값과 다를 때
		        out.println("<tr style=\"border-bottom: 1px solid black;\">");
		        out.println("   <td style=\"width: 20%; border: 1px solid black;\">");
		        out.println("      <p>" + (num+age) + "</p>");
		        out.println("   </td>");
		        out.println("   <td style=\"width: 80%;\">");
	            out.println("      <div style=\"display: flex; align-items: center;\">");
	            out.println("         <p style=\"background-color: gold; width: 0%; height: 25px; margin: 0;\"></p>");
	            out.println("         <span style=\"margin-left: 10px;\">0표(0%)</span>");
	            out.println("      </div>");
	            out.println("   </td>");
	            out.println("</tr>");
		    }
		    num += 10;
		}
%>			
		</table>
		</form>
	</body>
</html>
	