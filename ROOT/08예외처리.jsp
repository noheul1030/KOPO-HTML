<%@ page contentType="text/html; charset=UTF-8"%><%-- 선언 --%>
<html>
    <head>
    </head>
    <body>
        <%
        String arr[]=new String[]{"111","222","333"};
        try{
            out.println(arr[4]+"<br>");
        }catch(Exception e){
            out.println("error-->"+e+"<------<br>");
        }
        %>
        Goob....
    </body>
</html>