<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
    </head>
    <body>
        <%
        String arr[] = new String[]{"111","222","333"}; // 배열 값 지정
        String str = "abd,efg,hij"; // 문자열 변수 값 지정
        String str_arr[] = str.split(","); // 문자열을 , 기준으로 나누고 배열 저장
        %>
        arr[0]:<%=arr[0]%><br> <%--배열 0번째 값 프린트--%> 
        arr[1]:<%=arr[1]%><br> <%--배열 1번째 값 프린트--%> 
        arr[2]:<%=arr[2]%><br> <%--배열 2번째 값 프린트--%> 
        str_arr[0]:<%=str_arr[0]%><br> <%--배열 0번째 값 프린트--%> 
        str_arr[1]:<%=str_arr[1]%><br> <%--배열 1번째 값 프린트--%> 
        str_arr[2]:<%=str_arr[2]%><br> <%--배열 2번째 값 프린트--%> 
        Good... <%--일반 text 작성--%>
    </body>
</html>