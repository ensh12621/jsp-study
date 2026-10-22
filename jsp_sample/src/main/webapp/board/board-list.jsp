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
	String query = "SELECT * FROM TBL_BOARD";
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
	<hr>

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
	
	</script>	


</body>
</html>


