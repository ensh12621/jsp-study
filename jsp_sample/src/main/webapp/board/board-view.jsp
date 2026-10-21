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
		String boardNo = request.getParameter("boardNo");
		ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo);
	%>
		
		<%if(rs.next()){ %>
			<div style="width:700px; margin:0 auto;">
				<div style="display:flex; flex-direction:column; justify-content: space-between;">
					<h1>
						[<%=rs.getString("BOARDNO") %>]
						<%=rs.getString("TITLE") %>
					</h1>
					<p style="font-size:12px;">
						작성자:<%=rs.getString("USERID") %>
						/
						작성일: <%=rs.getString("CDATETIME") %>
					</p>
				</div>
				<p>
					<span style="font-size:20px; border-bottom:1px solid black; display:block;">내용</span>
					<br/>
					<%=rs.getString("CONTENTS") %>
				</p>
				<div style="border-top:1px solid black; margin:10px 0; padding:10px 0;">
					<a href="board-list.jsp">
						<button>목록으로</button>
					</a>
				</div>
			</div>
			
			
			
			
			
			
			
		<% }else{ %>
			<p>
				존재하지 않는 게시글입니다.
			</p>
			
			<a href="board-list.jsp">
				<button>목록으로</button>
			</a>
		<%} %>			
		
	

	<!-- 게시글번호, 제목, 내용, 작성자, 작성일 출력 -->

</body>
</html>