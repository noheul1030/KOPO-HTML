<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDao" %> <!--java import-->
<%@ page import="kopo11.dao.Home_PageDaoImpl" %> <!--java import-->

<html>
	<head>
		<style>
			/*테이블 스타일 지정*/
			table{
				margin-left: auto;
	  			margin-right: auto;			
			  	text-align: center; 
 				width: 80%; 
 				border-collapse: collapse;
 				border-width: 2px;
 				cellspacing="1"
   			}
   			/*tr, td 스타일 지정*/
   			tr,td{border-width: 2px;}
   			/*textarea,input 스타일 지정*/
   			textarea,input{
   				width: 98%;
   				margin: 4px;
   			}
   			/*input:hover 스타일 지정*/
			input:hover{
			 background-color: #f5f5f5; 
			}
			/*textarea:hover 스타일 지정*/
			textarea:hover{
			 background-color: #f5f5f5; 
			}
			/*버튼의 스타일 지정*/
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
		</style>		
	</head>
	
	<script>
		// input받는 값의 앞 공백 제거
		function trimSpace(input) {
		  return input.replace(/^\s+/, '');
		}
		// input받는 값의 유효성 검사(<,> 입력방지)
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
		      alert("제목에는 공백,<,>는 사용할 수 없습니다.");
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
			if (InputCheck(content) == false) {
				return false;
			}
			
		}
	</script>
	
	<body>
<%
	Home_PageDao dao = new Home_PageDaoImpl();
	
	int count = dao.lastNumber(); // 비어있는 최소 값 찾기
	
	String title = null;
	String date = dao.date(); // 날짜 값 저장
	
	dao.stmt().close();
%>	<form name="myForm" method="post" onsubmit="return validateForm()"> <!-- form 메소드 post 지정 -->
	<table border='1'> <!-- 테이블 테두리 1 지정 -->
		<tr><!-- 셀 스타일 지정,text 출력 -->
			<td width= 10% bgcolor='#fff6dd'>번호</td>
<%		if(count == 1){  // count의 값이 1이면 (아무 값도 안들어있다는 뜻) true 조건
			title = "공지사항"; %>
			<td align='left' width= 85%><input type='text' name='number' value='신규(insert)' readonly style="all: unset;margin-left:5px;"></td>
<%		}else{  // count의 값이 1이 아니면 (값이 들어있다는 뜻)
			title = "공지사항"+count; %>
			<td align='left' width= 85%><input type='text' name='number' value='<%=count%>' readonly style="all: unset;margin-left:5px;"></td>
<%		} %>
		</tr>
		<tr><!-- 셀 스타일 지정,text 출력 -->
			<td width= 10% bgcolor='#fff6dd'>제목</td>
			<!-- 값이 들어올때 유효성을 검사하고 맞지 않을 경우 경고문구 팝업 -->
			<td align= 'left' width= 85%><input type='text' maxlength='70' pattern="^(?!\s*$)(?!^\s*$)[^<>]{1,70}$" name= 'title' value='<%=title%>' 
			  required title="앞공백 X, 특수기호 '<','>'금지,70글자 이상 X"></td>
		</tr>
		<tr><!-- 셀 스타일 지정,text 출력 -->
			<td width= 10% bgcolor='#fff6dd'>일자</td>
			<td align='left' width = 85%><input type='text' name='date' value='<%=date%>' readonly style="all: unset;margin-left:5px;"></td>
		</tr>
		<tr><!-- 셀 스타일 지정,text 출력 -->
			<td width= 10% bgcolor='#fff6dd'>내용</td>
			<td align= 'left' width= 85%>
			<textarea name="content"style="height: 200px;max-height: 150px; overflow-x: auto; overflow-y: scroll;resize: none;"maxlength="6000000"></textarea>
			</td>
		</tr>
	</table>
	
	<table>
		<tr><!-- 셀 스타일 지정,text 출력 -->
			<td colspan='2' align='right'>
			<!-- 버튼 클릭 시 gongji_list.jsp 이동 -->
				<input class='fourth' type='submit' value='뒤로 가기' formaction = 'gongji_list.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"onclick="window.location.href = 'gongji_list.jsp';">
			<!-- 버튼 클릭 시 gongji_write.jsp 이동 -->		
				<input class='fourth' type='submit' value='저장' formaction = 'gongji_write.jsp' 
					style="width: 80px; height: 30px; padding: 0px;font-weight: bold;">
			</td>
		</tr>
	</table>
	</form> <!-- form 태그 종료 -->
	
	</body>
</html>