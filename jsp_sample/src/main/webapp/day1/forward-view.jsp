<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이동한 페이지</h1>

	<div>
		<p>
			이름:
			<%=request.getParameter("userName")%>
		</p>
		<p>
			나이:
			<%=request.getParameter("age")%>
		</p>


	</div>


</body>
</html>