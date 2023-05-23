<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
    </head>
    <body>
        <%
        String arr[]=new String[]{"111","222","333"}; // 배열 값 지정
        try{ // 예외처리
            out.println(arr[4]+"<br>"); // 배열 4번째 값 출력
        }catch(Exception e){ // 예외처리 발생 시 
            out.println("error-->"+e+"<------<br>"); // 해당 문구 출력
        }
        %>
        Goob.... <%--일반 text 작성--%>
    </body>
</html>