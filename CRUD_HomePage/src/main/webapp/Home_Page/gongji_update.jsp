<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDao" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDaoImpl" %> <!--java import-->

<html>
	<head>
		<style>
			table{
			  	text-align: center; 
 				width: 600px; 
 				border-collapse: collapse;
 				border-width: 2px;
 				cellspacing="1"
   			}
   			tr,td{border-width: 2px;}
   			textarea,input{
   				width: 500px;
   				margin-top : 4px;
   				margin-bottom : 4px;
   				margin-left : 4px;
   				margin-right : 4px;
   				
   			}
    		.fourth{
			  background: gold;
			  border-color: white;
			  color: black;
			  background-image: linear-gradient(45deg, yellow 50%, transparent 50%);
			  background-position: 100%;
			  background-size: 400%;
			  transition: background 300ms ease-in-out;
			  border-radius: 5px;
			}
			
			.fourth:hover {
			  background-position: 0;
			}   			
   			
		</style>
	</head>
	<body>
<%
	Home_PageDao dao = new Home_PageDaoImpl();

	
	Integer number = null;
	String title = null;
	String date = null;
	String content = "";

	request.setCharacterEncoding("utf-8");
	ResultSet rset = dao.selectOne(request.getParameter("key"));
	while(rset.next()){
		
		number = rset.getInt(1);
		title = rset.getString(2);
		date = rset.getString(3);
		if(rset.getString(4) != null){
			content = rset.getString(4);
		}
	}
	
%>	