<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>변수!</h1>

	<%!
		int num1 = 3;
		int num2 = 5;
	%>
	<h2>
		두 수의 합 : <%=num1+num2 %>
	</h2>

</body>
</html>