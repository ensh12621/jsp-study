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
	
	<form name="form" action="">
		
		<div>
			<%
				String sql = "SELECT DEPTNO, DNAME FROM DEPARTMENT WHERE PART IS NULL";
				ResultSet rs = stmt.executeQuery(sql);
				System.out.println("deptno1 query => " + sql);
				String deptNo1Param = request.getParameter("deptNo1");
			%>
	
		
			<select name="deptNo1" onchange="submitFrm()">
				<option value="">선택</option>
				<%while(rs.next()){ %>
					<option value="<%=rs.getString("DEPTNO")%>" <%=rs.getString("DEPTNO").equals(deptNo1Param)? "selected": "" %>>
						<%=rs.getString("DNAME") %>
					</option>
				<%} %>
			</select>
			
			
			<%
				String sql2 = "SELECT * FROM DEPARTMENT WHERE PART = " + deptNo1Param;
				ResultSet rs2 = stmt.executeQuery(sql2);
				System.out.println("deptno2 query => " + sql2);
				String deptNo2Param = request.getParameter("deptNo2");
			%>
			
			<select name="deptNo2" onchange="submitFrm()">
				<option value="">선택</option> 
				<%while(rs2.next()){ %>
					<option value="<%=rs2.getString("DEPTNO")%>" <%= rs2.getString("DEPTNO").equals(deptNo2Param)? "selected" : "" %>>
						<%=rs2.getString("DNAME") %>
					</option>
				<%} %>
			</select>
			
			
			<%
				String sql3 = "select * from department where part = " + deptNo2Param;
				ResultSet rs3 = stmt.executeQuery(sql3);
				System.out.println("deptno3 query => " + sql3);
				String deptNo3Param = request.getParameter("deptNo3");
			%>
			
			<select name="deptNo3" onchange="submitFrm()">
				<option value="">선택</option> 
				<%while(rs3.next()){ %>
					<option value="<%=rs3.getString("DEPTNO")%>" <%=rs3.getString("DEPTNO").equals(deptNo3Param)? "selected" : "" %>>
						<%=rs3.getString("DNAME") %>
					</option>
				<%} %>
			</select>
			
		</div>
		
		
		
	</form>
	
	<script type="text/javascript">
	
	function submitFrm(){
		document.form.submit();
	}
	
	</script>
	
	

</body>
</html>