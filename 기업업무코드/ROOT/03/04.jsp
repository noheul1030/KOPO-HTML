<%-- 해당 콘텐츠 유형을 text/html로, 인코딩 설정 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <%! // 함수나 변수 선언시!
        private String call1(){ // call1 함수 
            String a = "abc"; // a 변수 값 지정
            String b = "efg"; // b 변수 값 지정
            return (a+b); // a+b 변수 값 return         
        }
        private Integer call2(){ // call2 함수 
            Integer a = 1; // a 변수 값 지정
            Integer b = 2;  // b 변수 값 지정
            return (a+b); // a+b 변수 값 return    
        }
        %>
    </head>
    <body>
    String연산 : <%=call1()%> <br> <%--call 함수 실행--%>
    Integer연산 : <%=call2()%> <br> <%--call 함수 실행--%>
    Good... <%--일반 text 작성--%>
    </body>
</html>