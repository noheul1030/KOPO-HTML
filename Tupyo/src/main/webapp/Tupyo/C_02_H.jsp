<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 

<html>
	<head>
		<title>개표결과 C_02_H.jsp</title>
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
		<h1>후보 득표 성향</h1>
		<table cellspacing=3 width=600 border=1>
			<tr>
				<td width=75><p align=center>연령대</p></td>
				<td width=500><p align=center>인기도</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>10대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>20대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>30대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>40대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>50대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>60대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>70대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>80대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
			<tr>
				<td width=75><p align=center>90대</p></td>
				<td width=500><p align=left><img src = 'bar.jpg' width = 100 height=20> 100(25%)</p></td>
			</tr>
		</table>
	</body>
</html>
	