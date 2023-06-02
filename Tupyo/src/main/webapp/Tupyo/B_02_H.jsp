<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<html>
	<head>
		<title>투표 B_02_H.jsp</title>
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
		<table cellspacing="1" width="600" border="1" align="" style="border-collapse: collapse;" >
    		<tr>
    			<td width = 25%><a align = center id="update" href="A_01.jsp" target="content"><h2>후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2>투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2>개표결과</h2></a></td>
    			<td width = 25%></td>
    		</tr>
		</table>
		<br>
		<h1>투표하기</h1>
		<br>
		<h1>투표를 완료하였습니다.</h1>
	</body>
</html>