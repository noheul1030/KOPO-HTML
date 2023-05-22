<%@ page contentType="text/html; charset=UTF-8"%><%-- 선언 --%>
<html>
    <head>
        <%!
        private class AA{
            private int Sum(int i,int j){
                return i+j;
            }
        }
    AA aa = new AA();
    %>
    </head>
    <body>
        <% out.println("2+3="+aa.Sum(2,3));%> <br>
        Good...
    </body>
</html>