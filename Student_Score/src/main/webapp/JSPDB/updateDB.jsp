<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8" />

<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*,java.util.*,java.net.*"%> <!--java import-->
<%@ page session="true" %>

<html>
    <head>
    	<meta charset="UTF-8"> <!--인코딩 설정 UTF-8-->
    	<style>
    	@font-face {
                    font-family: "D2CodingLigature";
                    src: url(./D2CodingLigature/D2CodingBold-Ver1.3.2-20180524-ligature.ttf) format("truetype");
                    font-weight: normal;
                }
                /*body 폰트 지정*/
                body{
                    font-family: 'D2CodingLigature',serif;
                }
		  table {
		    border-collapse: collapse;
		    width : 75%;
		  }
		  th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
		  }
		  th:first-child, td:first-child {
		    border-left: none;
		  }
		
		.fourth {
		  background: gold;
		  border-color: white;
		  color: black;
		  background-image: linear-gradient(45deg, yellow 50%, transparent 50%);
		  background-position: 100%;
		  background-size: 400%;
		  transition: background 300ms ease-in-out;
		}
		
		.fourth:hover {
		  background-position: 0;
		}
		input{
			width: 200px; 
			height: 40px; 
			padding: 0px;
		}
		p{
		text-align: center;}
		
		
		  a {text-decoration-line: none; color: #696969;}
		  a:hover {
			  background-color: gold;
			  border-color: white;
			  color: black;
			  font-size : 15px;
			  background-image: linear-gradient(45deg, white 50%, transparent 50%);
			  background-position: 100%;
		  	  background-size: 400%;
			  transition: background 300ms ease-in-out;
		}
		.custom-size {
        	font-size: 15px;
        	background-color: gold;
        } 
		</style>
    </head>
    <body>
 <%    	
		//DB연동 
        Class.forName("com.mysql.jdbc.Driver");
 		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
        Statement stmt = conn.createStatement();
        
        request.setCharacterEncoding("utf-8");
        // null값 체크
        int Nullcheck = request.getParameter("searchID") != null ? 1 : 0;
        
        String name = "";
        int searchID = 0;
        int korean = 0;
        int english = 0;
        int mathmatic = 0;
        
        if(Nullcheck != 0){
	        name = request.getParameter("name");
	        searchID = Integer.parseInt(request.getParameter("searchID"));
	        korean = Integer.parseInt(request.getParameter("korean"));
	        english = Integer.parseInt(request.getParameter("english"));
	        mathmatic = Integer.parseInt(request.getParameter("mathmatic"));
        
	        // 세션에 값저장
	        session.setAttribute("name", name);
	        session.setAttribute("searchID", searchID);
	        session.setAttribute("korean", korean);
	        session.setAttribute("english", english);
	        session.setAttribute("mathmatic", mathmatic);
        }else{
	        name = (String) session.getAttribute("name");
	        searchID = (int) session.getAttribute("searchID");
	        korean = (int) session.getAttribute("korean");
	        english = (int) session.getAttribute("english");
	        mathmatic = (int) session.getAttribute("mathmatic");
        }
        
	
        String query = String.format("update jspDB set kor = %d,eng = %d,mat = %d where studentid = %d",
        		korean,english,mathmatic,searchID);
        				
        stmt.execute(query);
        
        String query2 = String.format("select * from jspDB where studentid = %d",searchID);
        ResultSet resultSet = stmt.executeQuery(query2);        
        
	    int kor = 0;
	    int eng = 0;
	    int mat = 0;
	 	   
	    while(resultSet.next()){
		   kor = resultSet.getInt(3);
		   eng = resultSet.getInt(4);
		   mat = resultSet.getInt(5);
	    }
%>		
		<br>
		<h1 align = center>데이터 수정 완료</h1>
		<form method = 'post' action = 'inputForm2.html'>	
			<table cellspacing="1" width="400" border="0" align="center" style="border-collapse: collapse;">
				<tr>
					<td width = 300></td>
					<td align="right">
	  				<input class="fourth" type="submit" value="뒤로 가기" style="width: 70px; height: 40px; padding: 0px;font-weight: bold;"></td>
				</tr>
		</form>	
			</table>
			<table cellspacing="1" width="400" align="center" >
				<tr>
					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>이름</strong></p></td>
					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='<%=name%>' readonly></p></td>
				</tr>
					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>학번</strong></p></td>
					<td width = 300 style="border-left: 1px solid #444444;"><p><input value='<%=searchID%>' readonly></p></td>
				</tr>
					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>국어</strong></p></td>
					<td width = 300 style="border-left: 1px solid #444444;"><p><input type='text' value='<%=kor%>' readonly></p></td>
				</tr>
					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>영어</strong></td>
					<td width = 300 style="border-left: 1px solid #444444;"><p><input type='text' value='<%=eng%>' readonly></p></td>
				</tr>
					<td bgcolor="gold" width="100" style="border-right: 1px solid #444444;"><p><strong>수학</strong></p></td>
					<td width = 300 style="border-left: 1px solid #444444;"><p><input type='text' value='<%=mat%>' readonly></p></td>
				</tr>
			</table>
			<br>
<%					
		ResultSet rset1 = stmt.executeQuery("select *, kor+eng+mat as sum, (kor+eng+mat)/3 as ave, row_number() over (order by kor+eng+mat desc) as ranking from jspDB order by studentid asc;");
		
		List<String> score = new ArrayList<String>(); // new 리스트 선언
			
		while (rset1.next()){
				score.add(rset1.getString(1)+"\t"+Integer.toString(rset1.getInt(2))+"\t"+Integer.toString(rset1.getInt(3))+
						"\t"+Integer.toString(rset1.getInt(4))+"\t"+Integer.toString(rset1.getInt(5))+"\t"+Integer.toString(rset1.getInt(6))
						+"\t"+Integer.toString(rset1.getInt(7))+"\t"+Integer.toString(rset1.getInt(8)));
			}
		
		int total = score.size();
		
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
		
		stmt.close();
		rset1.close();
		conn.close();
%>
		<!--테이블 형태 지정-->
<%		try{
			// 반복문 
            while (true){ // rset의 next값이 true일 때 %>
	        <table cellspacing="1" width=600 border="1" align = center>
	            <tr bgcolor = gold width="50" align = center style = "font-weight : bold;">
	                <td>이름</td> <!--셀 형태 지정-->
	                <td>학번</td> <!--셀 형태 지정-->
	                <td>국어</td> <!--셀 형태 지정-->
	                <td>영어</td> <!--셀 형태 지정-->
	                <td>수학</td> <!--셀 형태 지정-->
	                <td>합계</td> <!--셀 형태 지정-->
	                <td>평균</td> <!--셀 형태 지정-->
	                <td>Ranking</td> <!--셀 형태 지정-->
	            </tr>
<%            	if(from <=1){                                  
                    from = 1;
                    fromByTen = 0;    
                    
                    for(int i = 0; i < cnt; i++){               // 0~ cnt까지 도는 반복문
                    String[] listcut = score.get(i).split("\t");
                    
                    	if(listcut[1].equals(Integer.toString(searchID))){ %>               
		                    <tr align = center>
		                        <td bgcolor=#B5B2FF><p align=center><a style="color: #696969;" href = 'oneviewDB.jsp?key=<%=listcut[0]%>'><%=listcut[0]%></a></p></td> <!--배열 0번째 값-->
		                        <td bgcolor=#B5B2FF><%=listcut[1]%></td>                                             <!--배열 1번째 값-->
		                        <td bgcolor=#B5B2FF><%=listcut[2]%></td>                                             <!--배열 2번째 값-->
		                        <td bgcolor=#B5B2FF><%=listcut[3]%></td>                                             <!--배열 3번째 값-->
		                        <td bgcolor=#B5B2FF><%=listcut[4]%></td>                                              <!--배열 4번째 값--> 
		                        <td bgcolor=#B5B2FF><%=listcut[5]%></td>                                              <!--배열 5번째 값--> 
		                        <td bgcolor=#B5B2FF><%=listcut[6]%></td>                                              <!--배열 6번째 값--> 
		                        <td bgcolor=#B5B2FF><%=listcut[7]%></td>                                              <!--배열 7번째 값--> 
	                        </tr>
<%             			}else{ %>
							<tr align = center>
							    <td><p align=center><a style="color: #696969;" href = 'oneviewDB.jsp?key=<%=listcut[0]%>'><%=listcut[0]%></a></p></td> <!--배열 0번째 값-->
							    <td><%=listcut[1]%></td>                                             <!--배열 1번째 값-->
							    <td><%=listcut[2]%></td>                                             <!--배열 2번째 값-->
							    <td><%=listcut[3]%></td>                                             <!--배열 3번째 값-->
							    <td><%=listcut[4]%></td>                                              <!--배열 4번째 값--> 
							    <td><%=listcut[5]%></td>                                              <!--배열 5번째 값--> 
							    <td><%=listcut[6]%></td>                                              <!--배열 6번째 값--> 
							    <td><%=listcut[7]%></td>                                              <!--배열 7번째 값--> 
						    </tr>
<%						}
                    } break; // 반복문이 다 돌고 난후 break;
                 }else if(from > 1){                                         // from이 1보다 크면 true 
                     for(int i = (from-1)*cnt; i < ((from-1)*cnt)+cnt; i++){ // cnt의 값에 따라 바뀌는 반복문
                         String[] listcut = score.get(i).split("\t");         // score 리스트의 i값 가져와서 배열에 탭기준 구분 저장

                    	if(listcut[1].equals(Integer.toString(searchID))){ %>               
		                    <tr align = center>
		                        <td bgcolor=#B5B2FF><p align=center><a style="color: #696969;" href = 'oneviewDB.jsp?key=<%=listcut[0]%>'><%=listcut[0]%></a></p></td> <!--배열 0번째 값-->
		                        <td bgcolor=#B5B2FF><%=listcut[1]%></td>                                             <!--배열 1번째 값-->
		                        <td bgcolor=#B5B2FF><%=listcut[2]%></td>                                             <!--배열 2번째 값-->
		                        <td bgcolor=#B5B2FF><%=listcut[3]%></td>                                             <!--배열 3번째 값-->
		                        <td bgcolor=#B5B2FF><%=listcut[4]%></td>                                              <!--배열 4번째 값--> 
		                        <td bgcolor=#B5B2FF><%=listcut[5]%></td>                                              <!--배열 5번째 값--> 
		                        <td bgcolor=#B5B2FF><%=listcut[6]%></td>                                              <!--배열 6번째 값--> 
		                        <td bgcolor=#B5B2FF><%=listcut[7]%></td>                                              <!--배열 7번째 값--> 
	                        </tr>
<%             			}else{ %>
							<tr align = center>
							    <td><p align=center><a style="color: #696969;" href = 'oneviewDB.jsp?key=<%=listcut[0]%>'><%=listcut[0]%></a></p></td> <!--배열 0번째 값-->
							    <td><%=listcut[1]%></td>                                             <!--배열 1번째 값-->
							    <td><%=listcut[2]%></td>                                             <!--배열 2번째 값-->
							    <td><%=listcut[3]%></td>                                             <!--배열 3번째 값-->
							    <td><%=listcut[4]%></td>                                              <!--배열 4번째 값--> 
							    <td><%=listcut[5]%></td>                                              <!--배열 5번째 값--> 
							    <td><%=listcut[6]%></td>                                              <!--배열 6번째 값--> 
							    <td><%=listcut[7]%></td>                                              <!--배열 7번째 값--> 
						    </tr>
<%						}
                    } break; // 반복문이 다 돌고 난후 break;
                 }
              }
           }catch(Exception e){
           		e.printStackTrace();
           }
		%>      
		</table>
		<br>    
		<table border="1" border-collapse:collapse; align = center width = 70%; style="table-layout: fixed;">                   <!--테이블-->
		    <tr align = center>                                                                                                 <!--tr 설정-->
<%              if(from <= maxpage-(maxpage%10)) { %>                                                                           <!--from 값이 maxpage 보다 작거나 같으면 true 조건-->
		            <td><a href="updateDB.jsp?from=1&cnt=<%=cnt%>"><<</a></td>                                                      <!-- 테이블 링크 연결 -->
<%                  if(from <= 10) { %>                                                                                         <!--from 값이 10보다 작거나 크면 true 조건-->
		                <td><a href="updateDB.jsp?from=1&cnt=<%=cnt%>"><</a></td>                                                   <!-- 테이블 링크 연결 -->
<%                  }else { %>
		                <td><a href="updateDB.jsp?from=<%=pageCheck-10%>&cnt=<%=cnt%>"><</a></td>                                    <!-- 테이블 링크 연결 -->
<%                  } %>
<%                  for(int i = 1; i <= 10; i++){ 
						if(pageCheck == fromByTen+i){%>                                                                            <!--1~10까지 도는 반복문-->
		            		<td class="custom-size"><a href="updateDB.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td>                         <!-- 테이블 링크 연결 -->
<%                  	}else{ %>
							<td><a href="updateDB.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> 
<%						} %>
<%					} %>
		            <td><a href="updateDB.jsp?from=<%=pageCheck+10%>&cnt=<%=cnt%>">></a></td>                                       <!-- 테이블 링크 연결 -->
		            <td><a href="updateDB.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">>></a></td>                                           <!-- 테이블 링크 연결 -->
<%              }else { %>
		            <td><a href="updateDB.jsp?from=1&cnt=<%=cnt%>"><<</a></td>                                                      <!-- 테이블 링크 연결 -->
		            <td><a href="updateDB.jsp?from=<%=pageCheck-10%>&cnt=<%=cnt%>"><</a></td>                                        <!-- 테이블 링크 연결 -->
		
<%                  for(int i = 1; i <= maxpage%10; i++){ 
						if(pageCheck == fromByTen+i){%>                                                                    <!--1~나머지 값 만큼 도는 반복문 -->
		            		<td class="custom-size"><a href="updateDB.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td>                         <!-- 테이블 링크 연결 -->
<%                  	}else{ %>
							<td><a href="updateDB.jsp?from=<%=fromByTen+i%>&cnt=<%=cnt%>"><%=fromByTen+i%></a></td> 
<%						} %>
<%					} %>
<%                  if(maxpage-(maxpage%10)< from){ %>                                                                          <!--ㅡmaxpage-나머지 값이 from보다 작으면 -->
		                <td><a href="updateDB.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">></a></td>                                        <!-- 테이블 링크 연결 -->
<%                  }else { %>
		                <td><a href="updateDB.jsp?from=<%=pageCheck+10%>&cnt=<%=cnt%>">></a></td>                                   <!-- 테이블 링크 연결 -->
<%                  } %>
		            <td><a href="updateDB.jsp?from=<%=maxpage%>&cnt=<%=cnt%>">>></a></td>                                           <!-- 테이블 링크 연결 -->
<%              } %>
			</tr>
		</table>
<%	            
        rset1.close(); // resultSet 종료
        stmt.close(); // statement 종료
        conn.close(); // connection 종료
%>
    </body>
</html>