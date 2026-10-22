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
</style>


</head>
<body>


	<%@ include file="../db.jsp"%>
	<%
		String keyword = request.getParameter("keyword");
		String grade = request.getParameter("grade");
		String sql = "select s.STUNO, S.NAME, S.GRADE, S.ID, D.DNAME from stu s join department d on d.deptno = s.deptno1 where 1=1 ";
		if(keyword != null){
			sql += " and S.NAME LIKE '%"+keyword+"%'";
		}
		if(grade != null){
			sql += " and S.GRADE = " + grade;
		}
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
	%>
		
	<%
		int gradeList[] = {1,2,3,4};	
	%>

	<form name="form" action="">
		<div style="margin-bottom: 20px;">

			<label> 검색어: <input name="keyword" value="<%=keyword%>">
				<button onclick="fnSearch()">검색</button>
			</label>

		</div>
		
		<div style="margin:15px 0;">
			<select name="grade">
				<%for(int n : gradeList){ %>
					<option value="<%=n%>" <%= (Integer.parseInt(grade) == n) ? "selected" : "" %>><%=n %>학년</option>
					
				<%} %>
			</select>
		</div>
		
		


		<table>
			<thead>
				<tr>
					<th>학번</th>

					<th>이름</th>
					<th>학년</th>
					<th>아이디</th>

					<th>학과명</th>
				</tr>
			</thead>
			<tbody>
				<%while (rs.next()) {%>
					<tr>
						<td><%=rs.getString("STUNO")%></td>
	
						<td>
							<a href="stu-view.jsp?stuNo=<%=rs.getString("STUNO")%>">
								<%=rs.getString("NAME")%>
							</a>
						</td>
	
						<td><%=rs.getString("GRADE")%></td>
	
						<td><%=rs.getString("ID")%></td>
	
						<td><%=rs.getString("DNAME")%></td>
	
					</tr>
				<%}%>
			</tbody>


		</table>

		<div>
			<a href="stu-add.jsp">
				<button>학생추가</button>
			</a>

		</div>

	</form>



	<script type="text/javascript">
		function fnSearch() {
			const form = document.form;
			location.href = "stu-list.jsp?keyword="+form.keyword.value;
		}
	</script>
</body>
</html>