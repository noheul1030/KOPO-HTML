<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.ac.kopo05.dao.*"%>
<%@page import="kr.ac.kopo05.domain.*"%>
<%@page import="kr.ac.kopo05.dto.*"%>
<%@page import="kr.ac.kopo05.service.*"%>

<HTML>
<HEAD>
</HEAD>
<BODY>
	<%

	StudentItemDao studentItemDao = new StudentItemDaoImpl();
	int checkerror = studentItemDao.createTable();
	if(checkerror == 0){
%>
	<h1>Table 생성 성공!!</h1>
	<%
} else {
%>
	<h1>Table 생성 실패!!</h1>
	<%
}
%>

</BODY>
</HTML>