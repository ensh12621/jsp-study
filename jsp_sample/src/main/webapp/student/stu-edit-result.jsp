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
		
		String sql = "update stu set name = '"+stuName+"', id='"+stuId+"', grade= "+grade+", deptno1 = " + deptNo + " where stuno = " + stuNo;
		out.println(sql);
		int nUpdated = stmt.executeUpdate(sql);
	%>
	
	<% if(nUpdated == 1){ %>
		<script type="text/javascript">
			alert("수정을 완료하였습니다.");
			location.href = "stu-view.jsp?stuNo=<%=stuNo%>";
		</script>	
	<%}else{ %>
		<script type="text/javascript">
			alert("수정 작업이 실패하였습니다.");
			history.back();
		</script>
	
	<%} %>

</body>
</html>