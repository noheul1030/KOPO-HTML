/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-06-07 16:30:03 UTC
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

public final class weather2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("	</head>\r\n");
      out.write("	<style>\r\n");
      out.write("		table{\r\n");
      out.write("			cellspacing:1; \r\n");
      out.write("			table-layout: fixed; \r\n");
      out.write("			width:1000;\r\n");
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
      out.write("	</style>\r\n");
      out.write("	<body>\r\n");

	DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
	Document doc = docBuilder.parse("http://www.kma.go.kr/wid/queryDFS.jsp?gridx=61&gridy=123");
	
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
	String ws=""; 		// 풍속 (m/s)
	String wd="";	 	// 풍향 (0~7: 북, 북동, 동, 남동, 남, 남서, 서, 북서)
	String wdKor=""; 	// 풍향 한국어
	String wdEn=""; 	// 풍향 영어
	String reh=""; 		// 습도 %
	String r06=""; 		// 6시간 예상 강수량
	String s06=""; 		// 6시간 예상 적설량
	
	Element root = doc.getDocumentElement();
	NodeList tag_001 = doc.getElementsByTagName("data");
	
	out.println("<h2>날씨 조회</h2>"); // h2크기 text 작성
	out.println("<table border =1>"); // 테이블 스타일 지정
	
	int check = -1;
	out.println("<tr>");
	// 날짜
    out.println("<td><b>날짜</td>");
	for(int i = 0; i < tag_001.getLength(); i++) { // tag_001의 길이만큼 도는 반복문
	    Element elmt = (Element) tag_001.item(i);
	    day = elmt.getElementsByTagName("day").item(0).getFirstChild().getNodeValue();
	    
	    if(day.equals("0")&&check==0){
			out.println("<td></td>");
		}else if(day.equals("0")&&check!=0){
			out.println("<td><b>오늘</td>");
			check = 0;
		}
		
	    
	    if(day.equals("1")&&check==1){
			out.println("<td  bgcolor=CCCCCC></td>");
		}else if(day.equals("1")&&check!=1){
			out.println("<td bgcolor=CCCCCC><b>내일</td>");
			check = 1;
		}
		
	    
		if(day.equals("2")&&check==2){
			out.println("<td></td>");
		}else if(day.equals("2")&&check!=2){
			out.println("<td><b>모레</td>");
			check = 2;
		}
	}
	out.println("</tr>");
	
	
	
	out.println("<tr>");
	// 시간 
	out.println("<td><b>시각</td>");
	for(int i = 0; i < tag_001.getLength(); i++) { // tag_001의 길이만큼 도는 반복문
	    Element elmt = (Element) tag_001.item(i);
	    hour = elmt.getElementsByTagName("hour").item(0).getFirstChild().getNodeValue(); // 시간
		out.println("<td>"+hour+"시"+"</td>");
	}
	out.println("</tr>");
	
	
	out.println("<tr>");
	// 날씨
	out.println("<td><b>날씨</td>");
	for(int i = 0; i < tag_001.getLength(); i++) { // tag_001의 길이만큼 도는 반복문
	    Element elmt = (Element) tag_001.item(i);
	    sky = elmt.getElementsByTagName("sky").item(0).getFirstChild().getNodeValue(); // 시간
	    
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
	}
	out.println("</tr>");
	
	
	
	out.println("<tr>");
	// 강수 확률
	out.println("<td><b>강수확률(%)</td>");
	for(int i = 0; i < tag_001.getLength(); i++) { // tag_001의 길이만큼 도는 반복문
	    Element elmt = (Element) tag_001.item(i);
	    pop = elmt.getElementsByTagName("pop").item(0).getFirstChild().getNodeValue(); 
	    
	    out.println("<td>"+pop+"</td>");
	}
	out.println("</tr>");
	
	
	
	out.println("<tr>");
	// 기온
	int min = Integer.MAX_VALUE;
	int max = Integer.MIN_VALUE;
	int col=0;
	
	out.println("<td><b>기온</td>");
	for(int i = 0; i < tag_001.getLength(); i++) { // tag_001의 길이만큼 도는 반복문
	    Element elmt = (Element) tag_001.item(i);
	    day = elmt.getElementsByTagName("day").item(0).getFirstChild().getNodeValue(); 
	    tmx = elmt.getElementsByTagName("tmx").item(0).getFirstChild().getNodeValue(); 
	    tmn = elmt.getElementsByTagName("tmn").item(0).getFirstChild().getNodeValue(); 
	    
	    if(day.equals("1")){
			if(Integer.parseInt(tmn) <= min){
				min = Integer.parseInt(tmn);
			}
			if(Integer.parseInt(tmx) >= max){
				max = Integer.parseInt(tmx);
			}
			col++;
		}
	}
	out.println("<td colspan="+col+">"+ "최고기온: "+max+"/최저기온: "+min+"</td>");
	
	out.println("</tr>");
	

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