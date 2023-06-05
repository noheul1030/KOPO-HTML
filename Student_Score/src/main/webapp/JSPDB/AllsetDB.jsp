<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*,java.util.*"%> <!--java import-->

<html>
    <head>
    </head>
    <body>
        <h1>실습데이터 입력 OK</h1> <!--head text 크기 1-->

<%      try{
			//DB연동 
	        Class.forName("com.mysql.jdbc.Driver");
	      //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
	        Statement stmt = conn.createStatement();
	     
	       
   			int id = 209901; // 학번 초기값 
   			// 다량건수 입력할 리스트 
   			List<String> student = new ArrayList<String>(List.of("나연","정연","모모","사나","지효","미나","다현","채영","쯔위"));
   			
   			int namenum = 0; // 변수 초기값 지정
   			int i = 0;       // 변수 초기값 지정
   			while(i < 365) { // 365번 도는 반복문
   				if(namenum % 9 == 0) { // 9와 나눈 나머지가 0이면 true 
   					namenum = 0; // 변수 값 대입
   				}

   				String name = student.get(namenum); 	// 이름
   				int studentid = id+i;					// 학번 
   				int Kor = ((int) (Math.random()*101));	// 국어
   				int Eng = ((int) (Math.random()*101));	// 영어
   				int Mat = ((int) (Math.random()*101));	// 수학

   				// 쿼리문 작성
   				String insertQuery = String.format("insert into jspDB ("
   						+ "name,studentid,kor,eng,mat)"
   						+ "values ('%s',%d,%d,%d,%d);",
   						name,studentid,Kor,Eng,Mat);
   				// 쿼리문 실행
   				stmt.execute(insertQuery);
   				i++;	// 1 추가
   				namenum++;	// 1추가
   			}
	    			
   			stmt.close(); // Statement 
   			conn.close(); // Connection 객체 닫기
   		}catch(Exception e) {
   			out.println("insert 오류입니다.\n"); // 오류 프린트
   			out.println(e);
   		}
%>
    </body>
</html>