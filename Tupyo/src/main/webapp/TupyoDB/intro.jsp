<meta language = "java" http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.net.*,java.io.*,java.util.*"%> <!--java import-->
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
	<head>
		<title>intro</title>
		<style>
		    ul {
		        list-style-type: disc;
		    }
		
		    li {
		        margin: 30px;
		    }
		
		    a {
		        text-decoration-line: none;
		
		        /*   text-decoration-line: underline; */
		        /*   text-decoration-line: overline; */
		        /*   text-decoration-line: line-through; */
		        /*   text-decoration-line: underline line-through overline; */
		    }
		
		    a {
		        text-decoration: none;
		        color: black;
		    }
		
		    a:visited {
		        text-decoration: none;
		    }
		
		    a:hover {
		        text-decoration: none;
		    }
		
		    a:focus {
		        text-decoration: none;
		    }
		
		    a:hover,
		    a:active {
		        text-decoration: none;
		    }
		
		    .blinking-text {
		        animation: blink 0.1s linear infinite;
		    }
		
		    @keyframes blink {
		        0% {
		            opacity: 1;
		        }
		
		        50% {
		            opacity: 0;
		        }
		
		        100% {
		            opacity: 1;
		        }
		    }
		
		    .rainbow-text {
		        animation: rainbow-blink 0.3s linear infinite;
		    }
		
		    @keyframes rainbow-blink {
		        0% {
		            color: red;
		        }
		
		        16.7% {
		            color: orange;
		        }
		
		        33.3% {
		            color: yellow;
		        }
		
		        50% {
		            color: green;
		        }
		
		        66.7% {
		            color: blue;
		        }
		
		        83.3% {
		            color: indigo;
		        }
		
		        100% {
		            color: violet;
		        }
		    }
		
		    @keyframes blink {
		        0% {
		            opacity: 1;
		        }
		
		        50% {
		            opacity: 0;
		        }
		
		        100% {
		            opacity: 1;
		        }
		
		        html,
		        body {
		            margin: 0;
		            padding: 0;
		            width: 100%;
		            height: 100%;
		            display: table;
		            background-color: black;
		            
		        }
		    }
		
		    @font-face {
		        font-family: neon;
		        src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
		    }
		
		    .container {
		        display: table-cell;
		        text-align: center;
		        vertical-align: middle;
		    }
		
		    .neon {
		        font-family: neon;
		        color: #FB4264;
		        font-size: 3vw;
		        line-height: 3vw;
		        text-shadow: 0 0 1vw #F40A35;
		    }
		
		    .flux {
		        font-family: neon;
		        color: #426DFB;
		        font-size: 3vw;
		        line-height: 3vw;
		        text-shadow: 0 0 1vw #2356FF;
		    }
		
		    .neon {
		        animation: neon 1s ease infinite;
		        -moz-animation: neon 1s ease infinite;
		        -webkit-animation: neon 1s ease infinite;
		    }
		
		    @keyframes neon {
		
		        0%,
		        100% {
		            text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
		            color: #FED128;
		        }
		
		        50% {
		            text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
		            color: #806914;
		        }
		    }
		
		    .flux {
		        animation: flux 2s linear infinite;
		        -moz-animation: flux 2s linear infinite;
		        -webkit-animation: flux 2s linear infinite;
		        -o-animation: flux 2s linear infinite;
		    }
		
		    @keyframes flux {
		
		        0%,
		        100% {
		            text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .5vw .5vw .1vw #147280;
		            color: #28D7FE;
		        }
		
		        50% {
		            text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, .5vw .5vw .1vw #0A3940;
		            color: #146C80;
		        }
		    }
		    #fixed {
		            position: fixed;
		            bottom: -10px;
		            right: 0px;
		            width: 0px;
		            padding: 0px;
		            
	        }
	       
	</style>
	
	</head>
	<body>
		
		<h1 align = center>후보자 등록 홈페이지</h1>
		<br><br>
		<table width=150px align=center>
	        <tr>
	            <td width=50% align=center class="neon">과제</td>
	            <td width=50% align=center class="flux">검사</td>
	        </tr>
	        <tr>
	            <td colspan=2 class="rainbow-text">***************************</td>
	        </tr>
	        <tr>
	            <td colspan=2 align=center class="rainbow-text">과!제!검!사!</td>
	        </tr>
	        <tr>
	            <td colspan=2 align=center><img 
	                    src="https://media.tenor.com/PK95lqgvj4kAAAAC/%EC%8B%A0%EB%82%98%EB%8A%94%EB%86%8D%EB%8B%B4%EA%B3%B0-%EC%A0%95%EC%8B%A0%EC%82%AC%EB%82%98%EC%9A%B4%EB%86%8D%EB%8B%B4%EA%B3%B0.gif"
	                    width=180px; height=150px;></td>
	        </tr>
	        <tr>
	            <td colspan=2 align=center class="rainbow-text">예이~</td>
	        </tr>
	        <tr>
	            <td colspan=2 class="rainbow-text">***************************</td>
	        </tr>
	    </table>
	    <p align = center class="rainbow-text" style="font-size: 25px;">
<%	    
	    String data;
	    int cnt=0;
	    try{
	    FileReader f1 = new FileReader("cnt.txt");
	    StringBuffer sb = new StringBuffer();
	    int ch = 0;
	    
	    while((ch = f1.read()) != -1){
	    	sb.append((char)ch);
	    }
	    data = sb.toString().trim().replace("\n","");
	    f1.close();
	    
	    cnt = Integer.parseInt(data);
	    cnt++;
	    data = Integer.toString(cnt);
	    out.println("<br><br>현재 홈페이지 방문자 조회수는 ["+data+"] 입니다. <br>");
	    
	    FileWriter f2 = new FileWriter("cnt.txt",false);
	    f2.write(data);
	    f2.close();
		}catch(Exception e){
		}
	    
	    try{
			// DB연동 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
	        Statement stmt = conn.createStatement();
	        Statement stmt2 = conn.createStatement();
			
	        stmt.execute("create table IF not exists TupyoDBcount(visitcount int);");
	        // 테이블 생성, 이름,학번,국어,영어,수학 점수 컬럼 생성
	        //stmt.execute("create table IF not exists jspDBcount(visitcount int not null);"); // 타입 int utf8로 작성 디폴트
	        ResultSet rset = stmt.executeQuery("select max(visitcount) from TupyoDBcount;");
	        
	        int count = 0;
	        if (rset.next()) {
	        	count = rset.getInt(1) + 1;
            }
	        stmt2.execute("insert into TupyoDBcount (visitcount) values (" + count + ");");
	        
	        out.println("<br><br>현재 홈페이지 방문자 조회수는 ["+count+"] 입니다. <br>");
	
	        rset.close();
	        stmt.close(); // statement 종료
	        conn.close(); // connection 종료
		}catch(Exception e){
			out.println("테이블 생성 오류입니다.\n");
			out.println(e);
		}
%>
		</p>
	</body>
</html>