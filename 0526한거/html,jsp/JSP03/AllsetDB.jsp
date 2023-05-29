<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="kr.ac.kopo05.dao.*"%>
<%@page import="kr.ac.kopo05.domain.*"%>
<%@page import="kr.ac.kopo05.dto.*"%>
<%@page import="kr.ac.kopo05.service.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<HTML>
<HEAD>
</HEAD>
<BODY>
	<%
	StudentItemDao studentItemDao = new StudentItemDaoImpl();
	int checkerror = studentItemDao.createRandomData30();
	if (checkerror == 0) {
	%>
	<h1>Table 데이터 값 넣기 성공!!</h1>
	<%
	} else {
	%>
	<h1>Table 데이터 값 넣기 실패!!</h1>
	<%
}
%>
</BODY>
</HTML>