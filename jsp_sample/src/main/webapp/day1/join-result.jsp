<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
	%>
	
	<p style="fon-size:16px; font-weight:bold;">
		<span>아이디: <%=userId %></span>
		<span>비밀번호: <%=userPwd %></span>
	</p>
	<p>
		<span>이름: <%=userName %></span>
		<span>성별: <%=gender %></span>
	</p>
</body>
</html>