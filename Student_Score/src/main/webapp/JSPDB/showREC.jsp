<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*,java.util.*,java.net.*"%> <!--java import-->
<html>
    <head>
    	<meta charset="UTF-8"> <!--인코딩 설정 UTF-8-->
    	<style>
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
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        Statement stmt = conn.createStatement();
        
        request.setCharacterEncoding("utf-8");
        String searchID = request.getParameter("searchID");
        String query = String.format("SELECT CASE WHEN EXISTS(SELECT * FROM jspDB WHERE studentID = %s) THEN 1 ELSE 0 END", searchID);
        ResultSet resultSet = stmt.executeQuery(query);

        while (resultSet.next()) {
            if (resultSet.getInt(1) == 1) {
                String existQuery = String.format("SELECT * FROM jspDB WHERE studentID = %s", searchID);
                ResultSet existResultSet = stmt.executeQuery(existQuery);

                String name = "";
                int studentID = 0;
                int kor = 0;
                int eng = 0;
                int mat = 0;
                
                
                while (existResultSet.next()) {
                    name = existResultSet.getString("name");
                    studentID = existResultSet.getInt("studentid");
                    kor = existResultSet.getInt("kor");
                    eng = existResultSet.getInt("eng");
                    mat = existResultSet.getInt("mat");
                    // 이후 작업 수행
                }   
%>			<form method = 'post' action = 'showREC.jsp'>
				<table cellspacing="1" width="400"  align="center" >
					<tr>
						<td width = 200><p style = "font-weight: bold;">조회할 학번</p></td>
						<td width = 200><p>
						<input type="text" pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" name='searchID' 
						value='' title="0~100000000까지의 정수를 입력하세요" required style="font-weight: bold;"></p></td>
		  				<td width = 100><input class="fourth" type="submit" value="조회" style="width: 70px;font-weight: bold;"></td>
					</tr>
			</form>
				</table>
       			<table cellspacing="1" width="400" align="center" >
       				<tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>이름</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='<%=name%>'></p></td>
       				</tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>학번</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='<%=studentID%>'></p></td>
       				</tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>국어</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='<%=kor%>'></p></td>
       				</tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>영어</strong></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='<%=eng%>'></p></td>
       				</tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>수학</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='<%=mat%>'></p></td>
       				</tr>
       			</table>
       			
       			<table cellspacing="1" width="400" border="0" align="center" style="border-collapse: collapse;">
       				<tr>
       				<form method = 'post' action = 'updateDB.jsp'>
       					<td align="center">
       	  				<input class="fourth" type="submit" value="수정" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;"></td>
       				</form>
       				<form method = 'post' action = 'delete DB.jsp'>
       					<td align="center">
       	  				<input class="fourth" type="submit" value="삭제" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;"></td>
       				</form>
       				</tr>
       			</table>	
<%        	}else if(resultSet.getInt(1) == 0){ %>
			<form method = 'post' action = 'showREC.jsp'>
				<table cellspacing="1" width="600"  align="center" >
					<tr>
						<td width = 200><p style = "font-weight: bold;"align=center>조회할 학번</p></td>
						<td width = 200><p align=center>
						<input type="text" pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" name='searchID' 
						value='' title="0~100000000까지의 정수를 입력하세요" required style="font-weight: bold;"></p></td>
		  				<td width = 100><input class="fourth" type="submit" value="조회" style="width: 70px;font-weight: bold;"></td>
					</tr>
			</form>
				</table>
       			<table cellspacing="1" width="400" align="center" >
       				<tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>이름</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='해당학번 없음' style="width: 200px; height: 40px; padding: 0px;"></p></td>
       				</tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>학번</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input style="width: 200px; height: 40px; padding: 0px;"></p></td>
       				</tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>국어</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='' style="width: 200px; height: 40px; padding: 0px;"></p></td>
       				</tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>영어</strong></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='' style="width: 200px; height: 40px; padding: 0px;"></p></td>
       				</tr>
       					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>수학</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='' style="width: 200px; height: 40px; padding: 0px;"></p></td>
       				</tr>
       			</table>
       			
<%        	}
        }
        
		stmt.close(); 
		conn.close(); 
	
	}catch(Exception e) {
		System.out.println(e);
		e.printStackTrace();
	}
 
%>
		
    </body>
</html>