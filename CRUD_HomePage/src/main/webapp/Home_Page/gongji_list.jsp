<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDao" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDaoImpl" %> <!--java import-->

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
		</style>
	</head>
	<body>
<% 
	Home_PageDao dao = new Home_PageDaoImpl();
	dao.createTable();
	
	int total = dao.count(); // 변수 값 리스트 크기 지정
    
    String fromParam = request.getParameter("from"); // input받은 from 값 변수에 저장
	String cntParam = request.getParameter("cnt"); // input받은 cnt 값 변수에 저장
	
	int from = 0; // 변수 초기값 지정
	int cnt = 10; // 변수 초기값 지정
	int fromByTen = 0; // 변수 초기값 지정
	int minpage = 1;
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
	
	ResultSet rset = dao.stmt().executeQuery("select * from gongji order by number desc;");	
	List<String> gongji = new ArrayList<String>(); // new 리스트 선언
	
	while(rset.next()){
		gongji.add(Integer.toString(rset.getInt(1))+"\t"+rset.getString(2)+"\t"+rset.getString(3));
 	}
	try{
		// 반복문 
        while (true){ // rset의 next값이 true일 때 
%>		
	<table border = '1'>
		<tr>
			<td width = '10%'><b>번호</b></td>
			<td width = '65%'><b>제목</b></td>
			<td width = '25%'><b>등록일</b></td>
		</tr>
<%           
			if(from <=1){                                  
                 from = 1;
                 fromByTen = 0;    
                 for(int i = 0; i < cnt; i++){               // 0~ cnt까지 도는 반복문
                    String[] listcut = gongji.get(i).split("\t");
%>               
        <tr class = 'tr' align = center>
             <td><%=listcut[0]%></td>   <!--배열 0번째 값-->
             <td align = left><a href =gongji_view.jsp?key=<%=listcut[0]%>><%=listcut[1]%></a></td>
              <td><%=listcut[2]%></td>                                             <!--배열 2번째 값-->
        </tr>
<%              
                 } break;                                                // 반복문이 다 돌고 난후 break;
             }else if(from > 1){                                         // from이 1보다 크면 true 
                 for(int i = (from-1)*cnt; i < ((from-1)*cnt)+cnt; i++){ // cnt의 값에 따라 바뀌는 반복문
                    String[] listcut = gongji.get(i).split("\t");         // score 리스트의 i값 가져와서 배열에 탭기준 구분 저장
%>
        <tr class = 'tr' align = center>
             <td><%=listcut[0]%></td>   <!--배열 0번째 값-->
             <td align = left><a href =gongji_view.jsp?key=<%=listcut[0]%>><%=listcut[1]%></a></td>
              <td><%=listcut[2]%></td>                                             <!--배열 2번째 값-->
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
	<table border='1' style="table-layout: fixed;">
        <tr align = center>          
<%		if(from <= maxpage-(maxpage%10)) { %>                                                                           <!--from 값이 maxpage 보다 작거나 같으면 true 조건-->
			<td><a href="gongji_list.jsp?from=1&cnt=<%=cnt%>"><<</a></td>                                                      <!-- 테이블 링크 연결 -->
<%			if(from <= 10) { %>                                                                                         <!--from 값이 10보다 작거나 크면 true 조건-->
				<td><a href="gongji_list.jsp?from=1&cnt=<%=cnt%>"><</a></td>                                                   <!-- 테이블 링크 연결 -->
<%			}else { %>
				<td><a href="gongji_list.jsp?from=<%=pageCheck-10%>&cnt=<%=cnt%>"><</a></td>                                    <!-- 테이블 링크 연결 -->
<%			} %>
<%			for(int i = 1; i <= 10; i++){ 
				if(pageCheck == fromByTen+i){%>                                                                            <!--1~10까지 도는 반복문-->
					<td class="custom-size"><a href="gongji_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td>                         <!-- 테이블 링크 연결 -->
<%				}else{ %>
					<td><a href="gongji_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> 
<%				} %>
<%			} %>
			<td><a href="gongji_list.jsp?from=<%=pageCheck+10%>&cnt=<%=cnt%>">></a></td>                                       <!-- 테이블 링크 연결 -->
			<td><a href="gongji_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">>></a></td>                                           <!-- 테이블 링크 연결 -->
<%		}else { %>
			<td><a href="gongji_list.jsp?from=1&cnt=<%=cnt%>"><<</a></td>                                                      <!-- 테이블 링크 연결 -->
			<td><a href="gongji_list.jsp?from=<%=pageCheck-10%>&cnt=<%=cnt%>"><</a></td>                                        <!-- 테이블 링크 연결 -->

<%			for(int i = 1; i <= maxpage%10; i++){ 
				if(pageCheck == fromByTen+i){%>                                                                    <!--1~나머지 값 만큼 도는 반복문 -->
					<td class="custom-size"><a href="gongji_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td>                         <!-- 테이블 링크 연결 -->
<%				}else{ %>
					<td><a href="gongji_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> 
<%				} %>
<%			} %>
<%			if(maxpage-(maxpage%10)< from){ %>                                                                          <!--ㅡmaxpage-나머지 값이 from보다 작으면 -->
				<td><a href="gongji_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">></a></td>                                        <!-- 테이블 링크 연결 -->
<%			}else { %>
				<td><a href="gongji_list.jsp?from=<%=pageCheck+10%>&cnt=<%=cnt%>">></a></td>                                   <!-- 테이블 링크 연결 -->
<%			} %>
			<td><a href="gongji_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">>></a></td>                                           <!-- 테이블 링크 연결 -->
<%		} %>
		
			<td align = 'right' width= 60px>
			<input class='fourth' type='submit' value='신규' formaction = 'gongji_insert.jsp'
				style="width: 60px; height: 30px; padding: 0px;font-weight: bold;"> </td>
		</tr>
	</table>
	</form>
	
	</body>
</html>
