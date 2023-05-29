<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="kr.ac.kopo05.dao.*" %>
<%@page import="kr.ac.kopo05.domain.*" %>
<%@page import="kr.ac.kopo05.dto.*" %>
<%@page import="kr.ac.kopo05.service.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%
String name = request.getParameter("name");
Integer kor = Integer.parseInt(request.getParameter("kor"));
Integer eng = Integer.parseInt(request.getParameter("eng"));
Integer mat = Integer.parseInt(request.getParameter("mat"));
%>
<HTML>
<HEAD>
</HEAD>
<style>
 h1 {
    margin-bottom: -30px
 }
 input {
    padding-bottom: 10px;
 }
 td {
    text-align:center
 }

</style>
<BODY>
<%
try{
	StudentItemDao studentItemDao = new StudentItemDaoImpl();
	int newid = studentItemDao.insertOneData(name, kor, eng, mat);
%>
<form>
    <h1 style="height:50px"> 성적입력추가 성공!!</h1><br><br>
    <div style="width:500px; text-align:right">
    <a href = "./intro.html" target="main">
        <input type="button" value="뒤로가기" style="width:100px; height: 25px;"></a>
    </div>
    <table border=1 style="width:500px;">
        <tr>
            <td style="width:100px">이름</td>
            <td style="width:400px"><input type="text" value="<%=name%>" readonly style="width:300px"></td>
        </tr>
        <tr>
            <td style="width:100px">학번</td>
             <td style="width:400px"><input type="number" value="<%=newid%>" readonly style="width:300px"></td>
        </tr>
        <tr>
            <td style="width:100px">국어</td>
            <td style="width:400px"><input type="number" value="<%=kor%>" readonly style="width:300px"></td>
        </tr>
        <tr>
            <td style="width:100px">영어</td>
            <td style="width:400px"><input type="number" value="<%=eng%>" readonly style="width:300px"></td>
        </tr>
        <tr>
            <td style="width:100px">수학</td>
            <td style="width:400px"><input type="number" value="<%=mat%>" readonly style="width:300px"></td>
        </tr>
    </table>
<%
} catch(Exception e){
%>
<h1>Table 데이터 값 넣기 실패!!</h1>
<%
}
%>
</BODY>
</HTML>