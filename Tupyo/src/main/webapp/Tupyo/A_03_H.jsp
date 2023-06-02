<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->
<html>
	<head>
		<title>후보등록 A_03_H.jsp</title>
		<style>
    		a {text-decoration-line: none;  color: #696969;}
    		h2 {margin-top: 15px;text-align: center;}
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
		<h1>후보 등록 완료</h1>
<%		// DB연동 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		Statement stmt = conn.createStatement();
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("TupyoID");
				
		stmt.execute("insert into TupyoDB (name,id) values ('" +
			 name + "'," + id +");");
%>
		<form method = 'post'>
		<table cellspacing="1" width="600" border="1" align="" style="border-collapse: collapse;" >
    		<tr>
    			<td width = 25%><a align = center id="update" href="A_01.jsp" target="content"><h2>후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2>투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2>개표결과</h2></a></td>
    			<td width = 25%></td>
    		</tr>
		</table>
		<table cellspacing="1" width="600" border="1" align="" style="border-collapse: collapse;" >
			<tr>
				<td align = right width = 20%>
				<input class="fourth" type="submit" value="뒤로 가기" style="width: 70px; height: 30px; padding: 0px;font-weight: bold;" formaction = 'A_01.jsp'></td>
			</tr>
		</table>

		<table cellspacing="1" width="600" border="1" align="" style="border-collapse: collapse;" >
<%		
		ResultSet total = stmt.executeQuery("select count(*) from TupyoDB;");
		int totalcnt = 0;
		while(total.next()){
			totalcnt = total.getInt(1);
		}
		
		if(totalcnt >= 1){                                  
		ResultSet rset = stmt.executeQuery("select * from TupyoDB order by id asc;");
	        
	     	while (rset.next()){ %>
	     		<tr>
	     			<td width =15%><strong>기호번호 :</strong></td>
	     			
	     			<td align = left width = 20% ><input type='text' name='ID' value='<%=rset.getInt(2)%>'readonly style="width: 100px; height: 30px; padding: 0px;"></td>
					
					<td width= 15% ><strong>후보명 :</strong></td>
	     			
	     			<td align = left width = 20% ><input type='text'  name="name" value='<%=rset.getString(1)%>' readonly style="width: 100px; height: 30px; padding: 0px;"></td>
					
					<td align = right width = 20%>
					<input class="fourth" type="submit" value="삭제" style="width: 70px; height: 30px; padding: 0px;font-weight: bold;" formaction = 'A_02_H.jsp'></td>
				</tr>
		</form>
<%	      			
			}
		}
%>
		</table>
	</body>
</html>
		