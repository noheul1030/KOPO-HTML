<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %> <!--java import-->
<%@ page import="java.io.*"%> <!--java import-->
<%@ page import="java.sql.*"%> <!--java import-->
<html>
	<head>
		<title>후보등록 A_03_H.jsp</title>
		<style>
    		table {
    			text-align: center; 
   				border: 0; 
   				solid black; 
   				width: 600px; 
   				border-collapse: collapse;
   				cellspacing="1"}s
    		th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
			}
			th:first-child, td:first-child {
			  border-left: none;
			}
    		a {text-decoration-line: none;  color: #696969;}
			h2:hover {
			 box-shadow: 0 0 40px 40px #ffd700 inset;
			}
			.tr:hover {
				box-shadow: 0 0 40px 40px #f5f5f5 inset;
			}
    		h2,h4 {margin-top: 15px; text-align: center;}
    		.fourth {
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
			.check{
				box-shadow: 0 0 40px 40px #ffd700 inset;
			}
    	</style>
	</head>
	<script>
	// 삭제할 값을 전달받아 해당 파일로 보내는 function
	  function btnDeleteClick(deleteID) {
        document.form1.deleteID.value = deleteID;
        document.form1.action = "A_02_H.jsp";
        document.form1.submit();
	  } 
	// 입력받은 값의 한글,글자수 체크하는 function
	  function HangleCheck(input) {
	        var inputValue = input; // 입력 받는 변수 혹은 데이터베이스에서 가져온 값 등

	        if (inputValue.match("^[가-힣]{1,10}$")) {
	            return inputValue;
	        } else {
	            alert("한글 입력 오류");
	            return false; // 오류 발생 시 false를 반환하여 처리
	        }
	    }
	</script>
	<body>
<%		
	try{
		// DB연동 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.60:3307/kopo11","root","shdmf1030@");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/noheul","root","shdmf1030@");
		Statement stmt = conn.createStatement();
		
		request.setCharacterEncoding("utf-8");
		// null값 체크
        int Nullcheck = request.getParameter("HuboID") != null ? 1 : 0;
		
		String name = ""; // 변수 선언
		String id = ""; // 변수 선언
		
		if (Nullcheck == 1) { // 해당 변수 값이 1과 같으면 
			name = request.getParameter("name"); // 전달 값 저장
			id = request.getParameter("HuboID"); // 전달 값 저장
			stmt.execute("insert into HuboDB (name,id) values ('" + name + "'," + id +");"); // 전달 값 저장
			stmt.execute("insert into TupyoDB (hubo) values ('" +id+ "번" +name+ "')"); // 전달 값 저장
        }
		
		// ID칼럼의 전체 count 조회
				ResultSet total = stmt.executeQuery("select count(*) from HuboDB where id;");
				int totalcnt = 0; // 변수 초기값 지정
				while(total.next()){ 
					totalcnt = total.getInt(1);
				}
				
				// ID 최소값은 1
				int minID = 1;
				
				// ID칼럼의 count가 0일때(아직 아무 값도 안들어왔다는 뜻)
				if(totalcnt == 0){
					ResultSet idcount = stmt.executeQuery("select min(id) as minNum from HuboDB where (id+1) not in (select id from HuboDB);");
					
					while(idcount.next()){
						minID = idcount.getInt(1)+1;
					}
				}else{	// ID칼럼의 count가 0이 아닐때(값이 들어있다는 뜻)
					// ID칼럼의 전체 값 조회
					ResultSet idcount2 = stmt.executeQuery("select id from HuboDB");

					while (idcount2.next()) {
					    int currentID = idcount2.getInt("id"); // 현재 가져온 id 값
						// ID최소값과 currentID의 값이 일치하면 순서대로 있는 ID값 이므로 통과
					    if (minID == currentID) {
					    	minID++; // 다음 기대하는 id 값으로 업데이트
					    } else { // 칼럼 순회 중간에 빠진 값을 찾았으므로 break;
					        break;
					    }
				}
		}
%>		<!-- form 태그 -->
		<form name="form1" method = 'post'>
		<!-- input hidden 타입 지정 -->
		<input type='hidden' name='deleteID'> 
		<table>
    		<tr> <!-- 각 해당 셀 스타일 적용, 각각의 메뉴에 대한 링크 연결 -->
    			<td width = 25%><a align = center id="update" href="A_01_H.jsp" target="content"><h2 class="check">후보등록</h2></a></td>
    			<td width = 25%><a align = center id="vote" href="B_01_H.jsp" target="content"><h2>투표</h2></a></td>
    			<td width = 25%><a align = center id="result" href="C_01_H.jsp" target="content"><h2>개표결과</h2></a></td>
    			<td></td>
    		</tr>
		</table>
		<table>
			<tr>
<%			if(Nullcheck == 1){ %> <!-- 해당 변수 값이 1과 같으면  --> 
				<td colspan="4"><h4>후보등록 결과 : <%=id+"번"+" "+name %> 후보자 등록 완료</h4></td>
<%			} %>
				<!-- 뒤로 가기 클릭 시 A_01_H.jsp으로 이동 -->
				<td align = right width = 22%>
				<input class="fourth" type="submit" value="뒤로 가기" style="width: 70px; height: 30px; padding: 0px;font-weight: bold;" formaction = 'A_01_H.jsp'></td>
			</tr>
		</table>

		<table>
<%		
		if(totalcnt >= 1){ // 변수의 값이 1 이상일 때
		// id를 기준으로 순방향 정보 조회
		ResultSet rset = stmt.executeQuery("select * from HuboDB order by id asc;");
	        
	     	while (rset.next()){ 
%>				<!-- 셀 스타일 적용, 기호 번호,후보명에 대한 값을 보여준다 -->
	     		<tr class="tr">
	     			<td width =15%><strong>기호번호 :</strong></td>
	     			
	     			<td align = left width = 20% ><%=rset.getInt(2)%></td>
					
					<td width= 15% ><strong>후보명 :</strong></td>
	     			
	     			<td align = left width = 20% ><%=rset.getString(1)%></td>
					<!-- 삭제 클릭 시 function에 값 전달 실행 -->		
					<td align = right width = 20%>
					  <input class="fourth" type="button" value="삭제" style="width: 70px; height: 30px; padding: 0px;font-weight: bold;" onclick="btnDeleteClick('<%=rset.getInt(2)%>')">
					</td>
				</tr>
		</form>		
<%	      			
			}
		}
%>
<%	}catch(Exception e){
		out.println(e);
	} %>
	</body>
</html>
		