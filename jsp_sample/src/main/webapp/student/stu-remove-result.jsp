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
		String stuNo = request.getParameter("stuNo");
	
		String sql = "DELETE FROM STU WHERE STUNO = " + stuNo;
		int nUpdated = stmt.executeUpdate(sql);
	%>
	
	<%if(nUpdated == 1){ %>
		<script type="text/javascript">
			alert("게시글 삭제 성공");
			location.href = "stu-list.jsp";
		</script>	
		
	<%}else{ %>
		<script type="text/javascript">
			alert("게시글 삭제 실패");
		</script>
		
		<button onclick="history.back();">
			되돌아가기
		</button>
		
	<%} %>

</body>
</html>