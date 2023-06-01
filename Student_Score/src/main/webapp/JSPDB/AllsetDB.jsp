<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*,java.util.*"%> <!--java import-->
<%@ page import="kr.ac.kopo.ctc.kopo11.domain.*" %>
<html>
    <head>
    </head>
    <body>
        <h1>실습데이터 입력 OK</h1> <!--head text 크기 1-->

<%      try{
			//DB연동 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
	        Statement stmt = conn.createStatement();
	        StudentItem item = new StudentItem();
	       
   			int id = 209901;
   			List<String> student = new ArrayList<String>(List.of("나연","정연","모모","사나","지효","미나","다현","채영","쯔위"));
   			
   			int namenum = 0;
   			int i = 0;
   			while(i < 356) {
   				if(namenum % 8 == 0) {
   					namenum = 0;
   				}

   				item.setName(student.get(namenum));
   				item.setStudentid(id+i);
   				item.setKor((int) (Math.random()*101));
   				item.setEng((int) (Math.random()*101));
   				item.setMat((int) (Math.random()*101));

   				String insertQuery = String.format("insert into jspDB ("
   						+ "name,studentid,kor,eng,mat)"
   						+ "values ('%s',%d,%d,%d,%d);",
   						item.getName(),item.getStudentid(),item.getKor(),item.getEng(),item.getMat());
   				
   				stmt.execute(insertQuery);
   				i++;
   				namenum++;
   			}
	    			
   			stmt.close(); 
   			conn.close(); 
   		}catch(Exception e) {
   			out.println("insert 오류입니다.\n");
   			out.println(e);
   		}
%>
    </body>
</html>