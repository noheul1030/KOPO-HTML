<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <%!
        private class AA{ // private 클래스 
            private int Sum(int i,int j){ // private 변수 인자값 전달 받으면
                return i+j; // i+j 값 return 
            }
        }
    AA aa = new AA(); // 클래스 객체 생성
    %>
    </head>
    <body>
        <% out.println("2+3="+aa.Sum(2,3));%> <br> <%--계산 값 프린트--%>
        Good... <%--일반 text 작성--%>
    </body>
</html>