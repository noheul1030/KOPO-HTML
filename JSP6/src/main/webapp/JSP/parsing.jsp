<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <!-- 인코딩 지정 -->
<%@ page import="java.io.File, java.net.URL" %>
<%@ page import="org.w3c.dom.*,javax.xml.parsers.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %> <!-- 자바 import -->

<html>
	<head>
	</head>
	<body>
<%
	DocumentBuilder  docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
//	Document doc = docBuilder.parse(new File("/var/lib/tomcat9/webapps/ROOT/JSP6/JSP/xmlmake.xml"));		// local path
	Document doc = docBuilder.parse("http://192.168.23.60:8080/JSP6/JSP/xmlmake.jsp");		// URL
	
	Element root = doc.getDocumentElement();
	NodeList tag_name = doc.getElementsByTagName("name");		// xml name tag
	NodeList tag_studentid = doc.getElementsByTagName("studentid");		// xml studentid tag
	NodeList tag_kor = doc.getElementsByTagName("kor");		// xml kor tag
	NodeList tag_eng = doc.getElementsByTagName("eng");		// xml eng tag
	NodeList tag_mat = doc.getElementsByTagName("mat");		// xml mat tag
	
	out.println("<h1>성적 조회</h1>"); // h1크기 text 작성
	out.println("<table cellspacing=1 width=500 border=1>"); // 테이블 스타일 지정
	out.println("<tr>");
	out.println("<td width=100>이름</td>"); // 이름 셀
	out.println("<td width=100>학번</td>"); // 학번 셀
	out.println("<td width=100>국어</td>"); // 국어 셀
	out.println("<td width=100>영어</td>"); // 영어 셀 
	out.println("<td width=100>수학</td>"); // 수학 셀
	out.println("</tr>");
	
	for(int i = 0; i < tag_name.getLength(); i++){ // name의 길이만큼 도는 반복문 
		out.println("<tr>");
		out.println("<td width=100>"+tag_name.item(i).getFirstChild().getNodeValue()+"</td>"); 		// 이름 셀
		out.println("<td width=100>"+tag_studentid.item(i).getFirstChild().getNodeValue()+"</td>"); // 학번 셀
		out.println("<td width=100>"+tag_kor.item(i).getFirstChild().getNodeValue()+"</td>");		// 국어 셀
		out.println("<td width=100>"+tag_eng.item(i).getFirstChild().getNodeValue()+"</td>");		// 영어 셀 
		out.println("<td width=100>"+tag_mat.item(i).getFirstChild().getNodeValue()+"</td>");		// 수학 셀
		out.println("</tr>");
	}
%>
	</body>
</html>
