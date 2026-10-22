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
	%>
	<form name="frm" action="stu-add-result.jsp">

		<table>
			<tr>
				<th>학번</th>
				<td><input name="stuNo" /></td>
				
				<th>이름</th>
				<td><input name="stuName"></td>
			</tr>

			<tr>

				<th>아이디</th>
				<td><input name="stuId"></td>

				<th>학년</th>
				<td><select name="grade" style="width: 90%;">
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
						<option value="4">4학년</option>
				</select></td>
			</tr>

			<tr>
				<th>학과</th>
				<td colspan="3"><select name="deptNo">
					<%while (rs.next()) {%>
						<option value="<%=rs.getString("DEPTNO")%>"><%=rs.getString("DNAME")%></option>
					<%}%>
				</select></td>
			</tr>

		</table>

		<div class="btn-group">
			<input type="button" onclick="validateForm()"  value="학생추가">
			<input type="reset" value="초기화">
			<a href="stu-list.jsp">
				<button type="button">
					목록으로
				</button>
			</a>
		</div>

	</form>
	
	<script type="text/javascript">
	
		function validateForm(){
			const stuNo = document.frm.stuNo.value;
			console.log(stuNo);
			
			if(!/^[0-9]{4}$/.test(stuNo)){
				alert("학번은 숫자 4글자여야 합니다.")
				return;
			}
			
			document.frm.submit();
		}
	
	</script>
	
	
	



</body>
</html>