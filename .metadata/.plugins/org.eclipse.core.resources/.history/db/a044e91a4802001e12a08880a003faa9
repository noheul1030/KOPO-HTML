<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*,java.util.*"%> <!--java import-->

<html>
    <head>
    </head>
    <body>
        <h1>후보 등록 OK</h1> <!--head text 크기 1-->

<%      try{
			//DB연동 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
	        Statement stmt = conn.createStatement();
	     
	       
   			int id = 1;
   			List<String> student = new ArrayList<String>(List.of("은광","민혁","프니","현식","창섭","성재"));
   			
   			int namenum = 0;
   			int i = 0;
   			while(i < 36) {
   				if(namenum % 6 == 0) {
   					namenum = 0;
   				}

   				String name = student.get(namenum);
   				int tupyoID = id+i;
   				

   				String insertQuery = String.format("insert into TupyoDB ("
   						+ "name,id)"
   						+ "values ('%s',%d);",
   						name,tupyoID);
   				
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