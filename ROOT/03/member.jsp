<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("username"); // input받은 username 값 변수에 저장
    String password = request.getParameter("userpasswd"); // input받은 userpasswd 값 변수에 저장
%>
<html>
    <head>
    <title>로그인</title> <!--타이틀 작성-->
    </head>
    <body>
        이름 : <%= name %><br> <!--name값 출력-->
        비밀번호 : <%= password %><br> <!--password값 출력-->
    </body>
</html>