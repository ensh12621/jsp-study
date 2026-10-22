<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style type="text/css">
table, tr, td, th {
	border: 2px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
}

a{
text-decoration: none;
}

td input {
	width: 270px;
	height: 25px;
}

th {
	padding: 10px;
}

th {
	background: #eee;
}

td {
	width: 300px;
	text-align: left;
	padding: 10px;
}

.btn-group{
	margin:10px 3px;
}

</style>



</head>
<body>

	<%@ include file="../db.jsp"%>
	<%
	String sql = "select * from department where dname like '%학과%'";
	ResultSet rs = stmt.executeQuery(sql);
	
	String stuNo = request.getParameter("stuNo"); 
	
	String sql2 = "SELECT STUNO, NAME, ID, GRADE, BIRTHDAY, TEL, D.DNAME, D.DEPTNO "
				+ " FROM STU S JOIN DEPARTMENT D ON S.DEPTNO1= D.DEPTNO "
				+ " WHERE STUNO = " + stuNo;
	ResultSet rs2 = stmt2.executeQuery(sql2);
	rs2.next();
	
	String grade = rs2.getString("GRADE");
	String dname = rs2.getString("DNAME");
	
	%>
	<form name="frm" action="stu-edit-result.jsp">

		<table>
			<tr>
				<th>학번</th>
				<td><input name="stuNo" value="<%=rs2.getString("STUNO") %>" disabled /></td>
				
				<th>이름</th>
				<td><input name="stuName" value="<%=rs2.getString("NAME")%>"></td>
			</tr>

			<tr>

				<th>아이디</th>
				<td><input name="stuId" value="<%=rs2.getString("ID")%>"></td>

				<th>학년</th>
				<td><select name="grade" style="width: 90%;">
						<option value="1" <%= grade == "1"? "selected":"" %>>1학년</option>
						<option value="2" <%= grade == "2"? "selected":"" %>>2학년</option>
						<option value="3" <%= grade == "3"? "selected":"" %>>3학년</option>
						<option value="4" <%= grade == "4"? "selected":"" %>>4학년</option>
				</select></td>
			</tr>

			<tr>
				<th>학과</th>
				<td colspan="3"><select name="deptNo">
					<%while (rs.next()) {%>
						<option 
							<%= rs.getString("DEPTNO").equals(rs2.getString("DEPTNO"))? "selected" : "" %> 
							value="<%=rs.getString("DEPTNO")%>">
								<%=rs.getString("DNAME")%>
							</option>
					<%}%>
				</select></td>
			</tr>

		</table>

		<div class="btn-group">
			<input type="submit" value="수정하기">
			<input type="reset" value="초기화">
			<a href="stu-list.jsp">
				<button type="button">
					목록으로
				</button>
			</a>
		</div>

		<input type="hidden" name="stuNo" value="<%=stuNo%>">

	</form>
	
	<script type="text/javascript">
	
	
	</script>
	
	
	



</body>
</html>