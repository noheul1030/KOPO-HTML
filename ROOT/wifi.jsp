<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*"%>
<% 
    String fromParam = request.getParameter("from");
    String cntParam = request.getParameter("cnt");
    
    int from = 0;
    int cnt = 0;
	int fromByTen = 0;
    
    if (fromParam != null && cntParam != null) {
        from = Integer.parseInt(fromParam);
        cnt = Integer.parseInt(cntParam);
		fromByTen = floor(from-1/10) * 10;
    }
    List<String> wifi = new ArrayList<String>();

%>

<html>
    <head>
    <title>와이파이</title>
    </head>
        
    <body>
<% 
        File f = new File("/var/lib/tomcat9/webapps/전국무료와이파이표준데이터.txt");
        BufferedReader br = new BufferedReader(new FileReader(f));
        String readtxt;
        
        try { 
        if((readtxt = br.readLine())==null){
            out.println("빈 파일입니다."+"<br>");
            return;
        }
        String[] field_name = readtxt.split("\t");

        double lat = 37.3860521;
        double lng = 127.1214038;

        
        int LineCnt = 1;
        while((readtxt=br.readLine())!=null){
            String[] field = readtxt.split("\t");
            double dist = Math.sqrt(Math.pow(Double.parseDouble(field[13])-lat,2)+Math.pow(Double.parseDouble(field[14])-lng,2));
            wifi.add(String.valueOf(LineCnt)+"\t"+field[9]+"\t"+String.valueOf(field[13])+"\t"+String.valueOf(field[14])+"\t"+String.valueOf(dist));
            LineCnt++;
        }
        
        while(from != 0){
%>
            <table border ="1" width = 60%;  style="table-layout: auto;">
            <tr align = center style = "font-weight : bold;"><td>번호</td><td>주소</td><td>위도</td><td>경도</td><td>거리</td></tr>
       
<%
            if(from == 1){
                for(int i = 0; i < cnt; i++){
                String[] listcut = wifi.get(i).split("\t");
%>
                <tr>
                <td align = center style = "font-weight : bold;"><%=listcut[0]%></td>
                <td><%=listcut[1] %></td>
                <td><%=listcut[2] %></td>
                <td><%=listcut[3] %></td>
                <td><%=listcut[4]%></td>
                </tr>
<%
                }
                break;
            }else if(from > 1){
                for(int i = from*cnt; i < (from*cnt)+cnt; i++){
                    String[] listcut = wifi.get(i).split("\t");
%>
                <tr>
                <td align = center style = "font-weight : bold;"><%=listcut[0]%></td>
                <td><%=listcut[1] %></td>
                <td><%=listcut[2] %></td>
                <td><%=listcut[3] %></td>
                <td><%=listcut[4]%></td>
                </tr>
            
<%
                }
                break;
            }
        }
        } catch (Exception e) {
            out.print("에러메시지 : " + e +"<br>");
        } finally {
        br.close();
        }
%>
        </table>        
        
        <table border="1" width = 60%; style="table-layout: fixed;">
            <tr align = center>
                <td><a href="wifi.jsp?from=<%=fromByTen+0%>&cnt=30"><<<</a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+1%>&cnt=30"><%=fromByTen+1%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+2%>&cnt=30"><%=fromByTen+2%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+3%>&cnt=30"><%=fromByTen+3%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+4%>&cnt=30"><%=fromByTen+4%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+5%>&cnt=30"><%=fromByTen+5%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+6%>&cnt=30"><%=fromByTen+6%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+7%>&cnt=30"><%=fromByTen+7%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+8%>&cnt=30"><%=fromByTen+8%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+9%>&cnt=30"><%=fromByTen+9%></a></td>
                <td><a href="wifi.jsp?from=<%=fromByTen+10%>&cnt=30"><%=fromByTen+10%></a></td>
                <td><a href="wifi.jsp?from=<%=(fromByTen+11)%>&cnt=30">>>></a></td>
			</tr>
        </table>
    </body>
</html>