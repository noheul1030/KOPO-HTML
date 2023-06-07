<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="java.io.File, java.net.URL" %>
<%@ page import="org.w3c.dom.*,javax.xml.parsers.*" %>
<%@ page import=" java.io.*, java.net.*" %> 

<html>
	<head>
	</head>
	<body>
<%
DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
Document doc = docBuilder.parse("http://www.kma.go.kr/wid/queryDFS.jsp?gridx=61&gridy=123");

Element root = doc.getDocumentElement();
NodeList tag_001 = doc.getElementsByTagName("data");

out.println("<table cellspacing=1 width=700 border=1>");
out.println("<tr>");
out.println("<td colspan=5 width=100><h1 align = center>기상청 날씨 예보</h1></td>");
out.println("</tr>");

for(int i = 0; i < tag_001.getLength(); i++) {
    String seq = ((Element) tag_001.item(i)).getAttribute("seq");
    
    Element elmt = (Element) tag_001.item(i);
    String hour = elmt.getElementsByTagName("hour").item(0).getFirstChild().getNodeValue();
    
    // 추가적인 처리나 출력 로직을 여기에 작성합니다.
}
%>
	</body>
</html>
