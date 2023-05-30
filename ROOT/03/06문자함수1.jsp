<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <%!
        String str = "abcdfeffasdsd"; // 변수 값 지정
        int str_len = str.length(); // 문자열의 길이 값 지정
        String str_sub = str.substring(5); // 문자열의 substring(5) 값 
        int str_loc = str.indexOf("cd"); // 해당 문자의 index 값
        String strL = str.toLowerCase(); // 문자열을 소문자로
        String strU = str.toUpperCase(); // 문자열을 대문자로
        %>
    </head>
    <body>
        Str :<%=str%><br> <%--변수 값 프린트--%>
        str_len :<%=str_len%><br> <%--변수 값 프린트--%>
        str_sub :<%=str_sub%><br> <%--변수 값 프린트--%>
        str_loc :<%=str_loc%><br> <%--변수 값 프린트--%>
        strL :<%=strL%><br> <%--변수 값 프린트--%>
        strU :<%=strU%><br> <%--변수 값 프린트--%>
        Good.... <%--일반 text 작성--%>
    </body>
</html>