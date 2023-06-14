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
 				width: 80%; 
 				border-collapse: collapse;
 				border-width: 2px;
 				cellspacing="1"
   			}
   			tr,td{border-width: 2px;text-align : left;}
   			textarea,input{
   				width: 98%;
   				margin: 4px;
   				margin-left:5px;
   			}
			textarea:hover{
			 background-color: #f5f5f5; 
			}
			input:hover{
			 background-color: #f5f5f5; 
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
			span{
				margin-left:3px;
			}
		</style>
	</head>
	<script>
 	document.getElementById('myForm').addEventListener('submit', function(event) {
    event.preventDefault(); // form 제출 x
    location.href = 'freeboard_list.jsp';
  	});
	
 	function trimSpace(input) {
		  return input.replace(/^\s+/, '');
		}
 	
	function InputCheck(input) {
	  var inputValue = input; // 입력 받는 변수 혹은 데이터베이스에서 가져온 값 등
	  var pattern = /^(?!(&nbsp;|\s)*$).{1,70}$/;
	  
	  if(inputValue.trim().length === 0){
		alert("제목의 내용을 입력하세요");
	  	return false;
	  }else{
	    if (pattern.test(inputValue) && !inputValue.includes("&lt") && !inputValue.includes("&gt") 
	    	  && !inputValue.includes("&#60") && !inputValue.includes("&#62")
			  && !inputValue.includes("<") && !inputValue.includes(">")) {
	      return inputValue;
	    } else {
	      alert("제목에는 <,>는 사용할 수 없습니다.");
	      return false; // 오류 발생 시 false를 반환하여 처리
	    }
	  }
	}
	function validateForm() {
		var title = document.forms["myForm"]["title"].value;
		var content = document.forms["myForm"]["content"].value;
		
		title = trimSpace(title);
		
		if (InputCheck(title) == false) {
			return false;
		}
	</script>
	
	<body>
<%
	FreeBoardDao dao = new FreeBoardDaoImpl();

	request.setCharacterEncoding("utf-8"); // 전달 받는 값들의 인코딩 설정을 utf-8로 지정

	int id = dao.lastNumber(); // 비어있는 최소 값 찾기
	String date = dao.date();  // 날짜 값 저장
	Integer rootid = null;	   // 변수 선언
	Integer relevel = null;	   // 변수 선언
	Integer recnt = null;	   // 변수 선언
	
	if(request.getParameter("rootid")!=null){ // 전달 받은 값이 null이 아니면 true 조건
		rootid = Integer.parseInt(request.getParameter("rootid")); // 변수에 값 저장
		relevel = Integer.parseInt(request.getParameter("relevel"))+1; // 변수에 값 저장
		recnt = Integer.parseInt(request.getParameter("recnt"))+1; // 변수에 값 저장		
	}	
	
%>	<!-- form 메소드 post 지정 -->
	<form name="myForm" method="post" onsubmit="return validateForm()">
	<table border='1'> <!-- 테이블 테두리 1 지정 -->
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>번호</span></td>
			<td colspan='3' align='left' width= 85%><input type='text' name='id' value='<%=id%>' readonly style="all: unset; width:100px; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>제목</span></td>
			<td colspan='3' align= 'left' width= 85%><input type='text' maxlength='70' pattern="^(?!\s*$)(?!^*$){1,70}$" name= 'title' value='' 
			 title="앞공백 X, 70글자 이상 X" required></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>일자</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='date' value='<%=date%>' 
			readonly style="all: unset; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>내용</span></td>
			<td colspan='3' align= 'left' width= 85%>
			<textarea name="content"style="height: 200px;max-height: 150px; overflow-x: auto; overflow-y: scroll;resize: none;"maxlength="6000000"></textarea>
			</td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>원글</span></td>
			<td colspan='3' align='left' width = 85%><input type='text' name='rootid' value='<%=rootid%>' readonly style="all: unset; width:100px; margin-left:5px;"></td>
		</tr>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td bgcolor='#dde5ff' width= 15%><span>댓글수준</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='relevel' value='<%=relevel%>' readonly style="all: unset; width:100px; margin-left:5px;"></td>
			<td bgcolor='#dde5ff' width= 18%><span>댓글내 순서</span></td>
			<td align='left' width = 40% style="border:none;"><input type='text' name='recnt' value='<%=recnt%>' readonly style="all: unset; width:100px; margin-left:5px;"></td>
		</tr>
	</table>
	
	<table>
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td colspan='2' style="text-align:right;">
			<!-- 버튼 클릭 시 freeboard_list 이동 -->		
				<input class='fourth' type='button' value='취소' formaction = 'freeboard_list.jsp'
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"onclick="window.location.href = 'freeboard_list.jsp';">
			<!-- 버튼 클릭 시 freeboard_write.jsp 이동 -->				
				<input class='fourth' type='submit' value='저장' formaction = 'freeboard_write.jsp'
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>