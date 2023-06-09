<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*,java.util.*,java.net.*"%> <!--java import-->
<html>
    <head>
    	<meta charset="UTF-8"> <!--인코딩 설정 UTF-8-->
    	<style>
    		@font-face {
                    font-family: "D2CodingLigature";
                    src: url(./D2CodingLigature/D2CodingBold-Ver1.3.2-20180524-ligature.ttf) format("truetype");
                    font-weight: normal;
                }
                /*body 폰트 지정*/
                body{
                    font-family: 'D2CodingLigature',serif;
                }
		  table {
		    border-collapse: collapse;
		    width : 75%;
		  }
		  th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
		  }
		  th:first-child, td:first-child {
		    border-left: none;
		  }
		
		.fourth {
		  background: gold;
		  border-color: white;
		  color: black;
		  background-image: linear-gradient(45deg, yellow 50%, transparent 50%);
		  background-position: 100%;
		  background-size: 400%;
		  transition: background 300ms ease-in-out;
		}
		
		.fourth:hover {
		  background-position: 0;
		}
		input{
			width: 200px; 
			height: 40px; 
			padding: 0px;
		}
		p{
		text-align: center;}
		</style>
    </head>
    <body>
    <h1 align = center>성적 조회 후 정정 / 삭제</h1>
 <%    
 	try{
		//DB연동 
        Class.forName("com.mysql.jdbc.Driver");
      	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
     	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        Statement stmt = conn.createStatement();
        
        request.setCharacterEncoding("utf-8"); // 인코딩 설정
        String searchID = request.getParameter("searchID"); // 값을 전달 받아서 저장
        // 해당 학번이 존재하면 1 아니면 0을 반환하는 쿼리문 작성
        String query = String.format("SELECT CASE WHEN EXISTS(SELECT * FROM jspDB WHERE studentID = %s) THEN 1 ELSE 0 END", searchID);
        // 쿼리 실행 결과물 저장
        ResultSet resultSet = stmt.executeQuery(query);

        while (resultSet.next()) { // 해당 값이 true일 때
            if (resultSet.getInt(1) == 1) { // 첫번째 값이 1과 같으면
            	// 쿼리문 작성 학번을 기준으로 모든 데이터를 조회
                String existQuery = String.format("SELECT * FROM jspDB WHERE studentID = %s", searchID);
             	// 쿼리 실행 결과물 저장
            	ResultSet existResultSet = stmt.executeQuery(existQuery);

                String name = ""; // 이름 변수 선언
                int studentID = 0; // 학번 변수 선언
                int kor = 0; // 국어 변수 선언
                int eng = 0; // 영어 변수 선언
                int mat = 0; // 수학 변수 선언
                
                
                while (existResultSet.next()) { // 해당 값이 true일 떄
                    name = existResultSet.getString("name"); // 이름 전달 값 변수 저장
                    studentID = existResultSet.getInt("studentid"); // 학번 전달 값 변수 저장
                    kor = existResultSet.getInt("kor"); // 국어 전달 값 변수 저장
                    eng = existResultSet.getInt("eng"); // 영어 전달 값 변수 저장
                    mat = existResultSet.getInt("mat"); // 수학 전달 값 변수 저장
                    // 이후 작업 수행
                }   
%>			<form method = 'post' action = 'showREC.jsp'> <!-- form 작동시 showREC.jsp로 링크 이동 -->
				<table cellspacing="1" width="400"  align="center" > <!-- 테이블 설정 -->
					<tr>  <!-- 학번 입력받는 input, 숫자제한 있음 -->
						<td width = 25% style="table-layout: fixed;"><p style = "font-weight: bold;">조회할 학번</p></td>
						<td width = 300><p>
						<input type="text" pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" name='searchID' 
						value='' title="0~100000000까지의 정수를 입력하세요" required style="font-weight: bold;"></p></td>
		  				<!-- css 클래스 적용, 버튼 누를시 Form action 작동 -->
		  				<td><input class="fourth" type="submit" value="조회" style="width: 70px;font-weight: bold;"></td>
					</tr>
			</form>
				</table>
	       	<form method = 'post'> <!-- from 태그 지정 -->
       			<table cellspacing="1" width="400" align="center" ><!-- 테이블 설정 -->
					<tr> <!-- 이름에 대한 정보 셀, 셀 스타일 지정 -->
						<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>이름</strong></p></td>
						<td width = 300 style="border-left: 1px solid #444444;"><p><input type='text' name="name" value='<%=name%>' readonly></p></td>
					</tr> <!-- 학번에 대한 정보 셀, 셀 스타일 지정 -->
						<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>학번</strong></p></td>
						<td width = 300 style="border-left: 1px solid #444444;"><p><input type='text' name="searchID" value='<%=searchID%>' readonly></p></td>
					</tr> <!-- 국어에 대한 정보 셀, 셀 스타일 지정 -->
						<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>국어</strong></p></td>
						<td width = 300 style="border-left: 1px solid #444444;"><p><input type='text' pattern="^(?:100|[1-9][0-9]?|0)$" name="korean" 
						value='<%=kor%>' title="0에서 100사이 숫자를 입력하세요." required></p></td>
					</tr> <!-- 영어에 대한 정보 셀, 셀 스타일 지정 -->
						<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>영어</strong></td>
						<td width = 300 style="border-left: 1px solid #444444;"><p><input type='text' pattern="^(?:100|[1-9][0-9]?|0)$" name="english" 
						value='<%=eng%>' title="0에서 100사이 숫자를 입력하세요." required></p></td>
					</tr> <!-- 수학에 대한 정보 셀, 셀 스타일 지정 -->
						<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>수학</strong></p></td>
						<td width = 300 style="border-left: 1px solid #444444;"><p><input type='text' pattern="^(?:100|[1-9][0-9]?|0)$" name="mathmatic" 
						value='<%=mat%>' title="0에서 100사이 숫자를 입력하세요." required></p></td>
					</tr>
				</table>
       			
       			<table cellspacing="1" width="600" border="0" align="center" style="border-collapse: collapse;"> <!-- 테이블 설정 -->
       				<tr> <!-- input 받는 수정/삭제 에 대한 css ,테이블 스타일, 각각의 링크 지정 -->
       					<td align="center">
       	  				<input class="fourth" type="submit" value="수정" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;" formaction = 'updateDB.jsp'></td>
       					<td align="center">
       	  				<input class="fourth" type="submit" value="삭제" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;" formaction = 'deleteDB.jsp'></td>
       				</tr>
       			</table>	
    			</form>
<%        	}else if(resultSet.getInt(1) == 0){ %> <!--  첫번째 값이 0과 같으면 -->
			<form method = 'post' action = 'showREC.jsp'> <!-- form 작동시 showREC.jsp로 링크 이동 -->
				<table cellspacing="1" width="600"  align="center" > <!-- 테이블 설정 -->
					<tr> <!-- 학번 입력받는 input, 숫자제한 있음 -->
						<td width = 25% style="table-layout: fixed;"><p style = "font-weight: bold;">조회할 학번</p></td>
						<td width = 300><p>
						<input type="text" pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" name='searchID' 
						value='' title="0~100000000까지의 정수를 입력하세요" required style="font-weight: bold;"></p></td>
						<!-- css 클래스 적용, 버튼 누를시 Form action 작동 -->
		  				<td><input class="fourth" type="submit" value="조회" style="width: 70px;font-weight: bold;"></td>
					</tr>
			</form>
				</table>
       			<table cellspacing="1" width="600" align="center" >  <!-- 테이블 설정 -->
       				<tr> <!-- 이름에 대한 정보 셀, 셀 스타일 지정 -->
       					<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>이름</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='해당학번 없음'></p></td>
       					<td></td>
       				</tr> <!-- 학번에 대한 정보 셀, 셀 스타일 지정 -->
       					<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>학번</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value=''></p></td>
       					<td></td>
       				</tr> <!-- 국어에 대한 정보 셀, 셀 스타일 지정 -->
       					<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>국어</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value=''></p></td>
       					<td></td>
       				</tr> <!-- 영어에 대한 정보 셀, 셀 스타일 지정 -->
       					<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>영어</strong></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value=''></p></td>
       					<td></td>
       				</tr> <!-- 수학에 대한 정보 셀, 셀 스타일 지정 -->
       					<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>수학</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value=''></p></td>
       					<td></td>
       				</tr>
       			</table>
       			
<%        	}
        }
        
		stmt.close(); // 객체 종료
		conn.close(); // 객체 종료 
	
	}catch(Exception e) {
		System.out.println(e); // 오류 프린트
		e.printStackTrace();
	}
 
%>
		
    </body>
</html>