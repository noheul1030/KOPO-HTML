

<%@ page import="kr.ac.kopo.ctc.kopo11.service.*,kr.ac.kopo.ctc.kopo11.dto.*" %>
<%@ page import="kr.ac.kopo.ctc.kopo11.dao.*" %>

<html>


<head>

</head>



<body>

<%
	StudentItemDao studentItemDao = new StudentItemDaoMock();
	
	StudentItemService studentItemService = new StudentItemServiceImpl();
	studentItemService.setStudentItemDao(studentItemDao);

	Pagination pagination = studentItemService.getPagination(1, 50);
%>





kopo11
<%=pagination.getC()%>

</body>


</html>