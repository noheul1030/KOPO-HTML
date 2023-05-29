<%-- 해당 페이지 언어 = java, 콘텐츠 유형 = text/html, 인코딩 설정 = UTF-8--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<% 
    String fromParam = request.getParameter("from"); // input받은 from 값 변수에 저장
    String cntParam = request.getParameter("cnt"); // input받은 cnt 값 변수에 저장
    
    int from = 0; // 변수 초기값 지정
    int cnt = 10; // 변수 초기값 지정
	int fromByTen = 0; // 변수 초기값 지정
    int LineCnt = 1; // 변수 초기값 지정
    
    int totalcount=0;
    int countCheck=0;
    int minPage=0;
    int maxPage=0;
    int pageCheck=0;
    int startPage=0;
    int endPage=0;
    int P=0;
    int PP=0;
    int N=0;
    int NN=0;

    double lat = 37.3860521; // 현재 위치 위도 값 지정
    double lng = 127.1214038; // 현재 위치 경도 값 지정

    //  파일 경로 변수에 저장
    File f = new File(getServletContext().getRealPath("/resource/전국무료와이파이표준데이터.txt"));
    // BufferedReader로 파일 경로 값 읽기 
    BufferedReader br = new BufferedReader(new FileReader(f));
    String readtxt; // 변수 선언

    List<String> wifi = new ArrayList<String>(); // new 리스트 선언

    // 각 변수의 값이 null 아니면 true 조건 
    if (fromParam != null && cntParam != null) {
        from = Integer.parseInt(fromParam); // 정수로 형변환 값 저장
        cnt = Integer.parseInt(cntParam);   // 정수로 형변환 값 저장
        // from을 정제하여 fromByTen 변수에 저장
		fromByTen = (int) (Math.floor((from - 1) / 10) * 10);
    }
%>
<html>
    <head>
    <title>전국 무료 와이파이 표준 데이터</title> <!--타이틀 작성-->
    <style>
    	a {text-decoration-line: none;}   
        .custom-size {font-size: 25px;}        
    </style> <!--링크 밑줄 없앰 스타일 적용-->
    </head>
    <body>
<%      try { // 예외 처리
            if((readtxt = br.readLine())==null){        // 파일에서 한줄 읽은 값이 null이 아니면 true 조건
                out.println("빈 파일입니다."+"<br>");   // 문구 출력
                return; // 리턴
            }
            
            while((readtxt=br.readLine())!=null){       // 파일에서 한줄 읽은 값이 null이 아니면 true 반복문
                String[] field = readtxt.split("\t");   // 탭 기준으로 구분해서 field 배열에 값 저장
                // 필요한 배열값만 뽑아서 한 문자열로 합친 후 wifi 리스트 저장 
                double dist = Math.sqrt(Math.pow(Double.parseDouble(field[13])-lat,2)+Math.pow(Double.parseDouble(field[14])-lng,2));
                wifi.add(String.valueOf(LineCnt)+"\t"+field[9]+"\t"+String.valueOf(field[13])+"\t"+String.valueOf(field[14])+"\t"+String.valueOf(dist));
                LineCnt++; // 1 추가 
            }
            
            
         	// 1. 총 데이터 수
        	totalcount = wifi.size();

        	// 2. 현재 카운트 조정
        	countCheck = (cnt > totalcount || cnt < 1) ? totalcount : cnt;

        	// 3. 최소 페이지 수
        	minPage = 1;

        	// 4. 최대 페이지 수
        	maxPage = (totalcount % countCheck == 0) ? (totalcount / countCheck) : (totalcount / countCheck) + 1;

        	// 5. C 현재 페이지 조정
        	/* 현재페이지가 0보다 작으면 */
        	if (from <= minPage){pageCheck = minPage;}
        	/* 현재 페이지가 최대페이지 보다 크면 */
        	else if (from > maxPage){pageCheck = maxPage;}
        	/* 1 ~ 최대페이지 */
        	else{pageCheck = from;}
        	
        	// 6. S 현재 페이지의 처음
        	startPage = (((int) ((pageCheck - 1) / 10)) * 10) + 1;

        	// 7. E 현재 페이지의 마지막
        	endPage = (startPage + 9 >= maxPage) ? maxPage : startPage + 9;

        	// 8. <, <<
        	P = (startPage <= minPage) ? 1 : startPage - 10;
        	PP = (P == 1) ? 1 : minPage;

        	// 9. >, >>
        	N = (endPage + 1 <= maxPage) ? endPage + 1 : endPage;
        	NN = (N == endPage) ? endPage : maxPage;
        	
            while(true){ // true 반복문
%>
                <table border ="1" align = center width = 70%;  style="table-layout: auto;"> <!--테이블 지정-->
                    <tr align = center style = "font-weight : bold;"><td>번호</td><td>주소</td><td>위도</td><td>경도</td><td>거리</td></tr> <!--tr,td 지정--> 
                    
<%              for(int i = startPage; i <= endPage; i++){ // cnt의 값에 따라 바뀌는 반복문
 				   String[] listcut = wifi.get(i-1).split("\t");         // wifi 리스트의 i값 가져와서 배열에 탭기준 구분 저장
%>
					<tr>
					<td align = center style = "font-weight : bold;"><%=listcut[0]%></td> <!--배열 0번째 값-->
					<td><%=listcut[1] %></td>                                             <!--배열 1번째 값-->
					<td><%=listcut[2] %></td>                                             <!--배열 2번째 값-->
					<td><%=listcut[3] %></td>                                             <!--배열 3번째 값-->
					<td><%=listcut[4]%></td>                                              <!--배열 4번째 값-->
					</tr>
<%              
               } break;    // 반복문이 다 돌고 난후 break;
            }
        } catch (Exception e) { // 에러 catch
            // out.print("에러메시지 : " + e +"<br>");
        } finally {
        br.close();             // BufferedReader 종료
        }

%>      
        </table>  
        <table border="1" border-collapse:collapse; align = center width = 70%; style="table-layout: fixed;">                   <!--테이블-->
            <tr align = center>         <!--tr 설정-->
            	<td><a href="helloworld.jsp?from=<%=PP%>&cnt=<%=countCheck%>"><<</a></td>
            	<td><a href="helloworld.jsp?from=<%=P%>%>&cnt=<%=countCheck%>"><</a></td>
            	
<%              int num = 0;
                for(int i = startPage; i <= endPage; i++){ 
					if(pageCheck == startPage+num){ %>                                                                            <!--1~10까지 도는 반복문-->
                		<td class="custom-size"><a href="helloworld.jsp?from=<%=startPage+num%>&cnt=<%=countCheck%>"><%=startPage+num%></a></td>                         <!-- 테이블 링크 연결 -->
<%              		num++;
					}else { %>
            			<td><a href="helloworld.jsp?from=<%=startPage+num%>&cnt=<%=countCheck%>"><%=startPage+num%></a></td>
<%            			num++;
					} %>
<%            	} num = 0;%>
            	<td><a href="helloworld.jsp?from=<%=N%>&cnt=<%=countCheck%>">></a></td>  
            	<td><a href="helloworld.jsp?from=<%=NN%>&cnt=<%=countCheck%>">>></a></td>  
			</tr>
        </table>
    </body>
</html>