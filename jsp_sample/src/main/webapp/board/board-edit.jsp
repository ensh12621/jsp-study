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
		String sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		ResultSet rs = stmt.executeQuery(sql);
	%>
	
	
	<% if(rs.next()){ %>
	
		<%
			String kind = rs.getString("kind");
		%>
		
		<form name="frm" action="board-edit-result.jsp">
			<div>
				제목: <input name="title" value="<%=rs.getString("TITLE")%>">
			</div>
	
			<div>
				종류: <select name="kind">
					<option value="1" <%= kind.equals("1") ? "selected" : "" %>>공지사항</option>
					<option value="2" <%= kind.equals("2") ? "selected" : "" %> >자유게시판</option>
					<option value="3" <%= kind.equals("3") ? "selected" : "" %> >질문게시판</option>
				</select>
			</div>
	
			<div>
				내용:
				<textarea name="contents" rows="5" cols="20" style="resize: none;"><%=rs.getString("CONTENTS") %></textarea>
			</div>
	
			<div>
	
				<button type="button" onclick="submitForm()">수정하기</button>
				
				<a href="board-view.jsp?boardNo=<%=rs.getString("BOARDNO")%>">
					<button type="button">뒤로가기</button>
				</a>
			</div>
			<input type="hidden" name="boardNo" value="<%=rs.getString("BOARDNO")%>">
		</form>

	<%}else{ %>
		<p>
			게시글 정보가 없습니다.
		</p>	
		<button onclick="history.back();">
			되돌아가기
		</button>
		
	<%} %>


	<script type="text/javascript">
		function submitForm() {

			if (document.frm.title.value.length < 1
					|| document.frm.contents.value.length < 1) {
				alert("제목과 내용을 입력해주세요");
				return;
			}

			document.frm.submit();
		}
	</script>

</body>
</html>