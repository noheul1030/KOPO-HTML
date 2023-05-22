<%@ page contentType="text/html; charset=UTF-8"%><%-- 선언 --%>
<%
    String name = request.getParameter("username");
    String password = request.getParameter("userpasswd");
%>
<html>
    <head>
    <title>로그인</title>
    </head>
    <body>
        이름 : <%= name %><br>
        비밀번호 : <%= password %><br>
    </body>
</html>