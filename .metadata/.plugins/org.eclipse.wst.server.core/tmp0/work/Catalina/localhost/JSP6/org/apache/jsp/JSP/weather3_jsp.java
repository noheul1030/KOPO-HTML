/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-06-08 15:32:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.JSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.File;
import java.net.URL;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.text.*;

public final class weather3_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("java.text");
    _jspx_imports_packages.add("org.w3c.dom");
    _jspx_imports_packages.add("java.net");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("javax.xml.parsers");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.net.URL");
    _jspx_imports_classes.add("java.io.File");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("	<head>\r\n");
      out.write("		<style>\r\n");
      out.write("		table{\r\n");
      out.write("			cellspacing:1; \r\n");
      out.write("			table-layout: fixed; \r\n");
      out.write("			width:100%;\r\n");
      out.write("			border-collapse: collapse;\r\n");
      out.write("			solid black;\r\n");
      out.write("			text-align: center;\r\n");
      out.write("		}\r\n");
      out.write("		td{\r\n");
      out.write("			text-align: center;\r\n");
      out.write("			fix-layout: fix;\r\n");
      out.write("			width: auto; \r\n");
      out.write("			font-size:7px;\r\n");
      out.write("		}\r\n");
      out.write("		img{width:20px; height:20px;}\r\n");
      out.write("		</style>\r\n");
      out.write("	</head>\r\n");
      out.write("	<body>\r\n");

	DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
	Document doc = docBuilder.parse("http://www.kma.go.kr/wid/queryDFS.jsp?gridx=55&gridy=124");
	
	// 오늘,내일,모레의 시간 데이터를 출력하기 위한 calender 객체 생성
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    Calendar calendar = Calendar.getInstance();
    Date date = calendar.getTime();
    String day0=""; // 오늘
    String day1=""; // 내일
    String day2=""; // 모레
	
	
	String seq=""; 		// 48시간 중 몇번째 인지 가리킴
	String hour="";		// 동네 예보 3시간 단위
	String day="";		// 1번째 날 (0: 오늘/1: 내일/2: 모레)
	String temp=""; 	// 현재 시간온도
	String tmx=""; 		// 최고 온도
	String tmn="";		// 최저 온도
	String sky=""; 		// 하늘 상태코드 (1: 맑음, 2: 구름조금, 3: 구름많음, 4: 흐림)
	String pty=""; 		// 강수 상태코드 (0: 없음, 1: 비, 2: 비/눈, 3: 눈/비, 4: 눈)
	String wfKor="";	// 날씨 한국어
	String wfEn=""; 	// 날씨 영어
	String pop=""; 		// 강수 확률 %
	String r12=""; 		// 12시간 예상 강수량
	String s12=""; 		// 12시간 예상 적설량
	double ws=0.0; 		// 풍속 (m/s)
	String wd="";	 	// 풍향 (0~7: 북, 북동, 동, 남동, 남, 남서, 서, 북서)
	String wdKor=""; 	// 풍향 한국어
	String wdEn=""; 	// 풍향 영어
	String reh=""; 		// 습도 %
	
	
	Element root = doc.getDocumentElement();
	NodeList tag_001 = doc.getElementsByTagName("data");	
	
	
	out.println("<h2>미추홀구 주안동 날씨 조회</h2>"); // h2크기 text 작성
	out.println("<table cellspacing=1 width=800 border=1>"); // 테이블 스타일 지정
	out.println("<tr height='30px'>");
	out.println("<td>순번</td> <td>시간</td> <td>날짜</td> <td>현재온도</td> <td>최고기온</td>"); 
	out.println("<td>최저기온</td> <td>현재날씨</td> <td>강수상태</td> <td>날씨</td> <td>Weather</td>"); 
	out.println("<td>강수확률%</td> <td>예상강수량</td> <td>예상적설량</td> <td>풍속</td> <td>풍향</td>"); 
	out.println("<td>풍향</td> <td>Wind direction</td> <td>습도%</td>"); 
	out.println("</tr>");
	
	
	for(int i = 0; i < tag_001.getLength(); i++) { // tag_001의 길이만큼 도는 반복문
	    Element elmt = (Element) tag_001.item(i);
	
	    seq = tag_001.item(i).getAttributes().getNamedItem("seq").getNodeValue();           				// 순번 저장
	    hour = elmt.getElementsByTagName("hour").item(0).getFirstChild().getNodeValue();					// 시간 저장
	    day = elmt.getElementsByTagName("day").item(0).getFirstChild().getNodeValue();						// 날짜 저장
	    temp = elmt.getElementsByTagName("temp").item(0).getFirstChild().getNodeValue();					// 현재온도 저장
	    tmx = elmt.getElementsByTagName("tmx").item(0).getFirstChild().getNodeValue();						// 최고기온 저장
	    tmn = elmt.getElementsByTagName("tmn").item(0).getFirstChild().getNodeValue();						// 최저기온 저장
	    sky = elmt.getElementsByTagName("sky").item(0).getFirstChild().getNodeValue();						// 현재날씨 저장
	    pty = elmt.getElementsByTagName("pty").item(0).getFirstChild().getNodeValue();						// 강수상태 저장
	    wfKor = elmt.getElementsByTagName("wfKor").item(0).getFirstChild().getNodeValue();					// 날씨 저장
	    wfEn = elmt.getElementsByTagName("wfEn").item(0).getFirstChild().getNodeValue();					// Weather 저장
	    pop = elmt.getElementsByTagName("pop").item(0).getFirstChild().getNodeValue();						// 강수확률 저장
	    r12 = elmt.getElementsByTagName("r12").item(0).getFirstChild().getNodeValue();						// 예상강수량 저장
	    s12 = elmt.getElementsByTagName("s12").item(0).getFirstChild().getNodeValue();						// 예상적설량 저장
	    ws = Double.parseDouble(elmt.getElementsByTagName("ws").item(0).getFirstChild().getNodeValue());	// 풍속 저장
	    wd = elmt.getElementsByTagName("wd").item(0).getFirstChild().getNodeValue();						// 풍향 저장
	    wdKor = elmt.getElementsByTagName("wdKor").item(0).getFirstChild().getNodeValue();					// 풍향 저장
	    wdEn = elmt.getElementsByTagName("wdEn").item(0).getFirstChild().getNodeValue();					// Wind direction 저장
	    reh = elmt.getElementsByTagName("reh").item(0).getFirstChild().getNodeValue();						// 습도 저장
	    
		
	    
	    
	    if(day.equals("0")){ // 오늘 날짜일 때
	    	
	    	date = calendar.getTime();  // 오늘의 date값 저장
		    day0 = sd.format(date); 	// 포맷 저장
			
		    // 저장된 변수의 값을 하나씩 불러와서 프린트 한다.
		    out.println("<tr>");
		    out.println("<td>"+tag_001.item(i).getAttributes().getNamedItem("seq").getNodeValue()+"</td>");
		    out.println("<td>"+"오늘"+hour+"시"+"</td>");
		    out.println("<td>"+day0+"</td>");
		    out.println("<td>"+temp+"</td>");
		 	// 최고 기온의 값이 -999.0(해당 값은 없음)이면 -처리
		    if(tmx.equals("-999.0")){ 
		    	tmx = "-";
		    }
		 	// 최저 기온의 값이 -999.0(해당 값은 없음)이면 -처리
		    if(tmn.equals("-999.0")){ 
		    	tmn = "-";
		    }
		    out.println("<td>"+tmx+"</td>");
		    out.println("<td>"+tmn+"</td>");
		    
		    // 현재날씨의 값이 1 ~ 4 일 때 각각의 값에 맞는 img파일을 출력하여 보여준다.
		    // 하늘 상태코드 (1: 맑음, 2: 구름조금, 3: 구름많음, 4: 흐림)
		    if(sky.equals("1")){ 
				out.println("<td><img src='맑음.png'></td>");
			}
			if(sky.equals("2")){
				out.println("<td><img src='구름조금.png'></td>");
			}
			if(sky.equals("3")){
				out.println("<td><img src='구름많음.png'></td>");
			}
			if(sky.equals("4")){
				out.println("<td><img src='흐림.png'></td>");
			}
			
			// 강수상태의 값이 0 ~ 4 일 때 각각의 값에 맞는 img파일을 출력하여 보여준다.
			// 강수 상태코드 (0: 없음, 1: 비, 2: 비/눈, 3: 눈/비, 4: 눈)
			if(pty.equals("0")){
				out.println("<td>"+"-"+"</td>");
			}
			if(pty.equals("1")){
				out.println("<td><img src='비.png'></td>");
			}
			if(pty.equals("2")){
				out.println("<td><img src='비.png'>&#32;&#47;&#32;<img src='눈.png'></td>");
			}
			if(pty.equals("3")){
				out.println("<td><img src='눈.png'>&#32;&#47;&#32;<img src='비.png'></td>");
			}
			if(pty.equals("4")){
				out.println("<td><img src='눈.png'></td>");
			}
		    out.println("<td>"+wfKor+"</td>");
		    out.println("<td>"+wfEn+"</td>");
		    out.println("<td>"+pop+"</td>");
		    out.println("<td>"+r12+"</td>");
		    out.println("<td>"+s12+"</td>");
		    // 형 변환을 통해 풍속의 값을 소숫점 한자리 까지만 출력 
		    out.println("<td>"+String.format("%.1f",ws)+"</td>");
		    // 풍향의 방향의 img파일을 wd값에 따라 변형하여 출력
		    out.println("<td><img src='"+wd+".png'></td>");
		    out.println("<td>"+wdKor+"</td>");
		    out.println("<td>"+wdEn+"</td>");
		    out.println("<td>"+reh+"</td>");
	    }
	    
	    
	    
	    if(day.equals("1")){ // 내일 날짜일 때

	    	Calendar tempCalendar = (Calendar) calendar.clone(); // 기존 calendar 객체를 변경하지 않기 위해 복제
	        tempCalendar.add(Calendar.DAY_OF_MONTH, 1); 		 // 기존 날짜에 1일을 더한다.
	        Date date1 = tempCalendar.getTime();				 // 날짜 값을 가져온다.
	        day1 = sd.format(date1);							 // 내일의 날짜에 맞게 포멧 저장
	        
	     	// 저장된 변수의 값을 하나씩 불러와서 프린트 한다.
		    out.println("<tr bgcolor= #e6e6fa>"); // 색상 지정
		    out.println("<td>"+tag_001.item(i).getAttributes().getNamedItem("seq").getNodeValue()+"</td>");
		    out.println("<td>"+"내일"+hour+"시"+"</td>");
		    out.println("<td>"+day1+"</td>");
		    out.println("<td>"+temp+"</td>");
		 	// 최고 기온의 값이 -999.0(해당 값은 없음)이면 -처리
		    if(tmx.equals("-999.0")){
		    	tmx = "-";
		    }
		 	// 최저 기온의 값이 -999.0(해당 값은 없음)이면 -처리
		    if(tmn.equals("-999.0")){
		    	tmn = "-";
		    }
		    out.println("<td>"+tmx+"</td>");
		    out.println("<td>"+tmn+"</td>");
		    
		 	// 현재날씨의 값이 1 ~ 4 일 때 각각의 값에 맞는 img파일을 출력하여 보여준다.
		    // 하늘 상태코드 (1: 맑음, 2: 구름조금, 3: 구름많음, 4: 흐림)
		    if(sky.equals("1")){
				out.println("<td><img src='맑음.png'></td>");
			}
			if(sky.equals("2")){
				out.println("<td><img src='구름조금.png'></td>");
			}
			if(sky.equals("3")){
				out.println("<td><img src='구름많음.png'></td>");
			}
			if(sky.equals("4")){
				out.println("<td><img src='흐림.png'></td>");
			}
			
			// 강수상태의 값이 0 ~ 4 일 때 각각의 값에 맞는 img파일을 출력하여 보여준다.
			// 강수 상태코드 (0: 없음, 1: 비, 2: 비/눈, 3: 눈/비, 4: 눈)
			if(pty.equals("0")){
				out.println("<td>"+"-"+"</td>");
			}
			if(pty.equals("1")){
				out.println("<td><img src='비.png'></td>");
			}
			if(pty.equals("2")){
				out.println("<td><img src='비.png' src='눈.png'></td>");
			}
			if(pty.equals("3")){
				out.println("<td><img src='눈.png' src='비.png'></td>");
			}
			if(pty.equals("4")){
				out.println("<td><img src='눈.png'></td>");
			}
		    out.println("<td>"+wfKor+"</td>");
		    out.println("<td>"+wfEn+"</td>");
		    out.println("<td>"+pop+"</td>");
		    out.println("<td>"+r12+"</td>");
		    out.println("<td>"+s12+"</td>");
		 	// 형 변환을 통해 풍속의 값을 소숫점 한자리 까지만 출력 
		    out.println("<td>"+String.format("%.1f",ws)+"</td>");
		 	// 풍향의 방향의 img파일을 wd값에 따라 변형하여 출력
		    out.println("<td><img src='"+wd+".png'></td>");
		    out.println("<td>"+wdKor+"</td>");
		    out.println("<td>"+wdEn+"</td>");
		    out.println("<td>"+reh+"</td>");
	    }
	    
	    
	    
	    if(day.equals("2")){ // 모레 날짜일 때
	    	
	    	Calendar tempCalendar = (Calendar) calendar.clone(); // 기존 calendar 객체를 변경하지 않기 위해 복제
	        tempCalendar.add(Calendar.DAY_OF_MONTH, 2);			 // 기존 날짜에 2일을 더한다.
	        Date date2 = tempCalendar.getTime();				 // 날짜 값을 가져온다.
	        day2 = sd.format(date2);							 // 모레의 날짜에 맞게 포멧 저장
	    	
	     	// 저장된 변수의 값을 하나씩 불러와서 프린트 한다.
		    out.println("<tr bgcolor = #fff5ee>"); // 색상 지정
		    out.println("<td>"+tag_001.item(i).getAttributes().getNamedItem("seq").getNodeValue()+"</td>");
		    out.println("<td>"+"모레"+hour+"시"+"</td>");
		    out.println("<td>"+day2+"</td>");
		    out.println("<td>"+temp+"</td>");
		 	// 최고 기온의 값이 -999.0(해당 값은 없음)이면 -처리
		    if(tmx.equals("-999.0")){
		    	tmx = "-";
		    }
		 	// 최저 기온의 값이 -999.0(해당 값은 없음)이면 -처리
		    if(tmn.equals("-999.0")){
		    	tmn = "-";
		    }
		    out.println("<td>"+tmx+"</td>");
		    out.println("<td>"+tmn+"</td>");
		    
			// 현재날씨의 값이 1 ~ 4 일 때 각각의 값에 맞는 img파일을 출력하여 보여준다.
		    // 하늘 상태코드 (1: 맑음, 2: 구름조금, 3: 구름많음, 4: 흐림)
		    if(sky.equals("1")){
				out.println("<td><img src='맑음.png'></td>");
			}
			if(sky.equals("2")){
				out.println("<td><img src='구름조금.png'></td>");
			}
			if(sky.equals("3")){
				out.println("<td><img src='구름많음.png'></td>");
			}
			if(sky.equals("4")){
				out.println("<td><img src='흐림.png'></td>");
			}
			
			// 강수상태의 값이 0 ~ 4 일 때 각각의 값에 맞는 img파일을 출력하여 보여준다.
			// 강수 상태코드 (0: 없음, 1: 비, 2: 비/눈, 3: 눈/비, 4: 눈)
			if(pty.equals("0")){
				out.println("<td>"+"-"+"</td>");
			}
			if(pty.equals("1")){
				out.println("<td><img src='비.png'></td>");
			}
			if(pty.equals("2")){
				out.println("<td><img src='비.png' src='눈.png'></td>");
			}
			if(pty.equals("3")){
				out.println("<td><img src='눈.png' src='비.png'></td>");
			}
			if(pty.equals("4")){
				out.println("<td><img src='눈.png'></td>");
			}
		    out.println("<td>"+wfKor+"</td>");
		    out.println("<td>"+wfEn+"</td>");
		    out.println("<td>"+pop+"</td>");
		    out.println("<td>"+r12+"</td>");
		    out.println("<td>"+s12+"</td>");
		 	// 형 변환을 통해 풍속의 값을 소숫점 한자리 까지만 출력 
		    out.println("<td>"+String.format("%.1f",ws)+"</td>");
		 	// 풍향의 방향의 img파일을 wd값에 따라 변형하여 출력
		    out.println("<td><img src='"+wd+".png'></td>");
		    out.println("<td>"+wdKor+"</td>");
		    out.println("<td>"+wdEn+"</td>");
		    out.println("<td>"+reh+"</td>");
	    }
	}

      out.write("\r\n");
      out.write("	</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
