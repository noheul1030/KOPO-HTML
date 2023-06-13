<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %> <!--java import-->
<%@ page import="kopo11.dao.*,kopo11.dto.*,kopo11.service.*" %>

<html>
	<head>
		<style>
			input{
			 width : 70%;
			 height : 30px;
			 line-align : left;
			 margin-top : 4px;
			 margin-bottom : 4px;
			 margin-left : 4px;
			 margin-right : 4px;
			}
			input:hover{
			 background-color: #f5f5f5; 
			}
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
   			span{
   			 margin-left:5px;
   			}
   			h2{margin-top:20px;}
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
		</style>
	</head>
	<script>
		// 입력받는 이미지의 값에 대한 제한 조건
		//.gif, .jpg, .png의 이미지 파일에 대한 업로드만 가능하도록 구현하였다.
		function readURL(input) {
		  var fileExtensions = [".gif", ".jpg", ".png"];
		  var file = input.files[0];
		  var fileExtension = file.name.substring(file.name.lastIndexOf(".")).toLowerCase();

		  if (!fileExtensions.includes(fileExtension)) {
		    alert(".gif, .jpg, .png과 같은 이미지 파일만 업로드 가능합니다.");
		    input.value = ""; // 입력된 파일 초기화
		    return false;
		  }

		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('previewImg').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('previewImg').src = "";
		  }
		}
		// input받는 값의 앞 공백 제거
		function trimSpace(input) {
			  return input.replace(/^\s+/, '');
		}
		// input받는 값의 유효성 검사(<,> 입력방지, 글자수 20자)
		function InputCheck(input) {
		  var inputValue = input; // 입력 받는 변수 혹은 데이터베이스에서 가져온 값 등
		  var pattern = /^(?!(&nbsp;|\s)*$).{1,20}$/;
		  
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
		// input받는 값의 유효성 검사(<,> 입력방지, 글자수 70자)
		function InputCheck2(input) {
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
		// form안에 들어오는 id 값들의 유효성 검사 
		function validateForm() {
			var title = document.forms["myForm"]["name"].value;
			var content = document.forms["myForm"]["text"].value;
			
			title = trimSpace(title);
			
			if (InputCheck(title) == false) {
				return false;
			}
			if (InputCheck2(content) == false) {
				return false;
			}
			
		}
	</script>
	
	<body>
<%
	MarketDao dao = new MarketDaoImpl();
%>	
	<table border='2'> <!-- 테이블 테두리 2 지정 -->
		<tr> <!-- 셀 스타일 지정,text 출력 -->
			<td height='50px'><h2>(주)과일상회 재고 현황 - 상품등록</h2></td>
		</tr> <!-- 셀 스타일 지정,text 출력 -->
		<tr style="border-bottom:none;">
			<td>
		<!-- form 메소드 post 지정 submit 발생 시 해당 function 실행 -->
		<form  name="myForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
			<table border='1' class='table' style="text-align:left; table-layout: fixed;">		
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품 번호</span></td>
					<td colspan='2'><input pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" type='text' name='id' value='<%=dao.middleID()%>' title="숫자만 입력하세요." readonly></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품명</span></td>
					<td colspan='2'><input pattern="^{1,20}$" type='text' maxlength='20' name='name' value='' title="글자수 제한 20"
					  required></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>재고 현황</span></td>		
					<td colspan='2'><input pattern="^(?:100000000|[1-9][0-9]{0,8}?|0)$" type='text' name='inventoryCNT' value='' title="숫자만 입력하세요." required></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품등록일</span></td>		
					<td colspan='2'><span><%=dao.date()%></span></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>재고등록일</span></td>		
					<td colspan='2'><span><%=dao.date()%></span></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%'><span>상품설명</span></td>		
					<td colspan='2'><input pattern="^{1,70}$" maxlength='70' type='text' name='text' value='' title="상품설명을 입력하세요." 
					 required></td>
				</tr>
				<tr> <!-- 셀 스타일 지정,text 출력 -->
					<td bgcolor='#ffdddd' width='20%' rowspan='2'><span>상품사진</span></td>		
				</tr>
				<tr> <!-- 셀 스타일 지정,이미지 미리보기 출력 -->
					<td style="border-right: none;">
						<img id="previewImg" width="250" style="margin:10px;"/>
					</td> <!-- 이미지를 입력받는 태그, function으로 입력받는 파일의 유효성 검사 -->
					<td style="width: 200px; border-left: none; text-align: right;">
						<input type='file' accept='.gif, .jpg, .png' name='file' onchange="readURL(this);">	
					</td>
				</tr>
				
			</table>
			</td>
		</tr>
		<tr style="border-top:none;"> <!-- 셀 스타일 지정, 테두리 위에 선 없음-->
			<td>	
			<table class='table'>
				<tr> <!-- 셀 스타일 지정,이미지 미리보기 출력 -->
					<td width='15%' align = 'right'>
					<!-- 버튼 클릭 시 create_list.jsp 이동 -->
					<input class='fourth' type='button' value='등록 취소' formaction='create_list.jsp'
						style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"onclick="window.location.href = 'create_list.jsp';">
					<!-- 버튼 클릭 시 write.jsp 이동 -->
					<input class='fourth' type='submit' value='완료' formaction='write.jsp'
						style="width: 80px; height: 30px; padding: 0px;font-weight: bold;"> </td>
				</tr>
			</table>
			</form>
			</td>
		</tr>
	</table>	
	</body>
</html>