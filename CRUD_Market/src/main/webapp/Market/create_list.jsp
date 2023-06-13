<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*" %>

<html>
	<head>
		<style>
			/*테이블 스타일 지정*/
			table{
				margin-left: auto;
	  			margin-right: auto;
			  	text-align: center; 
 				width: 85%;
 				border-collapse: collapse;
 				cellspacing:1;
 				table-layout: fixed;
   			}
			.table{
				margin-top :10px;
				margin-bottom :10px;
				margin-left: auto;
	  			margin-right: auto;
			  	text-align: center; 
 				width: 95%; 
 				border-collapse: collapse;
 				cellspacing:1;
 				table-layout: fixed;
   			}
   			/*.tr:hover 스타일 지정*/
   			.tr:hover{
   			 background-color : #f5f5f5;
   			}
   			/*h2 스타일 지정*/
   			h2{margin-top:20px;}
   			/*a 스타일 지정*/
			a {text-decoration-line: none;  color: #696969;}
			/*a:hover 스타일 지정*/
			a:hover {
			  font-size : 16px;
			  font-weight: bold;
			  background-position: 100%;
		  	  background-size: 400%;
			}
			/*버튼의 스타일 지정*/
    		.fourth{
			  background: #ffdddd;
			  border-color: white;
			  color: black;
			  background-image: linear-gradient(45deg, #eecccc 50%, transparent 50%);
			  background-position: 100%;
			  background-size: 400%;
			  transition: background 300ms ease-in-out;
			  border-radius: 5px;
			}
			.fourth:hover {
			  background-position: 0;
			} 
			/*.custom-size 스타일 지정*/
			.custom-size {
        	font-size: 15px;
        	background-color: #ffdddd;
        	}    			
		</style>	
	</head>
	
	<body>
<%
	MarketDao dao = new MarketDaoImpl();
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
	
	ResultSet rset = dao.stmt().executeQuery("select * from market order by inventoryUpdate desc;");	
	List<String> market = new ArrayList<String>(); // new 리스트 선언
	
	while(rset.next()){
		market.add(Integer.toString(rset.getInt(1))+"\t"+rset.getString(2)+"\t"
					+Integer.toString(rset.getInt(3))+"\t"+rset.getString(4)+"\t"+rset.getString(5));
 	}
	try{
		// 반복문 
        while (true){ // rset의 next값이 true일 때 	
%>	
	<table border='2'> <!-- 테이블 테두리 2 지정 -->
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td height='50px'><h2>(주)과일상회 재고 현황 - 전체현황</h2></td>
		</tr> <!-- 셀 스타일 지정,text 출력 -->
		<tr style="border-bottom:none;">
			<td>
			<!-- 여기부터는 테이블 안에 테이블 구성 -->
			<table border='1' class='table' style="table-layout: fixed;">
				<tr bgcolor= ffdddd> <!-- 셀 스타일 지정,text 출력 -->
					<td>상품번호</td>
					<td>상품명</td>
					<td>현재 재고수</td>
					<td>재고파악일</td>
					<td>상품등록일</td>
				</tr>
<%          // 전체 행의 값 조회 시 0이면 true
			if(dao.count()==0){ %>
		<tr><td><br><br><h3>게시글이 존재하지 않습니다.</h3></td></tr> <!-- 해당 문구 출력 -->
<%			}
			if(from <=1){                                   // from이 1이하이면
			    from = 1;									// from 값 지정
			    fromByTen = 0;    
			    for(int i = 0; i < cnt; i++){               // 0~ cnt까지 도는 반복문
			       String[] listcut = market.get(i).split("\t"); // market list의 값을 \t 기준으로 배열 저장
%>					<!-- 셀 스타일 지정,text 출력 -->
					<tr class='tr'>
						<td><a href = 'oneview.jsp?key=<%=listcut[0]%>'><%=listcut[0]%></a></td>
						<td><a href = 'oneview.jsp?key=<%=listcut[0]%>'><%=listcut[1]%></a></td>
						<td><%=listcut[2]%></td>
						<td><%=listcut[3]%></td>
						<td><%=listcut[4]%></td>
					</tr>
<%
                } break;    // 반복문이 다 돌고 난후 break; 
			}else if(from > 1){                                         // from이 1보다 크면 true 
				for(int i = (from-1)*cnt; i < ((from-1)*cnt)+cnt; i++){ // cnt의 값에 따라 바뀌는 반복문
                    String[] listcut = market.get(i).split("\t");         // score 리스트의 i값 가져와서 배열에 탭기준 구분 저장
%>					<!-- 셀 스타일 지정,text 출력 -->
    				<tr class='tr'>
    					<td><a href = 'oneview.jsp?key=<%=listcut[0]%>'><%=listcut[0]%></a></td>
    					<td><a href = 'oneview.jsp?key=<%=listcut[0]%>'><%=listcut[1]%></a></td>
    					<td><%=listcut[2]%></td>
    					<td><%=listcut[3]%></td>
    					<td><%=listcut[4]%></td>
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
			</td>
		</tr>
		<tr style="border-top:none;">
			<td>
	
			<form method = 'post'>  <!-- form 메소드 post 지정 -->
			<table border='1' class='table'>  <!-- 테이블 테두리 1 지정 -->
        		<tr align = center>          

<%			if(from <= maxpage-(maxpage%10)) { %>                                                                           <!--from 값이 maxpage 보다 작거나 같으면 true 조건-->
					<td><a href="create_list.jsp?from=1&cnt=<%=cnt%>"><<</a></td>                                           <!-- 테이블 링크 연결 -->
<%				if(from <= 10) { %>                                                                                         <!--from 값이 10보다 작거나 크면 true 조건-->
					<td><a href="create_list.jsp?from=1&cnt=<%=cnt%>"><</a></td>                                            <!-- 테이블 링크 연결 -->
<%				}else { %>
					<td><a href="create_list.jsp?from=<%=pageCheck-10%>&cnt=<%=cnt%>"><</a></td>                            <!-- 테이블 링크 연결 -->
<%				} %>
<%				for(int i = 1; i <= 10; i++){ 
					if(pageCheck == fromByTen+i){%>                                                                         <!--1~10까지 도는 반복문-->
						<td class="custom-size"><a href="create_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> <!-- 테이블 링크 연결 -->
<%					}else{ %>
						<td><a href="create_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> 
<%					} %>
<%				} %>
				<td><a href="create_list.jsp?from=<%=pageCheck+10%>&cnt=<%=cnt%>">></a></td>                                 <!-- 테이블 링크 연결 -->
				<td><a href="create_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">>></a></td>                                     <!-- 테이블 링크 연결 -->
<%			}else { %>
				<td><a href="create_list.jsp?from=1&cnt=<%=cnt%>"><<</a></td>                                                <!-- 테이블 링크 연결 -->
				<td><a href="create_list.jsp?from=<%=pageCheck-10%>&cnt=<%=cnt%>"><</a></td>                                 <!-- 테이블 링크 연결 -->

<%				for(int i = 1; i <= maxpage%10; i++){ 
					if(pageCheck == fromByTen+i){%>                                                                     	 <!--1~나머지 값 만큼 도는 반복문 -->
						<td class="custom-size"><a href="create_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> <!-- 테이블 링크 연결 -->
<%					}else{ %>
						<td><a href="create_list.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> 
<%					} %>
<%				} %>
<%				if(maxpage-(maxpage%10)< from){ %>                                                                           <!--ㅡmaxpage-나머지 값이 from보다 작으면 -->
					<td><a href="create_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">></a></td>                                  <!-- 테이블 링크 연결 -->
<%				}else { %>
					<td><a href="create_list.jsp?from=<%=pageCheck+10%>&cnt=<%=cnt%>">></a></td>                             <!-- 테이블 링크 연결 -->
<%				} %>
				<td><a href="create_list.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">>></a></td>                                     <!-- 테이블 링크 연결 -->
<%			} %>
		
			<td width='80px' align = 'right'>
			<input class='fourth' type='submit' value='신규등록' formaction = 'insert.jsp'
				style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"> </td>
				</tr>	
			</table>
			</form>  <!-- form 태그 종료 -->
	
			</td>
		</tr>
	</table>
	</body>
</html>