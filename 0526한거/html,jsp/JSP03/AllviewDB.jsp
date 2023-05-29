<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="kr.ac.kopo05.dao.*" %>
<%@page import="kr.ac.kopo05.domain.*" %>
<%@page import="kr.ac.kopo05.dto.*" %>
<%@page import="kr.ac.kopo05.service.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<HTML>
<HEAD>
<style>
    table {
        border-collapse : collapse;
    } /*table의 형식 선언*/
</style>
</HEAD>
<BODY>
<%
	try{
	StudentItemDao studentItemDao = new StudentItemDaoImpl();
	List<StudentItem> studentItemList = new ArrayList<StudentItem>();
	studentItemList = studentItemDao.selectAll(1, 30);
%>
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
</tr> <!--Table을 try 문에 넣어서 만약 data가 없을 경우 에러 발생만 출력할 수 있게 했습니다.-->
<%
for(StudentItem st : studentItemList){
	int rank = studentItemDao.getRank(st.getStudentid());
	int sum = st.getKor() + st.getEng() + st.getMat();
	double avg = ((int)((sum / 3.0) * 100)) / 100.0;
%>
<tr><td>
<a href="oneview.jsp?student_id=<%=st.getStudentid()%>" target="main"><%=st.getName()%></a></td>
    <td><%=st.getStudentid()%></td>
    <td><%=st.getKor()%></td>
    <td><%=st.getEng()%></td>
    <td><%=st.getMat()%></td>
    <td><%=sum%></td>
    <td><%=avg%></td>
    <td><%=rank%></td>
</tr> 
<%	
	}
} catch(Exception e){
%>
<h1>에러 발생</h1>
<%
}
%>       

</BODY>
</HTML>