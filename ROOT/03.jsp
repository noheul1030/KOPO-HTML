<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <script>
            // call1 함수 
            function  call1() {
                var a = "abc"; // a 변수 값 지정
                var b = "efg"; // b 변수 값 지정
                document.write("String연산:"+(a+b)); // a+b 변수 값 연산               
            }
            // call2 함수 
            function  call2() {
                var a = 1; // a 변수 값 지정
                var b = 2; // b 변수 값 지정
                document.write("Integer연산:"+(a+b)); // a+b 변수 값 연산               
            }
        </script>
    </head>
    <body>
        <script>call1();</script> <%--call 함수 실행--%>
        <script>call2();</script> <%--call 함수 실행--%>
        Good..... <%--일반 text 작성--%>
    </body>
</html>
