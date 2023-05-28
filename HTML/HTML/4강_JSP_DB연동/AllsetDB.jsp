<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*"%> <!--java import-->
<html>
    <head>
    </head>
    <body>
        <h1>실습데이터 입력</h1> <!--head text 크기 1-->

<%      
		//DB연동 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
        Statement stmt = conn.createStatement();

        // 테이블 각 칼럼에 값 입력
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('나연', 209901,95,100,95);"); // 나연 값 입력
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('정연', 209902,95,95,95);"); // 정연 값 입력	
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('모모', 209903,100,100,100);"); // 모모 값 입력
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('사나', 209904,100,95,90);"); // 사나 값 입력
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('지효', 209905,80,100,70);"); // 지효 값 입력
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('미나', 209906,100,100,70);"); // 미나 값 입력
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('다현', 209907,70,70,70);"); // 다현 값 입력
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('채영', 209908,85,75,72);"); // 채영 값 입력
        stmt.execute("insert into jspDB (name, studentid, kor, eng, mat) values ('쯔위', 209909,78,79,82);"); // 쯔위 값 입력

        stmt.close(); // statement 종료
        conn.close(); // connection 종료
%>
    </body>
</html>