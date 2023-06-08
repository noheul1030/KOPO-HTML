<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>
    <head>
    </head>
    <body>
        <%-- form 메소드 get 설정 --%>
        <form method="get"> 
            <input name="key1" type="text"/><%--input받을 이름,타입 설정--%>
            <input name="key2" type="text"/><%--input받을 이름,타입 설정--%>
            <input type="submit" value="제출"/><%--input받을 타입,value 설정--%>
        </form>
        <%-- form 메소드 post 설정 --%>
        <form method="post">
            <input name="key1" type="text"/><%--input받을 이름,타입 설정--%>
            <input name="key2" type="text"/><%--input받을 이름,타입 설정--%>
            <input type="submit" value="제출"/><%--input받을 타입,value 설정--%>
        </form>
    </body>
</html>
