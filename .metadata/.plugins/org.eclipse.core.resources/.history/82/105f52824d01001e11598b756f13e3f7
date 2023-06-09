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
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
	        Statement stmt = conn.createStatement();
	     
	       
   			int id = 209901;
   			List<String> student = new ArrayList<String>(List.of("나연","정연","모모","사나","지효","미나","다현","채영","쯔위"));
   			
   			int namenum = 0;
   			int i = 0;
   			while(i < 365) {
   				if(namenum % 9 == 0) {
   					namenum = 0;
   				}

   				String name = student.get(namenum);
   				int studentid = id+i;
   				int Kor = ((int) (Math.random()*101));
   				int Eng = ((int) (Math.random()*101));
   				int Mat = ((int) (Math.random()*101));

   				String insertQuery = String.format("insert into jspDB ("
   						+ "name,studentid,kor,eng,mat)"
   						+ "values ('%s',%d,%d,%d,%d);",
   						name,studentid,Kor,Eng,Mat);
   				
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