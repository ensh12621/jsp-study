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

.paging{
	display:flex;
	gap:5px;
}

.paging a{
	text-decoration: none;
}

.paging a.active{
	font-weight:bold;
	color:yellowgreen;
}

</style>



</head>
<body>


	<%@ include file="../db.jsp"%>
	
	<%
		int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;
		int currentPage = request.getParameter("currentPage") != null ? Integer.parseInt(request.getParameter("currentPage")) : 1;
		int offset = (currentPage - 1) * pageSize;
		
	%>
	
	<%
		String query = "SELECT * FROM TBL_BOARD";
		
		query += " OFFSET " + offset +" ROWS FETCH NEXT " + pageSize + " ROWS ONLY ";
		
		ResultSet rs = stmt.executeQuery(query);
		String sessionRole = (String) session.getAttribute("sessionRole");
		String sessionId = (String) session.getAttribute("sessionId");
	
	%>
	


	<div style="display:flex; align-items:center; gap:20px;">
		<h1><%=session.getAttribute("sessionName") %>님 어서오세요</h1>
		<a href="login.jsp">
			<button>
				로그아웃
			</button>
		</a>
	</div>

	<hr>

	<h1>게시글 목록</h1>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>삭제</th>
			</tr>
		</thead>

		<tbody>

			<%while (rs.next()) {%>
				<tr>
					<td>
						<%=rs.getString("BOARDNO") %>
					</td>
					
					<td>
						<a href="javascript:;" onclick="fnView(<%=rs.getString("BOARDNO")%>)">
							<%=rs.getString("TITLE") %>
						</a>
					</td>
					
					<td>
						<%=rs.getString("USERID") %>
					</td>
					
					<td>
						<%=rs.getString("CNT") %>
					</td>
					<td>
						<%if(sessionId.equals(rs.getString("USERID")) || sessionRole.equals("A")){ %>
							<button onclick="removeArticle('<%=rs.getString("BOARDNO") %>')">
								삭제
							</button>
						<%} %>
					</td>
					
				</tr>
			<%}%>
		</tbody>
	</table>
	
	<%
		// paging에 사용할 변수
		
		String countQuery = "SELECT COUNT(*) as cnt FROM TBL_BOARD";
		rs = stmt.executeQuery(countQuery);
		rs.next();
		
		int total = rs.getInt("cnt");
		int pageList = (int)Math.ceil((double)total / pageSize);
		
	%>
	
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
		<button onclick="fnNew()">
			글쓰기
		</button>
	</div>

	<script type="text/javascript">
		
		function fnView(boardNo){
			location.href = "board-view.jsp?boardNo=" + boardNo;
		}
		
		function fnNew(){
			location.href = "board-add.jsp";
		}
		
		function removeArticle(boardNo){
			if(!confirm("삭제 ㄱㄱ?")){
				return;
			}
			
			
			location.href = "board-remove-result.jsp?boardNo=" + boardNo;
		}
	
		function fnLoadPage(pageNo){
			
			location.href = "?currentPage=" + pageNo;
		}		
	</script>	


</body>
</html>


