<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->

<html>
	<head>
		<title>개표결과 C_02_H.jsp</title>
		<style>
    		table {
    			text-align: center; 
   				border: 1; 
   				solid black; 
   				width: 600px; 
   				border-collapse: collapse;
   				cellspacing="1"}
   			td{ }
    		a {text-decoration-line: none;  color: #696969;}
    		a:hover {
				background-color: gold;
				border-color: white;
				color: #696969;
				font-size : 16px;
				font-weight: bold; /* 글자 굵게 설정 */
				background-image: linear-gradient(45deg, white 50%, transparent 50%);
				background-position: 100%;
				background-size: 400%;
				transition: background 300ms ease-in-out;
			}
			h2:hover {
			 box-shadow: 0 0 40px 40px #ffd700 inset;
			}
			.tr:hover {
				box-shadow: 0 0 40px 40px #f5f5f5 inset;
			}
    		h1,h2,h4 {margin-top: 15px; text-align: center;}
    		.fourth {
			  background: gold;
			  border-color: white;
			  color: black;
			  background-image: linear-gradient(45deg, yellow 50%, transparent 50%);
			  background-position: 100%;
			  background-size: 400%;
			  transition: background 300ms ease-in-out;
			  border-radius: 5px;
			}
			
			.fourth:hover {
			  background-position: 0;
			}
			.check{
				box-shadow: 0 0 40px 40px #ffd700 inset;
			}
    	</style>
	</head>
	<body>
<%		
		//key값 저장
		String key = request.getParameter("key");

		//DB연동 
		Class.forName("com.mysql.jdbc.Driver");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
		Statement stmt = conn.createStatement();
				 
		// key값 으로 찾는 쿼리문
        String query = String.format("SELECT age AS 연령대,COUNT(age) AS 득표수,COUNT(age) / (SELECT COUNT(*) FROM TupyoDB) * 100 AS 득표율"
        		+ " FROM TupyoDB"
        		+ " WHERE hubo = ? AND age IS NOT NULL"
        		+ " GROUP BY age"
        		+ " ORDER BY age asc;",key);		
        
        PreparedStatement pstmt = conn.prepareStatement(query);
      	pstmt.setString(1, key);
      	
        ResultSet rset = pstmt.executeQuery();
		        
%>
		<table>
    		<tr>
    			<td width = 25%><a align = center id="update" href="A_01_H.jsp" target="content"><h2>후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2>투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2 class="check">개표결과</h2></a></td>
    			<td width = 25%><a align = center id="result" href="D_01_H.jsp" target="content"><h2>초기화</h2></a></td>
    		</tr>
		</table>
		<table>
			<td colspan = "3" ><h1>[<%=key%>] 후보 득표성향 분석</h1></td><!--해당 key값 head text 크기 1-->
		</table>
		
		<form method="post">
		<table border = 1>
<%		
		List<String> list = new ArrayList<String>();
		
		while(rset.next()){
			list.add(rset.getString(1)+","+rset.getString(2)+","+rset.getString(3));
		}
		
		int num = 10;
		String age = "대";
		
		while(num<100){
			for(int i=0;i<list.size();i++){
				String[] listcut = list.get(i).split(",");
				if((num+age).equals(listcut[0])){
					int var = Integer.parseInt(listcut[1]);
					float rate = ((float)((int)(var * 10000)) / 100);
%>		
				<tr class="tr">
					<td width = '20%'><p align=center><%=listcut[0]%></a></p></td>
					<td><img src='bar.PNG' align = left width='<%=rate * 1 / 100%>%' height = 25px><%=listcut[1]%>표(<%=listcut[2]%>%)</td>
				</tr>
<%					out.println("hi");break;		
				}else{ %>
				<tr class="tr">
					<td width = '20%'><p align=center><%=num+age%></a></p></td>
					<td><img src='bar.PNG' align = left width='0%' height = 25px>0표(0%)</td>
				</tr>
<%					break;
				}	
			}
				num+=10;
		}
%>			
		</table>
		</form>
	</body>
</html>
	