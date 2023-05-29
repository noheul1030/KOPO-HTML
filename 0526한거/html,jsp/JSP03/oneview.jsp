<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
int student_id = Integer.parseInt(request.getParameter("student_id"));
%>
<HTML>
<HEAD>
<style>
    table {
        border-collapse : collapse;
    } /*table의 형식 선언*/
</style>
</HEAD>
<BODY>
<table width = '100%' border=1>
<tr style = "text-align : center" bgcolor=goldenrod>
    <td>이름</td>
    <td>학번</td>
    <td>국어</td>
    <td>영어</td>
    <td>수학</td>
    <td>총점</td>
    <td>평균</td>
    <td>등수</td>
</tr> <!--Table의 제목 선언-->
<%
try{
	StudentItemDao studentItemDao = new StudentItemDaoImpl();
	StudentItem studentOne = studentItemDao.selectOne(student_id);
	int rank = studentItemDao.getRank(student_id);
	int sum = studentOne.getKor() + studentOne.getEng() + studentOne.getMat();
	double avg = ((int)((sum / 3.0) * 100)) / 100.0;
%>
<tr>
    <td><%=studentOne.getName()%></td>
    <td><%=studentOne.getStudentid()%></td>
    <td><%=studentOne.getKor()%></td>
    <td><%=studentOne.getEng()%></td>
    <td><%=studentOne.getMat()%></td>
    <td><%=sum%></td>
    <td><%=avg%></td>
    <td><%=rank%></td>
</tr>
<!--rset으로 가져온 값을 getString을 통해서 index번호를 통해서 테이블에 출력-->        
<%	
} catch(Exception e){
	out.println(e);
%>
<h1>에러 발생</h1>
<%
}
%>
</BODY>
</HTML>