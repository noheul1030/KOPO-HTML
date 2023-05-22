<%@ page contentType="text/html; charset=UTF-8"%><%-- 선언 --%>
<%@ request.setCharacterEncoding("utf-8");%>
<html>
    <head>
    </head>
    <body>
        <form method="get">
            <input name="key1" type="text"/>
            <input name="key2" type="text"/>
            <input type="submit" value="제출"/>
        </form>
        <form method="post">
            <input name="key1" type="text"/>
            <input name="key2" type="text"/>
            <input type="submit" value="제출"/>
        </form>
    </body>
</html>
