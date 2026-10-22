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
		String stuName = request.getParameter("stuName");
		String stuId = request.getParameter("stuId");
		String grade = request.getParameter("grade");
		String deptNo = request.getParameter("deptNo");
		
		String sql = "INSERT INTO STU(STUNO, NAME, ID, GRADE, DEPTNO1) "
					+ "VALUES("+stuNo+", '"+stuName+"', '"+stuId+"', "+grade+", '"+deptNo+"')";
		int nUpdated = stmt.executeUpdate(sql);
	%>
	
	<%if(nUpdated == 1) {%>
		<script type="text/javascript">
			alert("게시글 등록이 완료되었습니다.");
			location.href = "stu-list.jsp";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("게시글 등록에 실패하였습니다.");
		</script>
	
		<button onclick="history.back();">
			되돌아가기
		</button>		
	<%} %>
	
</body>
</html>