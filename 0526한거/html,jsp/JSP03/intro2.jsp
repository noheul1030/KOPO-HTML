<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="kr.ac.kopo05.dao.*" %>
<%@page import="kr.ac.kopo05.domain.*" %>
<%@page import="kr.ac.kopo05.dto.*" %>
<%@page import="kr.ac.kopo05.service.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<HTML>
<HEAD>
</HEAD>
<BODY>
<h1>JSP Database 실습1</h1>
<%
StudentItemDao studentItemDao = new StudentItemDaoImpl();
String countvisit = studentItemDao.countvisit();
%>
<br><br>
<h1>현재 홈페이지 방문자 수는 :<%=countvisit%>명 입니다.</h1>

</BODY>
</HTML>