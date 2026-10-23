<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<%@ include file="db.jsp"%>
	<%
		String siQuery = "SELECT * FROM AREA WHERE GU IS NULL ORDER BY SI ASC";
		ResultSet rs = stmt.executeQuery(siQuery);
	%>
	
	<%
		String si = request.getParameter("si");
		String gu = request.getParameter("gu");
		String dong = request.getParameter("dong");
	%>
	
	<form name="form" action="area.jsp">
		<div>
			<select name="si" onchange="fnSelect()">
				<option value="">
					:: 선택 ::
				</option>
				<%while(rs.next()){ %>
					<option value="<%=rs.getString("si") %>" <%=si.equals(rs.getString("si"))? "selected" : "" %>>
						<%=rs.getString("si") %>
					</option>
				<%}%>
			</select>
				
			<%
				String guQuery = "SELECT * FROM AREA WHERE DONG IS NULL AND GU IS NOT NULL ";
			
				if(si != null){
					guQuery += " AND SI = '" + si + "' ";
				}
			
			
				ResultSet rs2 = stmt.executeQuery(guQuery);
			%>
			
			<select name="gu" onchange="fnSelect()">
				<option value="">
					:: 선택 ::
				</option>
				<%while(rs2.next()){ %>
					<option value="<%=rs2.getString("gu") %>" <%=gu.equals(rs2.getString("gu"))? "selected" : ""%>>
						<%=rs2.getString("gu") %>
					</option>
				<%}%>
			</select>
			
			<%
				String dongQuery = "SELECT * FROM AREA WHERE DONG IS NOT NULL AND GU IS NOT NULL ";
			
				if(gu != null){
					dongQuery += " AND SI = '"+si+"' ";
					dongQuery += " AND GU = '"+ gu +"'";
				}
			
			
				System.out.println(dongQuery);
				ResultSet rs3 = stmt.executeQuery(dongQuery);
				
			%>
			
			<select name="dong" onchange="fnSelect()">
				<option value="">
					:: 선택 ::
				</option>
				<%while(rs3.next()){ %>
					<option value="<%=rs3.getString("dong")%>" <%=dong.equals(rs3.getString("dong"))? "selected" : "" %>>
						<%=rs3.getString("dong") %>
					</option>
				<%}%>
			</select>
			
			
		</div>
	</form>
	
<script type="text/javascript">

function fnSelect(){
	document.form.submit();
}
</script>
	
</body>
</html>