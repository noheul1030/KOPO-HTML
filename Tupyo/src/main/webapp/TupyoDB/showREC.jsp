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
    <h1 align = center>후보 조회</h1>
 <%    
 	try{
		//DB연동 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        Statement stmt = conn.createStatement();
        
        request.setCharacterEncoding("utf-8");
        
        String searchID = request.getParameter("tupyoID");
        String query = String.format("SELECT CASE WHEN EXISTS(SELECT * FROM TupyoDB WHERE id = %s) THEN 1 ELSE 0 END", searchID);
        ResultSet resultSet = stmt.executeQuery(query);

        while (resultSet.next()) {
            if (resultSet.getInt(1) == 1) {
                String existQuery = String.format("SELECT * FROM TupyoDB WHERE id = %s", searchID);
                ResultSet existResultSet = stmt.executeQuery(existQuery);

                String name = "";
                int ID = 0;
                
                while (existResultSet.next()) {
                    name = existResultSet.getString("name");
                    ID = existResultSet.getInt("id");
                    // 이후 작업 수행
                }   
%>			<form method = 'post' action = 'showREC.jsp'>
				<table cellspacing="1" width="400"  align="center" >
					<tr>
						<td width = 25% style="table-layout: fixed;"><p style = "font-weight: bold;">기호 입력 :</p></td>
						<td width = 300><p>
						<input type="text" pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" name='tupyoID' 
						value='' title="0~100000000까지의 정수를 입력하세요" required style="font-weight: bold;"></p></td>
		  				<td><input class="fourth" type="submit" value="조회" style="width: 70px;font-weight: bold;"></td>
					</tr>
			</form>
				</table>
	       	<form method = 'post'>
       			<table cellspacing="1" width = "600"  align = "center" >
					<tr>
						<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>후보이름</strong></p></td>
						<td width = 300 style="border-left: 1px solid #444444;"><p><input value='<%=name%>' readonly></p></td>
						<td></td>
					</tr>
						<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>기호</strong></p></td>
						<td width = 300 style="border-left: 1px solid #444444;"><p><input name = "tupyoID" value='<%=ID%>' readonly></p></td>
						<td></td>
					</tr>
				</table>
       			
       			<table cellspacing="1" width="600" border="0" align="center" style="border-collapse: collapse;">
       				<tr>
       					<td align="center">
       	  				<input class="fourth" type="submit" value="추가등록" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;" formaction = 'updateForm.html'></td>
       					<td align="center">
       	  				<input class="fourth" type="submit" value="후보삭제" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;" formaction = 'deleteDB.jsp'></td>
       				</tr>
       			</table>	
    			</form>
<%        	}else if(resultSet.getInt(1) == 0){ %>
			<form method = 'post' action = 'showREC.jsp'>
				<table cellspacing="1" width="600"  align="center" >
					<tr>
						<td width = 25% style="table-layout: fixed;"><p style = "font-weight: bold;">기호 입력 :</p></td>
						<td width = 300><p>
						<input type="text" pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" name='tupyoID' 
						value='' title="0~100000000까지의 정수를 입력하세요" required style="font-weight: bold;"></p></td>
		  				<td><input class="fourth" type="submit" value="조회" style="width: 70px;font-weight: bold;"></td>
					</tr>
			</form>
				</table>
       			<table cellspacing="1" width="600" align="center" >
       				<tr>
       					<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>후보이름</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='해당학번 없음'></p></td>
       					<td></td>
       				</tr>
       					<td bgcolor="gold" width=25% style="border-right: 1px solid #444444;table-layout: fixed;"><p><strong>기호</strong></p></td>
       					<td width = 300 style="border-left: 1px solid #444444;"><p><input value=''></p></td>
       					<td></td>
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