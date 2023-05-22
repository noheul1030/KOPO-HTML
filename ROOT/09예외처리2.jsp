<%@ page contentType="text/html; charset=UTF-8"%><%-- 선언 --%>
<%@ page errorPage="09예외처리2-1.jsp"%>

<html>
    <head>
    </head>
    <body>
    <%
    String arr[] = new String[]{"111","222","333"};
    out.println(arr[4]+"<br>");
    %>
    Good...
    </body>
</html>