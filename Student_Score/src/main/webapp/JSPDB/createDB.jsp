<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->
<html>
    <head>
    </head>
    <body>
        <h1>테이블만들기 OK</h1> <!--head text 크기 1-->

<%      
		// DB연동 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        Statement stmt = conn.createStatement();
		// 테이블 생성, 이름,학번,국어,영어,수학 점수 컬럼 생성
        stmt.execute("create table jspDB(" 
        + "name varchar(20)," // 타입 char
        + "studentid int not null primary key," // null값이 없는 타입 int 프라이머리 키 설정
        + "kor int," // 타입 int
        + "eng int," // 타입 int
        + "mat int) default charset = utf8;"); // 타입 int utf8로 작성 디폹으

        stmt.close(); // statement 종료
        conn.close(); // connection 종료
%>
    </body>
</html>