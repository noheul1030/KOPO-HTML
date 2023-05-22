<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*"%>
<html>
    <head>
    <title>와이파이</title>
    </head>
        
    <body>
        <table border ="1" >
                <tr align = center style = "font-weight : bold;"><td>번호</td><td>주소</td><td>위도</td><td>경도</td><td>거리</td></tr>
       
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

        List<String> wifi = new ArrayList<String>();

        int LineCnt = 1;
        while((readtxt=br.readLine())!=null){
            String[] field = readtxt.split("\t");
            double dist = Math.sqrt(Math.pow(Double.parseDouble(field[13])-lat,2)+Math.pow(Double.parseDouble(field[14])-lng,2));
            wifi.add(String.valueOf(LineCnt)+"\t"+field[9]+"\t"+String.valueOf(field[13])+"\t"+String.valueOf(field[14])+"\t"+String.valueOf(dist));
        
        
        %>
        
                <tr>
                <td align = center style = "font-weight : bold;"><%=LineCnt%></td>
                <td><%=field[9] %></td>
                <td><%=field[13] %></td>
                <td><%=field[14] %></td>
                <td><%=dist %></td>
                </tr>
            
        <%
            LineCnt++;
        }

        } catch (Exception e) {
            out.print("에러메시지 : " + e +"<br>");
        } finally {
        br.close();
        }
        %>
        </table>

        
    </body>
</html>