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
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        Statement stmt = conn.createStatement();
        
        int maxID = 0;
        ResultSet settotal = stmt.executeQuery("select min(id) as minNum from TupyoDB where (id+1) not in (select id from TupyoDB);");
        while (settotal.next()) {
            maxID = settotal.getInt(1)+1;
        }
        
	    request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		
		stmt.execute("insert into TupyoDB (name,id) values ('"+
		name + "',"+
		Integer.toString (maxID)+");");
					
		stmt.close(); 
		conn.close(); 
%>	<h1 align = center>후보 등록 완료</h1>
	<form method = 'post'>	
		<table cellspacing="1" width="400" border="0" align="center" style="border-collapse: collapse;">
			<tr>
				<td width = 300></td>
				<td align="right">
  				<input class="fourth" type="submit" value="후보 조회" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;" formaction = 'AllviewDB.jsp' readonly></td>
				<td align="right">
  				<input class="fourth" type="submit" value="뒤로 가기" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;" formaction = 'updateForm.html' readonly></td>
			</tr>
	</form>	
		</table>
		<table cellspacing="1" width="400" align="center" >
			<tr>
				<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p align="center"><strong>후보이름</strong></p></td>
				<td width = 300 style="border-left: 1px solid #444444;"><p align=center><input value='<%=name%>' style="width: 200px; height: 40px; padding: 0px;"></p></td>
			</tr>
				<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p align=center><strong>기호</strong></p></td>
				<td width = 300 style="border-left: 1px solid #444444;"><p align=center><input value='<%=maxID%>' style="width: 200px; height: 40px; padding: 0px;"></p></td>
			</tr>
		</table>	
<%	}catch(Exception e) {
		System.out.println(e);
	}
%>
    </body>
</html>