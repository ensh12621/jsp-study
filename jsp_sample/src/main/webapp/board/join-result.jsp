<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../db.jsp"%>
	
	<%
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		
		String query = "INSERT INTO TBL_USER(USERID, PWD, NAME, CDATETIME, UDATETIME) VALUES ('"+userId+"', '"+userPwd+"', '"+userName+"', sysdate ,sysdate)";
		
		int nUpdated = stmt.executeUpdate(query);
	%>
	
	<% if(nUpdated == 1){ %>
	
		<p>
			회원가입이 완료되었습니다.
		</p>
		<a href="login.jsp">
			<button>로그인하기</button>
		</a>
		
	<%}else{ %>
		<p>
			얘기치 못한 오류가 발생하였습니다.
		</p>
		<button onclick="history.back();">뒤로가기</button>
	<% } %>

</body>
</html>