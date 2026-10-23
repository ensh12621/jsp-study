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

.paging a{
	text-decoration: none;
	color:#000;
	margin-right:3px;
	
}

.active{
	font-weight:bold;
}

</style>


</head>
<body>


	<%@ include file="../db.jsp"%>
	
	<%
		// paging에 사용할 변수
		int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;
		int currentPage = request.getParameter("currentPage") != null ? Integer.parseInt(request.getParameter("currentPage")) : 1;
		int offset = (currentPage - 1) * pageSize;
		
	%>
	
	
	<%
		String keyword = request.getParameter("keyword");
		String grade = request.getParameter("grade");

		String order = request.getParameter("order");
		if(order == null){
			order = "dname";
		}
		
		
		if(keyword == null){
			keyword = "";
		}
		if(grade == null){
			grade = "";
		}
		String sql = "select s.STUNO, S.NAME, S.GRADE, S.ID, D.DNAME from stu s join department d on d.deptno = s.deptno1 where 1=1 ";
		if(keyword != ""){
			sql += " and S.NAME LIKE '%"+keyword+"%' ";
		}
		if(grade != ""){
			sql += " and S.GRADE = " + grade + " ";
		}
		
		if(order.equals("stuName")){
			sql += " ORDER BY S.NAME ASC ";
		}else if(order.equals("stuNo")){
			sql += " ORDER BY S.STUNO ASC ";
		}else if(order.equals("dname")){
			sql += " ORDER BY D.DNAME ASC ";
		}
		
		sql += " OFFSET " + offset +" ROWS FETCH NEXT " + pageSize + " ROWS ONLY ";
		
		System.out.println(sql);
	
		ResultSet rs = stmt.executeQuery(sql);
	%>
		
	<%
	
		String countQuery = "select count(*) as total from stu s join department d on d.deptno = s.deptno1 where 1=1 ";
		
		if(keyword != ""){
			countQuery += " and S.NAME LIKE '%"+keyword+"%' ";
		}
		if(grade != ""){
			countQuery += " and S.GRADE = " + grade + " ";
		}
	
		System.out.println(countQuery);
		
		ResultSet cntRs = stmt2.executeQuery(countQuery);
		cntRs.next();
		int total = cntRs.getInt("total");
		int pageList = (int)Math.ceil((double)total / pageSize);
		
		
	
	%>

		
	<%
		int gradeList[] = {1,2,3,4};	
	%>

	<form name="form" action="">
		<div style="margin-bottom: 20px;">

			<label> 검색어: <input name="keyword" value="<%=keyword%>">
				<button type="button" onclick="fnSearch()">검색</button>
			</label>

		</div>
		
		<div style="margin:15px 0;">
			<select name="grade" onChange="fnGradeChange()">
				<option value="">
					:: 전체 ::
				</option>
				<%for(int n : gradeList){ %>
					
					<option value="<%=n%>" <%= (grade != "" && Integer.parseInt(grade) == n) ? "selected" : "" %>><%=n %>학년</option>
					
				<%} %>
			</select>
		</div>
		
		<div style="margin:10px 0;">
			<%
				int[] pageArr = {5, 10, 20, 50};
			%>
			
			<select name="pageSize" onchange="fnPageSizeChange()">
				<%for(int i : pageArr){ %>
					<option value="<%=i%>" <%= pageSize == i ? "selected" : ""%>>
						<%=i %>개씩
					</option>				
				<%}	%>
			</select>
			
			|
			
			<label>
				<input type="radio" name="order" value="stuName" <%= order.equals("stuName")? "checked" : "" %> onclick="fnSearch()"> 이름순
			</label>
			<label>
				<input type="radio" name="order" value="stuNo" <%= order.equals("stuNo")? "checked" : "" %> onclick="fnSearch()"> 학번순
			</label>
			<label>
				<input type="radio" name="order" value="dname" <%= order.equals("dname")? "checked" : "" %> onclick="fnSearch()"> 학과순
			</label>
		</div>
		
		
		<hr>
		
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

		<div class="paging">
			<%if(currentPage != 1){ %>
			<a href="javascript:;" onclick="fnMove('prev')">◀</a>
			<%} %>
			
			<%for(int i=1; i<=pageList; i++){%>
				<% if(currentPage == i){%>
					<a href="javascript:;" class="active"><%=i %></a>	
				<% }else{%>
					<%-- <a href="?currentPage=<%=i%>&pageSize=<%=pageSize %>" ><%=i %></a> --%>
					<a href="javascript:;"  onclick="fnLoadPage(<%=i%>)"><%=i %></a>
				<% }%>
			
			<% } %>
			
			<%if(currentPage != pageList){ %>
				<a href="javascript:;" onclick="fnMove('next')">▶</a>
			<%} %>
		
		</div>
		
		

		<div>
			<a href="stu-add.jsp">
				<button type="button">학생추가</button>
			</a>

		</div>

		<input name="currentPage" type="hidden" value="<%=currentPage%>">

	</form>



	<script type="text/javascript">
		function fnSearch() {
			const form = document.form;
			form.currentPage.value = 1;
			form.submit();
		}
		
		function fnGradeChange(){
			console.log('test');
			const form = document.form;
			
			location.href = "stu-list.jsp?keyword="+form.keyword.value + "&grade="+ form.grade.value;
		}
		
		function fnPageSizeChange(){
			const form = document.form;
			form.currentPage.value = 1;
			form.submit();
		}
		function fnLoadPage(page){
			const form = document.form;
			form.currentPage.value = page;
			form.submit();
		}
		
		function fnMove(direction){
			const form = document.form;
			form.currentPage.value = direction == "prev" ? <%=currentPage%> - 1 : <%=currentPage%> + 1;
			form.submit();			
		}
	</script>
</body>


</html>






