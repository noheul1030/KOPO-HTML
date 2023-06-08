<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page import="java.sql.*,javax.mail.*,javax.mail.internet.*"
    contentType="text/html; charset=EUC-KR" %>
    <html>
        <body>
            <%-- 변수에 url연결  --%>
            <% String myUrl = "http://www.kopo.ac.kr"; %>
            <%-- 안녕을 누르면 해당 변수에 연결된 URL  주소로 이동 --%>
            <a href="<%= myUrl %>">안녕</a> 하세요.
        </body>
</html>