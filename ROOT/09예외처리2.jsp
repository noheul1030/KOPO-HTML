<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%--오류가 발생하면 09예외처리2-1.jsp실행--%>
<%@ page errorPage="09예외처리2-1.jsp"%>

<html>
    <head>
    </head>
    <body>
    <%
    String arr[] = new String[]{"111","222","333"};// 배열 값 지정
    out.println(arr[4]+"<br>"); // 배열 4번째 값 출력
    %>
    Good... <%--일반 text 작성--%>
    </body>
</html>