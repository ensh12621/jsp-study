<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	a{
		text-decoration: none;'
	}
</style>	



</head>
<body>


	<%@ include file="../db.jsp"%>
	<%
		String boardNo = request.getParameter("boardNo");
		
		String sql = "UPDATE TBL_BOARD SET CNT = CNT+1 WHERE BOARDNO = " + boardNo;
		int nUpdated = stmt.executeUpdate(sql);
		
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo);
		String sessionRole = (String) session.getAttribute("sessionRole");
		String sessionId = (String) session.getAttribute("sessionId");
		
	%>
	
		<%if(nUpdated != 1){ %>
			<p>
			 얘기치 못한 오류 발생
			</p>
		<%} %>
	
	
		
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
						/
						조회수: <%=rs.getString("CNT") %>						
					</p>
				</div>
				<p>
					<span style="font-size:20px; border-bottom:1px solid black; display:block;">내용</span>
					<br/>
					<%=rs.getString("CONTENTS") %>
				</p>
				<div style="border-top:1px solid black; margin:10px 0; padding:10px 0;">
					
					<%if(sessionId.equals(rs.getString("USERID")) || sessionRole.equals("A")){%>

						<a href="board-edit.jsp?boardNo=<%=rs.getString("BOARDNO")%>">
							<input type="button" value="수정" />
						</a>
						
						
						<input type="button" onclick="removeArticle('<%=rs.getString("BOARDNO") %>')" value="삭제" />
										
					<%} %>
					
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
		
	
	<script type="text/javascript">
	
	
		function removeArticle(boardNo){
			
			if(!confirm("정말로 삭제하시겠습니까?")){
				return;
			}
			location.href = "board-remove-result.jsp?boardNo=" + boardNo;
		}
		
	</script>
	
	
	

	<!-- 게시글번호, 제목, 내용, 작성자, 작성일 출력 -->

</body>
</html>