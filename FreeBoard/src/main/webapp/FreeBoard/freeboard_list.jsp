<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*" %> <!--java import-->

<html>
	<head>
		<style>
			table{
				margin-left: auto;
	  			margin-right: auto;
			  	text-align: center; 
 				width: 85%; 
 				border-collapse: collapse;
 				cellspacing:1;
   			}
   			.tr:hover{
   			 background-color : #f5f5f5;
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
		  	a {text-decoration-line: none;  color: #696969;}
		  
		  	a:hover {
			  font-size : 16px;
			  font-weight: bold;
			  background-position: 100%;
		  	  background-size: 400%;
			}			
			.custom-size {
        	font-size: 15px;
        	background-color: gold;
        	}
        	span{
        	 margin-left:5px;
        	}     			
		</style>
	</head>
	<body>
<% 
	String driver = "com.mysql.cj.jdbc.Driver";
	String connection = "jdbc:mysql://192.168.23.60:3307/kopo11";
//	String connection = "jdbc:mysql://localhost:3306/noheul";
	String root = "root";
	String password = "shdmf1030@";
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		
	Class.forName(driver);
	conn = DriverManager.getConnection(connection, root,password);
	stmt = conn.createStatement();
	}catch(Exception e){
		e.printStackTrace();
	}

	FreeBoardDao dao = new FreeBoardDaoImpl();
	dao.createTable(); // 테이블 생성
	
	int total = dao.count(); // 변수 값 리스트 크기 지정
    
    String fromParam = request.getParameter("from"); // input받은 from 값 변수에 저장
	String cntParam = request.getParameter("cnt"); // input받은 cnt 값 변수에 저장
	
	int from = 0; // 변수 초기값 지정
	int cnt = 10; // 변수 초기값 지정
	int fromByTen = 0; // 변수 초기값 지정
	int minpage = 1; // 변수 초기값 지정
	int maxpage = (total%cnt == 0)?(total/cnt):(total/cnt)+1; // 변수 초기값 지정
	int LineCnt = 1; // 변수 초기값 지정
	
	int pageCheck=0; // 현재 페이지 계산
	
	
	// 각 변수의 값이 null 아니면 true 조건 
    if (fromParam != null && cntParam != null) {
        from = Integer.parseInt(fromParam); // 정수로 형변환 값 저장
        cnt = Integer.parseInt(cntParam);   // 정수로 형변환 값 저장
        // from을 정제하여 fromByTen 변수에 저장
		fromByTen = (int) (Math.floor((from - 1) / 10) * 10);
    }
	
	if(from > maxpage) {
        from = maxpage;
        fromByTen = (int) (Math.floor((from - 1) / 10) * 10);
    }
    	    
 	// 5. C 현재 페이지 조정
	/* 현재페이지가 0보다 작으면 */
	if (from <= 1){pageCheck = 1;}
	/* 현재 페이지가 최대페이지 보다 크면 */
	else if (from > maxpage){pageCheck = maxpage;}
	/* 1 ~ 최대페이지 */
	else{pageCheck = from;}
	
	//ResultSet rset = dao.stmt.executeQuery("select * from freeboard order by id desc;");	
	ResultSet rset = stmt.executeQuery("select id,title,viewcnt,date,relevel from freeboard order by rootid desc, recnt asc;");	
	List<String> freeboard = new ArrayList<String>(); // new 리스트 선언
	
	while(rset.next()){
		freeboard.add(Integer.toString(rset.getInt(1))+"\t"+rset.getString(2)+"\t"+rset.getString(3)+"\t"+rset.getString(4)+"\t"+rset.getString(5));
 	}
	
	conn.close();
	stmt.close();
	
	try{
		// 반복문 
        while (true){ // rset의 next값이 true일 때 
%>		
	<table border = '1'> <!-- 테이블 테두리 1 지정 -->
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width = '70'><b>번호</b></td>
			<td bgcolor='#dde5ff'><b>제목</b></td>
			<td bgcolor='#dde5ff' width = '70'><b>조회수</b></td>
			<td bgcolor='#dde5ff' width = '100'><b>등록일</b></td>
		</tr>
<%           // 전체 행의 값 조회 시 0이면 true
			if(dao.count()==0){ %>
			<!-- 셀 스타일 지정,text 출력 -->
		<tr style="border:none;"><td colspan='4'><h3 style="margin-top:15px;">게시글이 존재하지 않습니다.</h3></td></tr>
<%			}
			if(from <=1){                     				 // from이 1이하이면              
                 from = 1;									 // from 값 지정
                 fromByTen = 0;    
                 for(int i = 0; i < cnt; i++){               // 0~ cnt까지 도는 반복문
                    String[] listcut = freeboard.get(i).split("\t"); // freeboard list의 값을 \t 기준으로 배열 저장
                 	String re = ""; // 변수 선언
                 	for(int j = 0; j < Integer.parseInt(listcut[4]);j++){ // 댓글의 레벨에 따른 하이픈 길이 조절
                 		if(i > 0){
                			re = re + "-";
                		}
                 	}
%>      <!-- 셀 스타일 지정,text 출력 -->            
        <tr class = 'tr' align = center>
             <td><%=listcut[0]%></td>   <!--배열 0번째 값-->
<%			if(listcut[3].equals(dao.date())){ 
				if(Integer.parseInt(listcut[4]) == 0){%>
             		<td align = left><a href =freeboard_view.jsp?key=<%=listcut[0]%>><span style="font-weight: bold;"><%=listcut[1] +" [New]"%></span></a></td>
<%				}else{ %>
             		<td align = left><a href =freeboard_view.jsp?key=<%=listcut[0]%>><span style="font-weight: bold;"><%=re +">[Re]"+ listcut[1] +" [New]"%></span></a></td>
<%				}%>
<%			}else{
				if(Integer.parseInt(listcut[4]) == 0){%>
             		<td align = left><a href =freeboard_view.jsp?key=<%=listcut[0]%>><span><%=listcut[1]%></span></a></td>
<%				}else{ %>
             		<td align = left><a href =freeboard_view.jsp?key=<%=listcut[0]%>><span><%=re +">[Re]"+ listcut[1]%></span></a></td>
<%				}%>
<%			} %>
             <td><%=listcut[2]%></td>                                             <!--배열 7번째 값-->
             <td><%=listcut[3]%></td>                                             <!--배열 2번째 값-->
        </tr>
<%              
                 } break;                                                // 반복문이 다 돌고 난후 break;
             }else if(from > 1){                                         // from이 1보다 크면 true 
                 for(int i = (from-1)*cnt; i < ((from-1)*cnt)+cnt; i++){ // cnt의 값에 따라 바뀌는 반복문
                    String[] listcut = freeboard.get(i).split("\t");         // score 리스트의 i값 가져와서 배열에 탭기준 구분 저장
%>
        <tr class = 'tr' align = center>
             <td><%=listcut[0]%></td>   <!--배열 0번째 값-->
<%			if(listcut[2].equals("0")){ %>
             <td align = left><a href =freeboard_view.jsp?key=<%=listcut[0]%>><span style="font-weight: bold;"><%=listcut[1]+" [New]"%></span></a></td>
<%			}else{%>
             <td align = left><a href =freeboard_view.jsp?key=<%=listcut[0]%>><span><%=listcut[1]%></span></a></td>
<%			} %>  
             <td><%=listcut[2]%></td>                                             <!--배열 7번째 값-->
             <td><%=listcut[3]%></td>                                             <!--배열 2번째 값-->
        </tr>
<%
                   } break;    // 반복문이 다 돌고 난후 break; 
	           }
			}
           }catch(Exception e){
           		e.printStackTrace();
           }
%>	
	</table>
	<br>

	<form method = 'post'>
	<table style="table-layout: fixed;">
        <tr align = center>          
        <td></td>
<%		if(from <= maxpage-(maxpage%10)) { %>                                                                           <!--from 값이 maxpage 보다 작거나 같으면 true 조건-->
			<td><a href="freeboard_list.jsp?from=1&cnt=<%=cnt%>"><<</a></td>                                                      <!-- 테이블 링크 연결 -->
<%			if(from <= 10) { %>                                                                                         <!--from 값이 10보다 작거나 크면 true 조건-->
				<td><a href="freeboard_list.jsp?from=1&cnt=<%=cnt%>"><</a></td>                                                   <!-- 테이블 링크 연결 -->
<%			}else { %>
				<td><a href="freeboard_list.jsp?from=<%=pageCheck-10%>&cnt=<%=cnt%>"><</a></td>                                    <!-- 테이블 링크 연결 -->
<%			} %>
<%			for(int i = 1; i <= 10; i++){ 
				if(pageCheck == fromByTen+i){%>                                                                            <!--1~10까지 도는 반복문-->
					<td class="custom-size"><a href="freeboard_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td>                         <!-- 테이블 링크 연결 -->
<%				}else{ %>
					<td><a href="freeboard_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> 
<%				} %>
<%			} %>
			<td><a href="freeboard_list.jsp?from=<%=pageCheck+10%>&cnt=<%=cnt%>">></a></td>                                       <!-- 테이블 링크 연결 -->
			<td><a href="freeboard_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">>></a></td>                                           <!-- 테이블 링크 연결 -->
<%		}else { %>
			<td><a href="freeboard_list.jsp?from=1&cnt=<%=cnt%>"><<</a></td>                                                      <!-- 테이블 링크 연결 -->
			<td><a href="freeboard_list.jsp?from=<%=pageCheck-10%>&cnt=<%=cnt%>"><</a></td>                                        <!-- 테이블 링크 연결 -->

<%			for(int i = 1; i <= maxpage%10; i++){ 
				if(pageCheck == fromByTen+i){%>                                                                    <!--1~나머지 값 만큼 도는 반복문 -->
					<td class="custom-size"><a href="freeboard_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td>                         <!-- 테이블 링크 연결 -->
<%				}else{ %>
					<td><a href="freeboard_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> 
<%				} %>
<%			} %>
<%			if(maxpage-(maxpage%10)< from){ %>                                                                          <!--ㅡmaxpage-나머지 값이 from보다 작으면 -->
				<td><a href="freeboard_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">></a></td>                                        <!-- 테이블 링크 연결 -->
<%			}else { %>
				<td><a href="freeboard_list.jsp?from=<%=pageCheck+10%>&cnt=<%=cnt%>">></a></td>                                   <!-- 테이블 링크 연결 -->
<%			} %>
			<td><a href="freeboard_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">>></a></td>                                           <!-- 테이블 링크 연결 -->
<%		} %>
			<td></td>
			<td align = 'right' width= 60px>
			<input class='fourth' type='submit' value='신규' formaction = 'freeboard_insert.jsp'
				style="width: 60px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form>
	
	</body>
</html>
