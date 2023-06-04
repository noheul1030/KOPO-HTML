<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*,java.io.*"%> <!--java import-->
<html>
    <head>
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
		
		
		  a {text-decoration-line: none; color: #696969;}
		  a:hover {
			  background-color: gold;
			  border-color: white;
			  color: black;
			  font-size : 15px;
			  background-image: linear-gradient(45deg, white 50%, transparent 50%);
			  background-position: 100%;
		  	  background-size: 400%;
			  transition: background 300ms ease-in-out;
		}
		.custom-size {
        	font-size: 15px;
        	background-color: gold;
        } 
		</style>
    </head>
    <body>
<%      try{
		// key값 저장
	    String key = request.getParameter("key");
	
		//DB연동
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
        //Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        // key값 으로 찾는 쿼리문
        String query = "select * from (select *, kor+eng+mat as sum, (kor+eng+mat)/3 as ave, row_number() over (order by kor+eng+mat desc) as ranking from jspDB order by studentid asc) as a where name=?";		
        
        PreparedStatement pstmt = conn.prepareStatement(query);
      	pstmt.setString(1, key); // key값 set
    	// 쿼리 결과 값 저장
        ResultSet rset1 = pstmt.executeQuery(); 
%>
        <h1 align = center>[<%=key%>] 조회</h1><!--해당 key값 head text 크기 1-->
        <!--테이블 형태 지정-->
        <table cellspacing="1" width=600 border="1" align = center>
            <tr>
                <td bgcolor = gold width="50"><p align=center><strong>이름</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>학번</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>국어</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>영어</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>수학</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>합계</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>평균</strong></p></td> <!--셀 형태 지정-->
                <td bgcolor = gold width="50"><p align=center><strong>Ranking</strong></p></td> <!--셀 형태 지정-->
            </tr>
<%
			//반복문 
            while (rset1.next()){ // rset의 next값이 true일 때
           	
                out.println("<tr>");
             	// 셀 형태 지정
                out.println("<td width=50><p align=center style='color: #696969;'>"+rset1.getString(1)+"</p></td>");
             	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset1.getInt(2))+"</p></td>");
             	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset1.getInt(3))+"</p></td>");
             	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset1.getInt(4))+"</p></td>");
             	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset1.getInt(5))+"</p></td>");
             	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset1.getInt(6))+"</p></td>");
             	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset1.getInt(7))+"</p></td>");
             	// 셀 형태 지정, 해당 컬럼 값 string -> int 형 변환 
                out.println("<td width=50><p align=center>"+Integer.toString(rset1.getInt(8))+"</p></td>");
                out.println("<tr>");
           	
            }
            rset1.close(); // resultSet 종료
            conn.close(); // connection 종료
		}catch(Exception e){
			out.println("조회 오류입니다.\n"); // 오류 프린트
			out.println(e);
		}
%>
        </table> 
    </body>
</html>