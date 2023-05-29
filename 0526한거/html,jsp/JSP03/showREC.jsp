<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="kr.ac.kopo05.dao.*" %>
<%@page import="kr.ac.kopo05.domain.*" %>
<%@page import="kr.ac.kopo05.dto.*" %>
<%@page import="kr.ac.kopo05.service.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%
Integer student_id = Integer.parseInt(request.getParameter("studentid"));
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
	StudentItem st = studentItemDao.selectOne(student_id);
%>
<form method="post" name="form">
    <h1 style="height:50px"> 성적 조회후 정정 / 삭제</h1><br><br>
   
    조회할 학번
    <input type="number" style="width:300px;" style="height: 20px;" value="<%=student_id%>">
    <input type="submit" value="조회"style="width:100px; height: 25px;">
    <table border=1 style="width:500px;">
        <tr>
            <td style="width:100px">이름</td>
            <td style="width:400px"><input type="text" name="name" value=<%=st.getName()%> style="width:300px"></td>
        </tr>
        <tr>
            <td style="width:100px">학번</td>
            <td style="width:400px"><input readonly type="text" name="studentid" readonly value=<%=st.getStudentid()%> style="width:300px"></td>
        </tr>
        <tr>
            <td style="width:100px">국어</td>
           <td style="width:400px"><input type="number" name="kor" value=<%=st.getKor()%> style="width:300px"></td>
        </tr>
        <tr>
            <td style="width:100px">영어</td>
            <td style="width:400px"><input type="number" name="eng" value=<%=st.getEng()%> style="width:300px"></td>
        </tr>
        <tr>
            <td style="width:100px">수학</td>
            <td style="width:400px"><input type="number" name="mat" value=<%=st.getMat()%> style="width:300px"></td>
        </tr>
        </table>
        <div style="text-align:right; width:500px">
            <input type="submit" value="수정" onclick="javascript: form.action='updateDB.jsp';"/>
            <input type="submit" value="삭제" onclick="javascript: form.action='deleteDB.jsp';"/>
        </div>
    </form>
<%
	// mysql에 입력할 문구를 작성하는 과정
	// table의 형태와 맞게 table(fieldname1,..... ,fieldname10) valuse(value1,......value10)이런형태로
	// data를 table에 insert into 명령어로 저장하기 위해 명령어를 저장
	 // mysql에 명령어를전달해 실행
	// 저장될때마다 몇번째 항목을 저장한지와 저장한 내용을 출력
	
} catch(Exception e){
%>
<h1>Table 데이터 값 조회 실패</h1>
<%
}
%>
</BODY>
</HTML>