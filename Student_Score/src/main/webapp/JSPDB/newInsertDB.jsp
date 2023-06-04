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
		    width : 75%
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
		</style>
    </head>
    <body>
 <%    
 	try{
		//DB연동 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
        //Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        Statement stmt = conn.createStatement();
        
        int maxID = 0; // 변수 초기값 지정
        // 해당 칼럼의 최소값을 찾는 쿼리문 실행 결과값 저장
        ResultSet settotal = stmt.executeQuery("select min(studentid) as minNum from jspDB where (studentid+1) not in (select studentid from jspDB);");
        while (settotal.next()) { // 조건이 true일 때
            maxID = settotal.getInt(1)+1; // 비어있는 학번의 최소값
        }
        
	    request.setCharacterEncoding("utf-8"); // 인코딩 설정
		String name = request.getParameter("name");		// 이름 값을 전달 받아서 저장
		String kor = request.getParameter("korean");	// 국어 값을 전달 받아서 저장
		String eng = request.getParameter("english");	// 영어 값을 전달 받아서 저장
		String mat = request.getParameter("mathmatic"); // 수학 값을 전달 받아서 저장
		// 쿼리문 실행 이름,학번,국어,영어,수학의 값을 입력한다.
		stmt.execute("insert into jspDB (name, studentid, kor,eng,mat) values ('"+
		name + "',"+
		Integer.toString (maxID) +","+
		request.getParameter("korean")+","+
		request.getParameter("english")+","+
		request.getParameter("mathmatic")+");");
					
		stmt.close(); // 객체 종료
		conn.close(); // 객체 종료
%>	<h1 align = center>성적 추가 입력 완료</h1> <!-- head Font 사이즈 h1 -->
	<form method = 'post' action = 'inputForm1.html'> <!-- form 작동시 inputForm1.html로 링크 이동 -->
		<table cellspacing="1" width="400" border="0" align="center" style="border-collapse: collapse;"> <!-- 테이블 설정 -->
			<tr>
				<td width = 300></td> <!-- 가로 넓이 300 -->
				<td align="right"> <!-- 우측 정렬 -->
				<!-- css 클래스 적용, 버튼 누를시 Form action 링크작동 -->
  				<input class="fourth" type="submit" value="뒤로 가기" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;"></td>
			</tr>
	</form>	
		</table>
		<table cellspacing="1" width="400" align="center" > <!-- 테이블 설정 -->
			<tr> <!-- 추가된 이름의 값 보여주기 -->
				<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p align="center"><strong>이름</strong></p></td>
				<td width = 300 style="border-left: 1px solid #444444;"><p align=center><input value='<%=name%>' style="width: 200px; height: 40px; padding: 0px;"></p></td>
			</tr> <!-- 추가된 학번의 값 보여주기 -->
				<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p align=center><strong>학번</strong></p></td>
				<td width = 300 style="border-left: 1px solid #444444;"><p align=center><input value='<%=maxID%>' style="width: 200px; height: 40px; padding: 0px;"></p></td>
			</tr> <!-- 추가된 국어의 값 보여주기 -->
				<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p align=center><strong>국어</strong></p></td>
				<td width = 300 style="border-left: 1px solid #444444;"><p align=center><input value='<%=kor%>' style="width: 200px; height: 40px; padding: 0px;"></p></td>
			</tr> <!-- 추가된 영어의 값 보여주기 -->
				<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p align=center><strong>영어</strong></td>
				<td width = 300 style="border-left: 1px solid #444444;"><p align=center><input value='<%=eng%>' style="width: 200px; height: 40px; padding: 0px;"></p></td>
			</tr> <!-- 추가된 수학의 값 보여주기 -->
				<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p align=center><strong>수학</strong></p></td>
				<td width = 300 style="border-left: 1px solid #444444;"><p align=center><input value='<%=mat%>' style="width: 200px; height: 40px; padding: 0px;"></p></td>
			</tr>
		</table>	
<%	}catch(Exception e) {
		System.out.println(e); // 오류 처리
	}
 
%>
		
    </body>
</html>