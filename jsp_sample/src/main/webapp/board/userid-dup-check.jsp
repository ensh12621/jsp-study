<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp" %>
	
	<%
		String userId = request.getParameter("userId");
		
		String sql = "SELECT 1 FROM TBL_USER WHERE USERID = '"+userId+"'";
		ResultSet rs = stmt.executeQuery(sql);
		
		boolean isDuplicated = rs.next();
		
	%>
	
	<div>
		<%if(isDuplicated){%>
			<h1>중복된 아이디입니다.</h1>
		<%}else{ %>
			<h1>사용가능한 아이디입니다.</h1>
		<%} %>
		<button onclick="fnClose()">
			되돌아가기
		</button>
	</div>
	
	
	<script type="text/javascript">
	
	
		function fnClose(){
			window.opener.handleDupCheckerResult(<%=isDuplicated%>);
			window.close();		
		}
	
	</script>
	
	

</body>
</html>