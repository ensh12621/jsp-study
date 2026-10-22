<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


a{
	text-decoration: none;
}


</style>



</head>
<body>


	<%@ include file="../db.jsp"%>
	<%
		String stuNo = request.getParameter("stuNo");
		
		String query = "SELECT STUNO, NAME, GRADE, TO_CHAR(BIRTHDAY, 'RRMMDD') as BIRTHDAY, TEL, D.DNAME " +
						"FROM STU S JOIN DEPARTMENT D ON S.DEPTNO1= D.DEPTNO "
						+ "WHERE STUNO = " + stuNo;
		ResultSet rs = stmt.executeQuery(query);
		
	%>
	
	<div>
	
		<%if(rs.next()){%>
			<p>
				(<%=rs.getString("STUNO") %>) <%=rs.getString("NAME") %> <%=rs.getString("GRADE") %> 학년
			</p>
			<p>
				<%=rs.getString("BIRTHDAY")%> / tel: <%=rs.getString("tel") %> / 학과명: <%=rs.getString("DNAME") %>
			</p>
				
		<%}%>
	</div>
	
	<div>
		<a href="stu-edit.jsp?stuNo=<%=stuNo%>">
			<button>
				수정
			</button>
		</a>
		<button onclick="removeArticle()">
			삭제
		</button>
	</div>
	
	<script type="text/javascript">
	
	
	function removeArticle(){
		if(!confirm("정말로 삭제하시겠습니까?")){
			return;
		}	
		
		location.href = "stu-remove-result.jsp?stuNo=<%=stuNo%>";
	}
	
	</script>
	
	
	
	
</body>
</html>