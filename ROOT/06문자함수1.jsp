<%@ page contentType="text/html; charset=UTF-8"%><%-- 선언 --%>
<html>
    <head>
        <%!
        String str = "abcdfeffasdsd";
        int str_len = str.length();
        String str_sub = str.substring(5);
        int str_loc = str.indexOf("cd");
        String strL = str.toLowerCase();
        String strU = str.toUpperCase();
        %>
    </head>
    <body>
        Str :<%=str%><br>
        str_len :<%=str_len%><br>
        str_sub :<%=str_sub%><br>
        str_loc :<%=str_loc%><br>
        strL :<%=strL%><br>
        strU :<%=strU%><br>
        Good....
    </body>
</html>